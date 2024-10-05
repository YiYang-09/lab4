#' Extracts the residuals from the fitted model
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return The result of the method applied to the class of the input object.
#' @export
#'
resid <-
function(object, ...) {
  UseMethod("resid")
}
