# Troubleshooting and finding help
# Feb 27th, 2026

# Print out the sessionInfo()
sessionInfo()

# DO NOT RUN
# Save a sample dataset
save(iris, file="/tmp/iris.RData") #not human readable

# DO NOT RUN
# Load a sample dataset
load(file="~/Downloads/iris.RData") #human readable

# Reading Description File of ggplot
packageDescription("ggplot2")

# Exercise 1
# Create a vector of work days
work_days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Create a function to round the output of the sum function
round_the_sum <- function(x){
  return(round(sum(x)))
}

# Create a function to add together three numbers
add_numbers <- function(x,y,z){
  sum(x,y,z)
}

add_numbers(5,9,8) # Added Parameter

# 2. Try to install the multtest package because Seurat depends on this package
# If this does not work, look at the installed packages

# 3.
# save list of packages, the version of R, your OS and package versions. 
sessionInfo()
# save small reproducible data frame
save(df, file = "df.RData")
# provide File and tell others to load it in
load("df.RData")
