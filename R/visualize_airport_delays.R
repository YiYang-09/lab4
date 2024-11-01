#' Visualize_airport_delays
#'
#' @export
#'
visualize_airport_delays <- function(){
  airport_delays <- flights %>%
    filter(!is.na(arr_delay)) %>%  
    group_by(dest) %>%             
    summarize(mean_delay = mean(arr_delay, na.rm = TRUE)) %>%  
    inner_join(airports, by = c("dest" = "faa"))              
  
  ggplot(airport_delays, aes(x = lon, y = lat, size = mean_delay, color = mean_delay)) +
    geom_point(alpha = 0.7) +
    scale_color_gradient(low = "blue", high = "red") +
    labs(title = "Mean Flight Delay by Airport",
         x = "Longitude",
         y = "Latitude",
         size = "Mean Delay (minutes)",
         color = "Mean Delay (minutes)") +
    theme_minimal()
}