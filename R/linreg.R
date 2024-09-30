#' Title
#'
#' @param formula A symbolic description of the model to be fitted
#' @param data A data frame containing the variables in the model
#' @param method method of OLS or QR
#'
#' @return different methods of function
#' @export
linreg <- function(formula, data, method = c("ols", "qr")) {
  method <- match.arg(method)
  call <- match.call()
  if (method == "ols") {
    result <- (linreg_ols(formula, data))
  } else if (method == "qr") {
    result <- (linreg_qr(formula, data))
  }
  result$call <- call
  return(result)
}
