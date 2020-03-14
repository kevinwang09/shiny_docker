install.packages(c("shinydashboard"))

install.packages(c("devtools", "shiny", "tidyverse", 
                   "DT", "jpeg", "bomrang", "patchwork", "forecast"))

devtools::install_github(c("rstudio/keras", 
                           "rstudio/tensorflow",
                           "GuangchuangYu/nCov2019"))

library(keras)
install_keras()

library(tensorflow)
install_tensorflow()