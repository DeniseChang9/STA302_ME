#### Pre-amble ####
# Clean data from : https://www.ushmm.org/online/hsv/source_view.php?SourceId=49478


# Workspace set up
library(tidyverse)
library(janitor)

raw_data <- read_csv("mini_essay_12/input/raw_data.csv")

clean_data <-
  clean_names(raw_data) |>
  select(religion)

head(clean_data)
