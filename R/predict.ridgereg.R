#' Fitted values 
#'
#' @param object A model object
#' @param ... Additional arguments
#' @param newdata newdata
#'
#' @return object$The_fitted_values
#' @export
#'
predict.ridgereg <- function(object, newdata, ...) {
  if (!missing(newdata)) {
    
    newdata <- model.matrix(formula(object), data = newdata)
    
    if (ncol(newdata) != length(object$coefficients)) {
      stop("The number of columns in newdata does not match the number of coefficients.")
    }
    predictions <- newdata %*% object$coefficients
    return(as.vector(predictions))
  } else {
    stop("No newdata provided for prediction.")
  }
}


