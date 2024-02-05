#### Workspace set up ####
library(tidyverse)
library(gh)

#### Question 8 ####
repos <- gh("/users/RohanAlexander/repos", per_page = 100)
repo_info <- tibble(
  name = map_chr(repos, "name"),
  created = map_chr(repos, "created_at"),
  full_name = map_chr(repos, "full_name"),
)

q8 <-
  repo_info |>
  filter(name == "heapsofpapers")

print(q8)

#### Question 9 ####
my_indicator <- 68
my_location <- 32
my_startyr <- 1995
my_endyr <- 1995

url <- paste0(
  "https://population.un.org/dataportalapi/api/v1",
  "/data/indicators/",
  my_indicator,
  "/locations/",
  my_location,
  "/start/",
  my_startyr,
  "/end/",
  my_endyr,
  "/?format=csv"
)

un_data <- read_delim(file = url, delim = "|", skip = 1)

un_data |>
  filter(AgeLabel == 20 & TimeLabel == 1995) |>
  select(Value)