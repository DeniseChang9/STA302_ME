#### Preamble ####
# Purpose: Download data on Paris EDA
# Author: Denise Chang
# Date: 4 March 2024 
# Prerequisite: None


#### Workspace setup ####
library(tidyverse)
library(arrow)
library(janitor)

url <-
  paste0(
    "http://data.insideairbnb.com/france/ile-de-france/",
    "paris/2023-12-12/data/listings.csv.gz"
  )

airbnb_data <-
  read_csv(
    file = url,
    guess_max = 20000
  )

write_csv(airbnb_data, "week_8/inputs/airbnb_data.csv")

airbnb_data