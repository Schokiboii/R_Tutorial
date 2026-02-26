# Data Wrangling Exercises
# Feb 26th, 2026

# Exercise 1
# Reading in and inspecting Data
# read animals.csv into animals
animals <- read.csv(file="data/animals.csv" )
# check if row names are different
row.names(animals)
# check type of animals
class(animals)
# check row and col count
nrow(animals)
ncol(animals)

# Data Wrangling
# Extract speed where value is 40kmph
animals$speed[animals$speed == 40]
# return all rows which are color tan
animals[animals$color=="Tan",]
# Return the rows with animals that have speed greater than 50 km/h and output only the color column. Keep the output as a data frame.
colors <- animals[animals$speed > 50, "color", drop = FALSE]
class(colors)
# change Grey to Gray
animals$color[animals$color == "Grey"]="Gray"
# create animals_list
animals_list = list(animals$speed,animals$color)
# give appropriate name to items
names(animals_list) <- c("speed","color")
animals_list$speed
animals_list$color

# %in%, reordering and matching
# Read in proj_summary if needed
proj_summary <- read.table(file = "data/project-summary.txt", header = TRUE, row.names = 1)
# Create ctrl_samples dataframe
ctrl_samples <- data.frame(row.names = c("sample3", "sample10", "sample8", "sample4", "sample15"), 
                           date = c("01/13/2018", "03/15/2018", "01/13/2018", "09/20/2018","03/15/2018"))
# how many ctrl_samples are also in proj_summary
sum(rownames(ctrl_samples) %in% rownames(proj_summary))
# save corresponding samples in proj_summary_ctrl
proj_summary_ctrl <- proj_summary[rownames(proj_summary) %in% rownames(ctrl_samples),]
# find matching rows in ctrl_samples
ctrl_samples_matched <- ctrl_samples[rownames(proj_summary_ctrl), ,drop = F]
# add as batch to proj_summary_ctrl
proj_summary_ctrl <- cbind(proj_summary_ctrl,batch=ctrl_samples_matched$date)

# BONUS: Using map_lgl
# Subset to only contain samples with "high" or "low"
idx <- which(proj_summary$treatment == "high"| proj_summary$treatment == "low")
proj_summary_noctl <- proj_summary[idx, ]
# remove non-numeric columns
library(purrr)
proj_summary_noctl <- proj_summary_noctl[, map_lgl(proj_summary_noctl, is.numeric)]
