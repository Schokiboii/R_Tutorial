# Plotting with the ggplot2 Package
# Feb 26th, 2026

# Data Visualization
# Load libraries
library(tidyverse)

# Load the new_metadata data frame into your environment from a .RData object
load("data/new_metadata.RData")

# This data frame should have 12 rows and 5 columns
View(new_metadata)

# Load the ggplot2 library
library(ggplot2)

# What happens when we just provide ggplot with the dataframe?
ggplot(new_metadata) 

# Now we provide ggplot with the data frame and the type of geom object that we want for our plot
ggplot(new_metadata) +
  geom_point() 

# Providing ggplot with the data, type of geom object and defining our x and y values within the aes() function
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y = samplemeans))

# Adding color to our figure based upon the genotype
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype)) 

# Adding different shapes to our data based upon the celltype
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype)) 

# Increase the size of the points
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=2.25) 

# Adding in a built-in theme
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=3.0) +
  theme_bw() 

# Increasing the size of the axes titles
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=2.25) +
  theme_bw() +
  theme(axis.title = element_text(size=rel(1.5)))  

#Example("geom_point")
example("geom_point")

# Exercise 1
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=2.25) +
  theme_bw() +
  theme(axis.title = element_text(size=rel(1.5)))  +
  ylab("Mean expression") +
  xlab("Age (days)") + 
  ggtitle("Sample Data") +
  theme(plot.title=element_text(hjust=0.5)) # Centers Title
