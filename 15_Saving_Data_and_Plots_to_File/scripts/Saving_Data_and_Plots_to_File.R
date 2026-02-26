# Saving Data and Plots to File
# Feb 26th, 2026

# Setup
# Libraries
library(tidyverse)
library(ggplot2)

# Variables
metadata <- read.csv(file="data/mouse_exp_design.csv")
sub_meta <- metadata[which(metadata$replicate > 1), ]
load("data/new_metadata.RData")
glengths <- c(4.6, 3000, 50000)

# Writing Data to File
# Save a data frame to file
write.csv(sub_meta, file="data/subset_meta.csv")

# Retrieve the help page for write.csv()
?write.csv

# Save a vector to file
write(glengths, file="data/genome_lengths.txt")

# Retrieve the help page for write()
?write

# Save a vector to file as a single column
write(glengths, file="data/genome_lengths.txt", ncolumns = 1)

# Export Figures to File
# Create a plot
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=rel(3.0))

# Use ggsave to save the plot
ggsave("figures/scatterplot.pdf")

# saving images in base R
# Open a device for writing, in this case a pdf() device
pdf("figures/scatterplot1.pdf")

## Make a plot which will be written to the open device, in this case the temp file created by pdf()/png()
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=rel(3.0)) 

## Closing the device is essential to save the temporary file created by pdf()/png()
dev.off()