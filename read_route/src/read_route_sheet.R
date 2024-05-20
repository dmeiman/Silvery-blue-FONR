# script to read route data from google sheet, using same structure as script for reading observation data
# creates "route" dataframe

install.packages("tidyverse")
install.packages("googlesheets4")

library(googlesheets4)
library(tidyverse)

# reading butterfly dataset "Silvery Blue Butterfly Observations 2024 Fort Ord Natural Reserve"
ss <- c("https://docs.google.com/spreadsheets/d/19uigKwSAMq31jVMCLDa80B9i3BouqiDYkjMnJAosSG4/edit?usp=sharing")
routes <- googlesheets4::read_sheet(ss, sheet = "Track")
names(routes)

route <- tibble(routes)
