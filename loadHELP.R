# use this script to setup the data subset from
# HELP to use for N741 Spring 2018 Homework 6

# load libraries and dataset

library(tidyverse)
library(haven)
helpdata <- haven::read_spss("helpmkh.sav")

# choose variables for Homework 6

h1 <- helpdata %>%
  select(age, female, pss_fr, homeless, 
         pcs, mcs, cesd)

# add dichotomous variable
# to indicate depression for
# people with CESD scores >= 16
# and people with mcs scores < 45

h1 <- h1 %>%
  mutate(cesd_gte16 = cesd >= 16) %>%
  mutate(mcs_lt45 = mcs < 45)

# change cesd_gte16 and mcs_lt45 LOGIC variable type
# to numeric coded 1=TRUE and 0=FALSE

h1$cesd_gte16 <- as.numeric(h1$cesd_gte16)
h1$mcs_lt45 <- as.numeric(h1$mcs_lt45)

# check final data subset h1
summary(h1)


