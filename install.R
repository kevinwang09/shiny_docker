install.packages(c("shinydashboard"))

install.packages(c("devtools", "shiny", "tidyverse", "DT", "jpeg"))
devtools::install_github("rstudio/keras")
library(keras)
install_keras()

devtools::install_github("rstudio/tensorflow")
library(tensorflow)
install_tensorflow()

library(reticulate)
os <- import("os")
os$listdir(".")
reticulate::py_config()