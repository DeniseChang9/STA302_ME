#### Preamble ####
# Purpose: Simulate data on Canadian Prime Ministers
# Author: Denise Chang
# Date: 2 February 2024 
# Prerequisite: None


#### Workspace setup ####
library(tidyverse)
library(rvest)
library(babynames)

#### Start of simulation ####

set.seed(302) #random seed

sim_data <-
  tibble(
    prime_minister = babynames |>
      filter(prop > 0.01) |>
      distinct(name) |>
      unlist() |>
      sample(size = 10, replace = FALSE),
    birth_year = sample(1700:1990, size = 10, replace = TRUE),
    years_lived = sample(50:100, size = 10, replace = TRUE),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)
