# Boxplot Visualization
# Feb 26th, 2026

# Data Visualization
# Load libraries
library(tidyverse)

# Load the new_metadata data frame into your environment from a .RData object
load("data/new_metadata.RData")

# Load the ggplot2 library
library(ggplot2)

# Exercise 1
ggplot(new_metadata) + 
  geom_boxplot(
    aes(x = genotype, y = samplemeans, fill = celltype)
  )+
  theme_bw()+
  ggtitle("Genotype differences in Average Gene Expression") +
  ylab("Mean expression") + 
  xlab("Genotype") +
  theme(axis.title = element_text(size=rel(1.25)))  +
  theme(plot.title=element_text(hjust=0.5, size=rel(1.5)))

# Exercise 2
new_metadata$genotype <- factor(new_metadata$genotype, levels = c("Wt", "KO"))
# Rerun Exercise 1

# Exercise 3
ggplot(new_metadata) + 
  geom_boxplot(
    aes(x = genotype, y = samplemeans, fill = celltype)
  )+
  theme_bw()+
  ggtitle("Genotype differences in Average Gene Expression") +
  ylab("Mean expression") + 
  xlab("Genotype") +
  theme(axis.title = element_text(size=rel(1.25)))  +
  theme(plot.title=element_text(hjust=0.5, size=rel(1.5))) + 
  # scale_color_manual(values=c("purple","orange")) # no visible Change
  scale_fill_manual(values=c("darkslateblue","cornflowerblue")) # changes color



ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=2.25) +
  theme_bw() +
  theme(axis.title = element_text(size=rel(1.5)))  +
  ylab("Mean expression") +
  xlab("Age (days)") + 
  ggtitle("Sample Data") +
  theme(plot.title=element_text(hjust=0.5)) +
  scale_color_manual(values=c("purple","orange")) # Changes Color
  # scale_fill_manual(values=c("purple","orange")) # no visible Change

# scale_color_manual() -> changes color of points and lines
# scale_fill_manual() -> changes color of plains/shapes

# Exercise 4
ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
                 shape=celltype), size=3) +
  theme_bw() +
  theme(axis.title = element_text(size=rel(1.5)))  +
  ylab("Mean expression") +
  xlab("Age (days)") + 
  ggtitle("Sample Data") +
  theme(plot.title=element_text(hjust=0.5)) +
  scale_color_manual(values=c("#900909","#1aaaaa"))