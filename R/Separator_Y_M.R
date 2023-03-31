#Using this function, we can extract the Year and Month information from a seismic catalog for a more detailed analysis
#This function works with seismic catalog data where the time_value variable is expressed in the format Year-Month-Day and UTC Time.
SepYM<-function(catalogo){
  catalogo$time_value<-as.Date(catalogo$time_value, "%Y-%m-%d",  tz="UTC")
  catalogo$year<- format(catalogo$time_value, "%Y")
  catalogo$month<-format(catalogo$time_value, "%m")
  return(catalogo)
}
