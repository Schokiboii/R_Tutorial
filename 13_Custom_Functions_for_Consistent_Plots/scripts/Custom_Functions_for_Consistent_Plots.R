# Custom Function for consistent Plots
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

# Create personal theme function for figures
personal_theme <- function(){
  theme_bw() +
    theme(axis.title=element_text(size=rel(1.5))) +
    theme(plot.title=element_text(size=rel(1.5), hjust=0.5))
}

# Apply personal theme to figure
ggplot(new_metadata) +
  geom_point(aes(x=age_in_days, y=samplemeans, color=genotype, shape=celltype), size=rel(3.0)) +
  xlab("Age (days)") +
  ylab("Mean expression") +
  ggtitle("Expression with Age") +
  personal_theme()

