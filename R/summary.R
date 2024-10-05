#' Detailed report of the model’s coefficients and other statistics
#'
#' @param object A model object
#' @param ... Additional arguments 
#'
#' @return The result of the method applied to the class of the input object.
#' @export
#'
summary <-
  function(object, ...) {
    UseMethod("summary")
  }
