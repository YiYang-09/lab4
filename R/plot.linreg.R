#' Title
#'
#' @param object A model object
#' @param ... Additional arguments
#'
#' @return p1+p2
#' @import ggplot2
#' @import patchwork 
#' @export 
plot.linreg <- function(object,...){
  p1 <- ggplot(data = object$data, mapping = aes(x= object$The_fitted_values, y = object$The_residuals)) +
    geom_point()+
    stat_summary(fun = median, geom = "line", color = "red")+
    labs(
      title = "Residuals vs Fitted",
      x = "Fitted values",
      y = "Residuals"
    )
  
  
  p2 <- ggplot(data = object$data, mapping = aes(x= object$The_fitted_values, y = object$standard_residual)) +
    geom_point()+
    stat_summary(fun = median, geom = "line", color = "red")+
    labs(
      title = "Scale_Location",
      x = "Fitted values",
      y = "standard_residual"
    )
  p1+p2
  
}

