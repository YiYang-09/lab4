#' linear regression with ols method.
#'
#' @param formula A symbolic description of the model to be fitted
#' @param data A data frame containing the variables in the model
#'
#' @importFrom stats median model.matrix pt
#' @return statistics
linreg_ols<-
function(formula,data){
  X <- model.matrix(formula,data)
  vars <- all.vars(formula)
  y <- data[[vars[1]]]
  
  beta_hat <- as.numeric(solve(t(X)%*%X)%*%t(X)%*%y)
  names(beta_hat) <- colnames(X)
  y_hat <- X%*%beta_hat
  e_hat <- y - y_hat   #residuals
  standard_residual <- sqrt(abs(e_hat))
  
  df <- nrow(X)-ncol(X)
  
  residual_variance <- as.numeric(t(e_hat)%*%e_hat)/df
  Residual_standard_error <- sqrt( residual_variance)
  
  Var_hat <- residual_variance*solve(t(X)%*%X)
  standard_error <- sqrt(diag(Var_hat))
  t_value <- beta_hat/sqrt(diag(Var_hat))
  p_value <- pt(-abs(t_value),df)
  
  statistics <- list(
    call = match.call(),
    formula = formula,
    data = data,
    Regressions_coefficients = t(beta_hat),
    The_fitted_values = y_hat,
    The_residuals = e_hat,
    standard_error = standard_error,
    standard_residual = standard_residual,
    The_degrees_of_freedom = df,
    The_residual_variance = residual_variance,
    Residual_standard_error = Residual_standard_error,
    The_variance_of_the_regression_coefficients = Var_hat,
    t_value = t_value,
    p_value = p_value
  )
  class(statistics) <- "linreg"
  return(statistics)
}
