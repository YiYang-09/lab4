#' Title
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return df print the sum
#' @export
summary.linreg <- function(object, ...){
  Estimate = object$Regressions_coefficients[1, ] 
  Std.Error = object$standard_error
  t_value = object$t_value
  p_value = object$p_value
  
  significance <- rep("", length(p_value))
  for (i in 1:length(p_value)) {
    if (p_value[i] < 0.001) {
      significance[i] <- "***"
    } else if (p_value[i] < 0.01) {
      significance[i] <- "**"
    } else if (p_value[i] < 0.05) {
      significance[i] <- "*"
    } else if (p_value[i] < 0.1) {
      significance[i] <- "."
    }
  }
  
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


