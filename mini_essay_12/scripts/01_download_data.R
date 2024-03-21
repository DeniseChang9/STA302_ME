#### Pre-amble ####

# Workspace set up
library(tidyverse)
library(rvest)
library(write_html)


raw_data <-
  read_html(
    "https://www.auschwitz.org/en/history/the-number-of-victims/overall-numbers-by-ethnicity-or-category-of-deportee/"
  )

write_html(raw_data, "victims.html")

parse_data_selector_gadget <-
  raw_data |>
  html_element("td p") |>
  html_table()

head(parse_data_selector_gadget)
