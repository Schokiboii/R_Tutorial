# Tidyverse
# Mar 1st, 2026

# Load the tidyverse package
library(tidyverse)

# Pipes 

# A single command
sqrt(83)

# Base R method of running more than one command
round(sqrt(83), digits = 2)

# Running more than one command with piping
sqrt(83) %>% round(digits = 2)

# Exercise 1
# Create a vector of random numbers
random_numbers <- c(81, 90, 65, 43, 71, 29)
# USe Pipes
mean(random_numbers) %>% round(digits = 3)

# Tibbles
# Are just an "improved" form of data frames

# Using Tidyverse tool, to read in, wrangle and plot file

# 1. Read in the functional analysis results
# Read in the functional analysis results
functional_GO_results <- read_delim(file = "data/gprofiler_results_Mov10oe.txt", delim = "\t" )

# Take a look at the results
functional_GO_results
head(functional_GO_results)
class(functional_GO_results)

# 2. Extract only the GO biological processes (BP) of interest
# Filter for only GO biological processes
bp_oe <- functional_GO_results %>%
  filter(domain == "BP")

# Print object after filtering
bp_oe
class(bp_oe)

# Exercise 2 
bp_oe <-  bp_oe %>% filter(relative.depth > 4)

# 3. Select only the columns needed for visualization
# Selecting columns to keep
bp_oe <- bp_oe %>%
  select(term.id, term.name, p.value, query.size, term.size, overlap.size, intersection)

# Print object after selecting the columns to keep
bp_oe

# DO NOT RUN
# Selecting columns to remove
bp_oe <- bp_oe %>%
  select(-c(query.number, significant, recall, precision, 
            subgraph.number, relative.depth, domain))

# 4. Order GO processes by significance (adjusted p-values)
# Order by adjusted p-value ascending
bp_oe <- bp_oe %>%
  arrange(p.value)

# DO NOT RUN
# Order by adjusted p-value descending
bp_oe <- bp_oe %>%
  arrange(desc(p.value))

# 5. Rename columns to be more intuitive
# Provide better names for columns
bp_oe <- bp_oe %>% 
  dplyr::rename(GO_id = term.id, 
                GO_term = term.name)

# Print object after renaming the columns
bp_oe

# Exercise 3
bp_oe <-  bp_oe %>%  dplyr::rename(genes = intersection)

# 6. Create additional metrics for plotting (e.g. gene ratios)
# Create gene_ratio column based on other columns in dataset
bp_oe <- bp_oe %>%
  mutate(gene_ratio = overlap.size / query.size)

# Print object after creating the new column
bp_oe

# Exercise 4
bp_oe <-  bp_oe %>% mutate(term_percentn = overlap.size / term.size)

View(bp_oe)

# plotting bp_oe
# https://hbctraining.github.io/Intro-to-R-flipped/lessons/Aside_ggplot2.html
# Subset data frame
bp_plot <- bp_oe[1:30, ]

# Make x-column a non-numeric column
ggplot(bp_plot) +
  geom_point(aes(x = gene_ratio, y = GO_term))

# Change the color column to overlap.size
ggplot(bp_plot) +
  geom_point(aes(x = gene_ratio, y = GO_term, color = overlap.size))

# Increase title and x-axis text size
ggplot(bp_plot) +
  geom_point(aes(x = gene_ratio, y = GO_term, color = p.value), 
             size = 2) +
  theme_bw() +
  theme(axis.text.x = element_text(size=rel(1.15)),
        axis.title = element_text(size=rel(1.15))) +
  xlab("Gene ratios") + 
  ylab("Top 30 significant GO terms")

# Install the RColorBrewer library (if you don't have it installed already)
install.packages("RColorBrewer")

# Load the RColorBrewer library
library(RColorBrewer)

# Check the available color palettes
display.brewer.all()

# Testing the palette with six colors
display.brewer.pal(6, "YlOrRd")

# Testing the palette with three colors
display.brewer.pal(3, "YlOrRd")

# Define a palette
mypalette <- brewer.pal(3, "YlOrRd")

# how are the colors represented in the mypalette vector?
mypalette

# Add pallete to plot
ggplot(bp_plot) +
  geom_point(aes(x = gene_ratio, y = GO_term, color = -log10(p.value)), 
             size = 2) +
  theme_bw() +
  theme(axis.text.x = element_text(size=rel(1.15)),
        axis.title = element_text(size=rel(1.15))) +
  xlab("Gene ratios") +
  ylab("Top 30 significant GO terms") +
  ggtitle("Dotplot of top 30 significant GO terms") +
  theme(plot.title = element_text(hjust=0.5, 
                                  face = "bold")) +
  scale_color_gradientn(colors = mypalette)

# Edit legend
ggplot(bp_plot) +
  geom_point(aes(x = gene_ratio, y = GO_term, color = -log10(p.value)), 
             size = 2) +
  theme_bw() +
  theme(axis.text.x = element_text(size=rel(1.15)),
        axis.title = element_text(size=rel(1.15))) +
  xlab("Gene ratios") +
  ylab("Top 30 significant GO terms") +
  ggtitle("Dotplot of top 30 significant GO terms") +
  theme(plot.title = element_text(hjust=0.5, 
                                  face = "bold")) +
  scale_color_gradientn(name = "Significance \n (-log10(padj))", colors = mypalette) +
  theme(legend.title = element_text(size=rel(1.15),
                                    hjust=0.5, 
                                    face="bold"))
# Exercise 2
bp_oe <- bp_oe %>%
  arrange(desc(term_percentn))
bp_plot2 <- bp_oe[1:30, ]
mypalette <- brewer.pal(6, "Blues")
mypalette
ggplot(bp_plot2) +
  geom_point(aes(x = term_percentn, y = GO_term, color = -log10(p.value)), 
             size = 2) +
  theme_bw() +
  theme(axis.text.x = element_text(size=rel(1.15)),
        axis.title = element_text(size=rel(1.15))) +
  ggtitle("Dotplot of top 30 GO terms with highest term_percent") +
  theme(plot.title = element_text(hjust=0.5, 
                                  face = "bold")) +
  scale_color_gradientn(name = "Legend", colors = mypalette) +
  theme(legend.title = element_text(size=rel(1.15),
                                    hjust=0.5, 
                                    face="bold"))