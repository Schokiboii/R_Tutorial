# Setting up for Data Visualization
# Feb 26th, 2026

# Read in the mouse_exp_design.csv and assign it to metadata
metadata <- read.csv(file="data/mouse_exp_design.csv")

# Read in the expression data
rpkm_data <- read.csv("data/counts.rpkm.csv")

# Reorder rpkm_data
rpkm_ordered  <- rpkm_data[, rownames(metadata)]

# Take the mean of the expression values for sample1
mean(rpkm_ordered$sample1)

# Load the purrr
library(purrr)

# read doc of map_dbl
?map_dbl

# Calculate the mean for each column in rpkm_ordered
samplemeans <- map_dbl(rpkm_ordered, mean) 

# Named vectors have a name assigned to each element instead of just referring to them as indices ([1], [2] and so on)
samplemeans

# Check length of the vector before adding it to the data frame
length(samplemeans)

# Create a numeric vector with ages. 
age_in_days <- c(40, 32, 38, 35, 41, 32, 34, 26, 28, 28, 30, 32)   

# Note that there are 12 elements here
length(age_in_days)

# Add the new vector as the last column to the new_metadata dataframe
new_metadata <- data.frame(metadata, samplemeans, age_in_days) 

# Equal to row 38
new_metadata <- cbind(metadata, samplemeans, age_in_days)

# Take a look at the new_metadata object
View(new_metadata)
