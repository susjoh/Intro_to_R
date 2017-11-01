#
# Using R as a Research Tool
# Learning how to import and explore data.
# Written by [] 2017-11-07, University of Edinburgh
#
#



#----------------------------------------
# 0. Warming up
#----------------------------------------

# Exercise 1

2+3
1:10
seq(1, 20, 4)
mean(c(3, 6, 9, 3, 6, 7))

x <- 1:10
x

y <- seq(0, 4.5, 0.5)
y

# Exercise 2

??"standard deviation"
sort(x, decreasing = T)
sort(y, decreasing = T)

#----------------------------------------
# 1. Set up the working environment
#----------------------------------------

library(dplyr)






#----------------------------------------
# 2. Load data
#----------------------------------------

# Peru_Soil_Data <- read.delim("C:/Users/sjohns10/Google Drive/Teaching and Seminars/201711 NERC E3 DTP/Intro_to_R/data/Peru_Soil_Data.txt")
Peru_Soil_Data <- read.table("data/Peru_Soil_Data.txt", header = T)  # Exercise 3




#----------------------------------------
# 3. Manage data
#----------------------------------------







#----------------------------------------
# 4. Visualise data
#----------------------------------------



