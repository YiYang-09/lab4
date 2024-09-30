#' Title
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return print the formula, data and coefficients
#' @export
print.linreg <-function(object,...){
  cat("Call:\n")
  print(object$call)
  cat("\nCoefficients:\n")
  print(object$Regressions_coefficients)
}
