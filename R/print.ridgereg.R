#' Simple overview of the fitted model, showing important coefficients and statistics
#'
#' @param ... Additional arguments
#' @param object object
#'
#' @return print the formula, data and coefficients
#' @export
print.ridgereg <- function(object, ...){
  cat("Call:\n")
  print(object$call)
  cat("\nCoefficients:\n")
  print(object$coefficients)
}