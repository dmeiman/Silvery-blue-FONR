# script to read weather data from google sheet, using same structure as script for reading observation data
# creates "wx" dataframe

install.packages("tidyverse")
install.packages("googlesheets4")

library(googlesheets4)
library(tidyverse)

# reading butterfly dataset "Silvery Blue Butterfly Observations 2024 Fort Ord Natural Reserve"
ss <- c("https://docs.google.com/spreadsheets/d/19uigKwSAMq31jVMCLDa80B9i3BouqiDYkjMnJAosSG4/edit?usp=sharing")
weather <- googlesheets4::read_sheet(ss, sheet = "Weather")
names(weather)

wx <- tibble(weather)
