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
seq(from = 1, to = 20, by = 4)
mean(c(3, 6, 9, 3, 6, 7))

x <- 1:10
x

y <- seq(from = 0, to = 4.5, by = 0.5)
y

# Exercise 2

??"standard deviation"
sort(x, decreasing = T)
sort(y, decreasing = T)

#----------------------------------------
# 1. Set up the working environment
#----------------------------------------

library(dplyr)
library(ggplot2)

#----------------------------------------
# 2. Load data
#----------------------------------------

Peru_Soil_Data <- read.table("data/Peru_Soil_Data.txt", header = T)  # Exercise 3
head(Peru_Soil_Data)
str(Peru_Soil_Data)

#----------------------------------------
# 3. Manage data
#----------------------------------------

# What does it look like?

glimpse(Peru_Soil_Data)

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

# histogram
hist(Peru_Soil_Data$Calcium)

# plot
plot(Magnesium ~ Calcium, data = Peru_Soil_Data, col = "red")

# boxplot
boxplot(Magnesium ~ River_Basin, data = Peru_Soil_Data)

# Running ggplot2

ggplot(Peru_Soil_Data, aes(x = Calcium, y = Magnesium))

ggplot(Peru_Soil_Data, aes(x = Calcium, y = Magnesium)) + 
  geom_point()

ggplot(Peru_Soil_Data, aes(x = Calcium, y = Magnesium)) + 
  geom_point() + 
  stat_smooth(method = "lm")

ggplot(Peru_Soil_Data, aes(x = Calcium, y = Magnesium, col = Habitat)) + 
  geom_point() + 
  stat_smooth(method = "lm")

ggplot(Peru_Soil_Data, aes(x = Calcium, y = Magnesium, col = Habitat)) +
  geom_point() +
  stat_smooth(method = "lm") +
  labs(x = "Ca", y = "Mg", col = "Habitat Type") +
  scale_y_continuous(breaks = seq(0, 2500, 250)) +
  facet_wrap(~Habitat) +
  scale_colour_manual(values = c("red", "blue")) +
  theme(legend.position = "top")

ggsave("Habitat_Ca_Mg.png", width = 12, height = 8, units = "cm", dpi = 300)


# Exercise 5

# 1

ggplot(Peru_Soil_Data, aes(x = Calcium, y = Potassium, colour = Soil_pH)) +
  geom_point()

# 2

ggplot(Peru_Soil_Data, aes(x = River_Basin, y = Soil_pH)) +
  geom_boxplot() +
  facet_wrap(~Habitat)

# 3

ggplot(Peru_Soil_Data, aes(x = Site, y = Sodium)) +
  geom_col()

# 4

ggplot(Peru_Soil_Data, aes(x = Site, y = Sodium, fill = River_Basin)) +
  geom_col()


