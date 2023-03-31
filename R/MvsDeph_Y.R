#This function creates a graph of Month vs Depth for a specific year from the seismic catalog, with points that represent the magnitude_value_P
Dephsism_Y<-function(catalogoYM, Y){
  PSism_Y<-catalogoYM %>% filter(year==Y)

  Graf<-ggplot(PSism_Y, aes(x=month, y=depth_value, size=magnitude_value_P, color=magnitude_value_P))+
    scale_y_reverse()+
    theme_bw()+
    geom_point(alpha=0.3)+
    guides(size=guide_legend(title=""),
           color=guide_legend(title=""))+
    theme(legend.position = "bottom")+
    labs(title=paste("Profundidad y magnitud de sismos en el año", Y),x="Meses",y="Profundidad", guide="m")
  return(Graf)
}
