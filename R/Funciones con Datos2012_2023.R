library("readr"); library("magrittr"); library("dplyr")
cat12_23 <- read_csv("C:/Users/Seddav/Desktop/Clases/Tesis/Sismos/Datos/Catálogo Sísmico 2011/cat_origen_2012_feb2023.txt", 
                                    skip = 52)
#Y-M-D
cat12_23$time_value <- as.Date(cat12_23$time_value, "%Y-%m-%d",  tz="UTC")
cat12_23$year <- format(cat12_23$time_value, "%Y")
cat12_23$month <- format(cat12_23$time_value, "%m")

#comprovar si existen valores NA
sum(is.na(cat12_23$month))

#1.Función para separar año y mes de un catálogo sísmico 
SepYM<-function(catalogo){
  catalogo$time_value<-as.Date(catalogo$time_value, "%Y-%m-%d",  tz="UTC")
  catalogo$year<- format(catalogo$time_value, "%Y")
  catalogo$month<-format(catalogo$time_value, "%m")
  return(catalogo)
}
##Ejemplo1
AMC<-RecatYM(cat12_23)

#2.Función para obtener la magnitud media de los simos por año
MeanSY<-function(catalogoYM, Y){
  Mean_Y<- catalogoYM %>% filter(year==Y) %>% 
    summarise(mean_magnitude = mean(magnitude_value_P)) %>% 
    pull(mean_magnitude)
  return(Mean_Y)
}

#3. Función para obtener la magnitud media de los sismos por mes
MeanSYM<-function(catalogoYM, Y, M){
  Mean_YM<- catalogoYM %>% filter(year==Y) %>% filter (month==M) %>% 
    summarise(mean_magnitude = mean(magnitude_value_P)) %>% 
    pull(mean_magnitude)
  return(Mean_YM)
}
##Ejemplo2
MeanSY(AMC, "2016")
##Ejemplo3
MeanSYM(AMC, "2016", "12")

#4. Función para Graficación
Profsism_Y<-function(catalogoYM, Y){
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

#Ejemplo 4
Profsism_Y(AMC, 2012)
  
#Paletas de colores
RColorBrewer::display.brewer.all()





