#### Preamble ####
# Purpose: Visualize Data on pages read by five friends
# Author: Denise Chang
# Email: ddleletan@hotmail.com
# Date: 5 February 2024 
# Prerequisite: 00_simulate_data.R

#### Workspace setup ####
library(tidyverse)

#### Read in data ####
sim_data <- 
  read_csv(file = "week_5/quiz_5/sim_data.csv")

#### Visualize data ####
# Reshape the tibble
long_sim_data <- 
  pivot_longer(sim_data, 
               cols = c("Matt", "Ash","Jacki", "Rol", "Mike"), 
               names_to = "person", 
               values_to = "pages")

# Construct graph
ggplot(long_sim_data, aes(x = as.factor(day),
                          y = pages,
                          colour = person)) +
  geom_point() +
  geom_line() +
  labs(title = "Daily pages read by friend",
       x = "Day",
       y = "Number of pages read") +
  theme_minimal() + 
  scale_x_discrete(breaks = c("20", "40", "60", "80", "100"))
