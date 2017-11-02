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

# Summary Statistics

summary(Peru_Soil_Data)

# Sorting Data

# sort by Soil pH value:
arrange(Peru_Soil_Data, Soil_pH) 

# sort by decreasing Soil pH value:
arrange(Peru_Soil_Data, -Soil_pH) 

# sort by habitat and then soil pH within habitat:
arrange(Peru_Soil_Data, Habitat, Soil_pH) 

# Subsetting columns

Peru_Soil_Data[,1]
Peru_Soil_Data[,3:5]
Peru_Soil_Data[,c(1, 4, 5)]

select(Peru_Soil_Data, River_Basin)
select(Peru_Soil_Data, -River_Basin)

select(Peru_Soil_Data, River_Basin, Magnesium, Sodium)
select(Peru_Soil_Data, -River_Basin, -Magnesium, -Sodium)

# Adding columns.

Peru_Soil_Data$River_Basin
Peru_Soil_Data$log_Calcium <- log10(Peru_Soil_Data$Calcium)
head(select(Peru_Soil_Data, Site, Calcium, log_Calcium))

# Subsetting rows with filter()
Peru_Soil_Data[1,]
Peru_Soil_Data[1:5,]

filter(Peru_Soil_Data, Habitat == "floodplain", River_Basin == "Manu")

# Exercise 4

# Create a new data frame, Peru_Upland_Soil, which includes row only from upland habitats.

Peru_Upland_Soil <- filter(Peru_Soil_Data, Habitat == "upland")

# Edit this data frame so that it only includes data from the Manu and Los Amigos river basins (Hint: use $\%in\%$)

Peru_Upland_Soil <- filter(Peru_Upland_Soil, River_Basin %in% c("Manu", "Los_Amigos"))

# Edit this data frame again so that it is sorted by increasing Calcium levels.

Peru_Upland_Soil <- arrange(Peru_Upland_Soil, Calcium)

# Create a new column called Sum_Ca_Mg that is the sum of the calcium and magnesium columns.

Peru_Upland_Soil$Sum_Ca_Mg <- Peru_Upland_Soil$Calcium + Peru_Upland_Soil$Magnesium

#----------------------------------------
# 4. Visualise data
#----------------------------------------



