#' Title
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return  print the sum
#' @export
summary.linreg <- function(object, ...){
  Estimate = object$Regressions_coefficients[1, ] 
  Std.Error = object$standard_error
  t_value = object$t_value
  p_value = object$p_value
  
  significance <- symnum(p_value, corr = FALSE, na = FALSE, cutpoints = c(0,.001,.01,.05,.1,1),
                         symbols = c("***", "**", "*","."," ")
    
  )
  
  df <- data.frame(
    Estimate = Estimate,
    Std.Error = Std.Error,
    t_value = t_value,
    p_value = significance
  )
  
  rownames(df) <- colnames(object$Regressions_coefficients) 

  cat("\nCoefficients:\n")
  print(df)
  cat("Residual standard error:", object$Residual_standard_error, "on", object$The_degrees_of_freedom, "degrees of freedom\n")
}


