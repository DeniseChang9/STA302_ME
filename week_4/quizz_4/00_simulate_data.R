#### Preamble ####
# Purpose: Simulate Data on heights measures by three friends
# Author: Denise Chang
# Email: ddleletan@hotmail.com
# Date: 29 January 2024 
# Prerequisite: None

#### Workspace setup ####
library(tidyverse)


#### Simulate Data ####
set.seed(302) # random seed

# errors in measurements
hugo_error <- 4
edward_error <- 4
lucy_error <- 2
random_error <- 1

sim_data <-
  tibble(
    friend = 1:20,
    # simulates real measurements
    real = sample(x = 161:180,
                    size = 20,
                    replace = TRUE,
                    prob = c(0.05, 0.05, 0.05, 0.05, 0.05,
                             0.05, 0.05, 0.05, 0.05, 0.05,
                             0.05, 0.05, 0.05, 0.05, 0.05,
                             0.05, 0.05, 0.05, 0.05, 0.05))) |>
  mutate(
    # simulates Edward's measurements
    edward = real + sample(x = c(edward_error, random_error, 0),
                           size = 20, 
                           replace = TRUE, 
                           prob = c(0.3, 0.4, 0.3)),
    # simulates Hugo's measurements
    hugo = real + sample(x = c(hugo_error, random_error, 0),
                         size = 20,
                         replace = TRUE,
                         prob = c(0.4, 0.5, 0.1)),
    # simulates Lucy's measurements
    lucy = real + sample(x = c(lucy_error, random_error, 0),
                         size = 20,
                         replace = TRUE, 
                         prob = c(0.6, 0.3, 0.1))
  )

sim_data <-
  sim_data |>
  select(friend, edward, hugo, lucy)


#### Test Simulation ####
# check that there are 20 measurements by each Edward, Hugo and Lucy
sim_data$edward |> length() == 20
sim_data$hugo |> length() == 20
sim_data$lucy |> length() == 20

# check Edward's measurement range
sim_data$edward |> min() >= 161 - edward_error
sim_data$edward |> max() <= 180 + edward_error

# check Hugo's measurement range
sim_data$hugo |> min() >= 161 - hugo_error 
sim_data$hugo |> max() <= 180 + hugo_error

# check Lucy's measurement range
sim_data$lucy |> min() >= 161 - lucy_error 
sim_data$lucy |> max() <= 180 + lucy_error


#### Save CSV file ####
write_csv(x = sim_data,
          file = "week_4/quizz_4/sim_data.csv")
