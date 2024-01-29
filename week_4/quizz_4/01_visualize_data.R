#### Preamble ####
# Purpose: Visualize data on heights measures by three friends
# Author: Denise Chang
# Email: ddleletan@hotmail.com
# Date: 29 January 2024 
# Prerequisite: 00_simulate_data.R

#### Workspace setup ####
library(tidyverse)

#### Read in data ####
sim_data <- 
  read_csv(file = "week_4/quizz_4/sim_data.csv")

#### Visualize data ####
# Reshape the tibble
long_sim_data <- 
  pivot_longer(sim_data, 
               cols = c("edward", "hugo", "lucy"), 
               names_to = "person", 
               values_to = "height")

# Construct graph
ggplot(long_sim_data, aes(x = as.factor(friend),
                     y = height,
                     colour = person)) +
  geom_point() +
  geom_line() +
  labs(title = "Height Measurements",
       x = "Individual Measured",
       y = "Height (cm)") +
  theme_minimal()
