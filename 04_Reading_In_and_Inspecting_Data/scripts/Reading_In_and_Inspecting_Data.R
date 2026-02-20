# Reading in and Inspecting Data
# Feb 20th, 2026

#Reading
# Open up the help page for the read.csv() function
?read.csv

# Read in the mouse_exp_design.csv and assign it to metadata
metadata <- read.csv(file="data/mouse_exp_design.csv")

#Exercise 1
#read project-summary.txt
proj_summary <- read.table(file = "data/project-summary.txt", sep = "\t", header = TRUE, row.names = 1)
#print
proj_summary


#Inspecting 
# Print out the metadata object
metadata

# Print out the first six lines of the metadata object
head(metadata)

# Print out structure of metadata object
str(metadata)

#Exercise 02
#Getting Back glengths
glengths <- c(4.6, 3000, 50000)
glengths <- c(glengths, 90)
glengths <- c(30, glengths)

# Comparing class for glenghs and metadata
class(glengths) # numeric
class(metadata) # data frame
# Conclusion -> shows type of object

# Summary on proj_summary
summary(proj_summary) # mean for rRNArate -> 0.005345

#Getting length of sample group
samplegroup <- c("CTL", "KO", "KO", "OE", "CTL", "CTL", "OE", "KO", "OE")
samplegroup <- factor(samplegroup)

length(samplegroup) # -> 9

#getting dimension of proj_summary
dim(proj_summary) # -> 9 rows 8 cols

# rownames on metadata
rownames(metadata)
#structure of output
class(rownames(metadata)) #-> character vector

#length of output of colnames
length(colnames(proj_summary)) # -> 8