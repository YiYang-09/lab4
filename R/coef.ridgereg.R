#' Coefficients of the formula
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return object$coefficients
#' @export
coef.ridgereg <-
  function(object,...){
    return(object$coefficients)
  }