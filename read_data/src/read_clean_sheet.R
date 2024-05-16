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

#creating code to read bfly$Sex for repeated values
#loading dplyr and tidyr libraries for future use
library(dplyr)
library(tidyr)

n = 3
bfly2 = cbind(bfly, replicate(n,bfly$Sex))
bfly2
# prints message (potential error?): [ reached 'max' / getOption("max.print") -- omitted 267 rows ]
# bfly2 file not changed, but new rows showing in console

#separate_rows(bfly,Sex,sep=",\\s+")
