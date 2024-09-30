#' Title
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return object$The_residuals
#' @export
resid.linreg <-
function(object, ...) {
  return(object$The_residuals)
}
