#' Coefficients of the formula
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return The result of the method applied to the class of the input object.
#' @export
#'
coef <-
  function(object, ...) {
    UseMethod("coef")
  }
