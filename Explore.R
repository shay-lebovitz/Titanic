library(tidyverse)
library(tidymodels)
library(janitor)
library(stringi)
library(stringr)

getwd()
datapath <- './Data'
setwd(datapath)
getwd()

# load data;
train <- read_csv('train.csv')
gender_submission <- read_csv('gender_submission.csv')
test <- read_csv('test.csv')

# clean;
train2 <- train %>% 
  clean_names() %>% 
  mutate(comma = gregexpr(',', name)) %>% 
  mutate(temp_name = substr(name, strtoi(comma) + 2, length(name))) %>% 
  mutate(title <- word(temp_name)) 


# explore data;
train2 %>% 
  ggplot(aes(x = pclass)) +
  geom_histogram() + 
  theme_minimal()

train2 %>% 
  ggplot(aes(x = age, y = survived)) + 
  geom_violin()
