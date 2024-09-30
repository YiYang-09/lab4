#' Title
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return object$Regressions_coefficients
#' @export
coef.linreg <-
function(object,...){
  return(object$Regressions_coefficients)
}
