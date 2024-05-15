#read_sheet.R

# [ ] checklist - to do 
#install packages
#install.packages("tidyverse")
#install.packages("googlesheets4")

library(googlesheets4)
library(tidyverse)

# reading butterfly dataset "Silvery Blue Butterfly Observations 2024 Fort Ord Natural Reserve"
ss <- c("https://docs.google.com/spreadsheets/d/19uigKwSAMq31jVMCLDa80B9i3BouqiDYkjMnJAosSG4/edit?usp=sharing")
butterflies <- googlesheets4::read_sheet(ss, sheet = "Observations")
names(butterflies)

bfly <- tibble(butterflies)

separate(bfly, col = Direction, into =  c("Dir","Compass"), sep = "\\s+", remove = FALSE) -> bfly

na_if(bfly$Dir, "0") -> bfly$Dir

#> first_arg %>% first_fun %>% second_fun -> output
#output <- second_fun(first_fun(first_arg))