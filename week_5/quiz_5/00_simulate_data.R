#### Preamble ####
# Purpose: Simulate Data on pages read by five friends
# Author: Denise Chang
# Email: ddleletan@hotmail.com
# Date: 29 January 2024 
# Prerequisite: None

#### Workspace setup ####
library(tidyverse)


#### Simulate Data ####
set.seed(302) # random seed

# individual maximum daily read
matt_max <- 80
ash_max <- 50
jacki_max <- 60
rol_max <- 57
mike_max <- 35

sim_data <-
  tibble(
    day = 1:100,
    Matt = sample(x = 0:matt_max, size = 100, replace = TRUE), 
    Ash = sample(x = 0:ash_max, size = 100, replace = TRUE), 
    Jacki = sample(x = 0:jacki_max, size = 100, replace = TRUE),
    Rol = sample(x = 0:rol_max, size = 100, replace = TRUE),
    Mike = sample(x = 0:mike_max, size = 100, replace = TRUE))

#### Test Simulation ####
# check that there are 100 reading days for each friend
sim_data$Matt |> length() == 100
sim_data$Ash |> length() == 100
sim_data$Jacki |> length() == 100
sim_data$Rol |> length() == 100
sim_data$Mike |> length() == 100

# check Matt's reading range
sim_data$Matt |> min() >= 0
sim_data$Matt |> max() <= matt_max

# check Ash's reading range
sim_data$Ash |> min() >= 0 
sim_data$Ash |> max() <= ash_max

# check Jacki's reading range
sim_data$Jacki |> min() >= 0 
sim_data$Jacki |> max() <= jacki_max

# check Rol's reading range
sim_data$Rol |> min() >= 0 
sim_data$Rol |> max() <= rol_max

# check Mike's reading range
sim_data$Mike |> min() >= 0 
sim_data$Mike |> max() <= mike_max

#### Save CSV file for visualization ####
write_csv(x = sim_data,
          file = "week_5/quiz_5/sim_data.csv")