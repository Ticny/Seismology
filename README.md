Seismology: a demo package
===============================================

This is a demo package from R4DS course.
This package allows for the manipulation and presentation of seismic catalog data, which can be separated by years and months for greater ease. 

- e-mail: seddav2@gmail.com

Functions
---------
- SepYM:	Separate the year and month
- Depsism_Y:	Dotplot with month, depth and magnitude
- MeanS4YM:	Mean seismic magnitude for year and month
- MeanSY:	Mean seismic magnitude for year

Description of variables 
------------------------
#We work with a catalog with the vatiables: 
- time_value: Year, month, day and time of recording of a seismic event 
- depth_value: Depth (Km) of the seismic event
- magnitude_value_P: P-wave magnitude of the event 

Installation and loading
------------------------

-   Install the latest version from [GitHub](https://github.com/Ticny/Seismology) as follow:

```r
# Install
#> Loading required package: ggplot2, dplyr and magrittr
if(!require(devtools)) install.packages("devtools")
if(!require(dplyr)) install.packages("dplyr")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(magrittr)) install.packages("magrittr")
devtools::install_github("Ticny/Seismology")
```
```r
library(Seismology)
```



