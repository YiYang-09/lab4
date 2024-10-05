#' Simple overview of the fitted model, showing important coefficients and statistics
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return The result of the method applied to the class of the input object.
#' @export
#'
print <-
  function(object,...) {
    UseMethod("print")
  }
