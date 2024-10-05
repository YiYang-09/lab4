#' extracts the residuals from the fitted model.
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
