Seismology: a demo package
===============================================

This is a demo package from R4DS course.
This package allows for the manipulation and presentation of seismic catalog data, which can be separated by years and months for greater ease


Installation and loading
------------------------

-   Install the latest version from [GitHub](https://github.com/Ticny/Seismology) as follow:

 '''r
# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("Ticny/Seismology")


Distribution
------------

 '''r
library(Seismology)
#> Loading required package: ggplot2
# Create some data format
# :::::::::::::::::::::::::::::::::::::::::::::::::::
set.seed(1234)
potencia(3,2)
#> 9
