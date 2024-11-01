#' Linear regression with ridge 
#'
#' @param formula A symbolic description of the model to be fitted
#' @param data A data frame containing the variables in the model
#' @param lambda Regularization parameter
#'
#' @importFrom stats median model.matrix pt
#' @return statistics
#' @export
#'
ridgereg <- function(formula, data, lambda){
  X <- model.matrix(formula, data)
  vars <- all.vars(formula)
  y <- data[[vars[1]]]
  
  n <- nrow(X)
  p <- ncol(X)
  
  ridge_penalty <- diag(p)
  ridge_penalty[1,1] <- 0  
  
  XtX_lambdaI <- t(X) %*% X + lambda * ridge_penalty
  beta_hat_ridge <- as.numeric(solve(XtX_lambdaI) %*% t(X) %*% y)
  names(beta_hat_ridge) <- colnames(X)
  
  y_hat <- X %*% beta_hat_ridge
  e_hat <- y - y_hat   
  
  df <- n - p
  
  residual_variance <- sum(e_hat^2) / df
  Residual_standard_error <- sqrt(residual_variance)
  
  Var_beta_hat <- residual_variance * solve(XtX_lambdaI) %*% t(X) %*% X %*% solve(XtX_lambdaI)
  standard_error <- sqrt(diag(Var_beta_hat))
  
  statistics <- list(
    call = match.call(),
    formula = formula,
    data = data,
    lambda = lambda,
    coefficients = beta_hat_ridge,
    fitted_values = y_hat,
    residuals = e_hat,
    standard_error = standard_error,
    degrees_of_freedom = df,
    residual_variance = residual_variance,
    residual_standard_error = Residual_standard_error,
    variance_covariance_matrix = Var_beta_hat
  )
  class(statistics) <- "ridgereg"
  return(statistics)
}