#' Plots to evaluate the model
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return The result of the method applied to the class of the input object.
#' @export
#'
plot <-
  function(object,...) {
    UseMethod("plot")
  }
