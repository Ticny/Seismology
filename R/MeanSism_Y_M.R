#With this function, we can calculate the mean seismic magnitude for a specific year and month
#Generally, seismic events with low magnitudes are more common than those with higher magnitudes
#Therefore, the mean magnitude value typically ranges from 3 to 4.
#Large differences in the mean magnitude value may indicate issues with the catalog or calculations.
MeanSYM<-function(catalogoYM, Y, M){
  Mean_YM<- catalogoYM %>% filter(year==Y) %>% filter (month==M) %>%
    summarise(mean_magnitude = mean(magnitude_value_P)) %>%
    pull(mean_magnitude)
  return(Mean_YM)
}
