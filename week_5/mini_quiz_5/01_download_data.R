#### Preamble ####
# Purpose: Download data on Canadian Prime Ministers
# Author: Denise Chang
# Date: 2 February 2024 
# Prerequisite: None


#### Workspace setup ####
library(tidyverse)
library(rvest)
library(xml2)
library(janitor)

#### Start download ####
raw_data <-
  read_html(
    "https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada"
  )
write_html(raw_data, "premiers.html")

parse_data_selector_gadget <-
  raw_data |>
  html_element("td") |>
  html_table()

head(parse_data_selector_gadget)

parsed_data <-
  parse_data_selector_gadget |> 
  clean_names() |> 
  rename(raw_text = prime_minister_office_lifespan) |> 
  select(raw_text) |> 
  filter(raw_text != "Prime ministerOffice(Lifespan)") |> 
  distinct() 

head(parsed_data)