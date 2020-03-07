library(keras)
library(tidyverse)
library(shiny)
library(DT)

# load vgg19 model pretrained with imagenet
model = application_vgg19(weights = 'imagenet')

labels_tbl = read_csv("supp/labels_tbl.csv")

# define image preprocessor for use with keras vgg19
image_preprocessor = function(image_path) {
  image = image_load(image_path, target_size = c(224,224))
  image = image_to_array(image)
  image = array_reshape(image, c(1, dim(image)))
  image = imagenet_preprocess_input(image)
  return(image)
}

# Prediction based on image, with added labels
pred_cats_dogs = function(model, file_name){
  processed_image = image_preprocessor(file_name)
  
  imagenet_decode_predictions(predict(model, processed_image))[[1]] %>%
    left_join(labels_tbl, by = "class_description")
}