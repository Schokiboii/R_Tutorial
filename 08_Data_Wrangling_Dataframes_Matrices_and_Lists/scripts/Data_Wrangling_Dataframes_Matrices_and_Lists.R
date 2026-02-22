# Data Wrangling: Dataframes, Matrices and Lists
# Feb 22nd, 2026

#Dataframes
# Read in the mouse_exp_design.csv and assign it to metadata
metadata <- read.csv(file="data/mouse_exp_design.csv")

# Extract value "Wt" in the first row and first column
metadata[1, 1]

# Extract value "1" in the first row and third column
metadata[1, 3] 

# Extract third row
metadata[3, ] 

# Extract third column
metadata[ , 3]   

# Extract third column while maintaining the dataframe structure
metadata[ , 3, drop = FALSE] # to not drop down to vector

# Extract the first two columns
metadata[ , 1:2] 

# Extract the first, third and sixth rows
metadata[c(1,3,6), ] 

# Extract the first three samples for the celltype column 
metadata[c("sample1", "sample2", "sample3") , "celltype"] 

# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)

# Extract the genotype column
metadata$genotype 

# Extract the first five values of the genotype column
metadata$genotype[1:5]

# Exercise 1
# Return only genotype and replicate values for sample2 and sample8.
metadata[c("sample2","sample8"),c("genotype","replicate")]
# Return fourth and ninth value of replicate
metadata$replicate[c(4,9)]
# Return replicate column as dataframe
metadata[,3, drop = FALSE]

# Working with Logical Operators
# Determine which values in the celltype column of metadata match "typeA"
metadata$celltype == "typeA"

# Create a logical vector  for which values in the celltype column of metadata match "typeA"
logical_idx <- metadata$celltype == "typeA"

# Subset the metadata data frame for the rows returning TRUE for "typeA" in the celltype column 
metadata[logical_idx, ]

# Return the row numbers for the rows returning TRUE for "typeA" in the celltype column 
which(metadata$celltype == "typeA")

# Create an index of row numbers for the rows returning TRUE for "typeA" in the celltype column 
idx <- which(metadata$celltype == "typeA")

# Subset the metadata data frame for the rows returning TRUE for "typeA" in the celltype column 
metadata[idx, ]

# Return the row numbers for the rows returning TRUE for being greater than 1 in the replicate column 
which(metadata$replicate > 1)

# Create an index of row numbers for the rows returning TRUE for being greater than 1 in the replicate column
idx <- which(metadata$replicate > 1)

# Subset the metadata data frame for the rows returning TRUE for being greater than 1 in the replicate column
metadata[idx, ]

# Subset the metadata data frame for the rows returning TRUE for being greater than 1 in the replicate column
metadata[which(metadata$replicate > 1), ]

# Subset the metadata data frame for the rows returning TRUE for being greater than 1 in the replicate column and assign it to sub_meta
sub_meta <- metadata[which(metadata$replicate > 1), ]

# Exercise02
# Subset the metadata dataframe to return only the rows of data with a genotype of KO.
metadata[which(metadata$genotype == "KO"), ]

# Lists
# Setup
glengths <- c(4.6, 3000, 50000)
species <- c("ecoli", "human", "corn")
df <- data.frame(species, glengths)
number <- 15
samplegroup <- c("CTL", "KO", "KO", "OE", "CTL", "CTL", "OE", "KO", "OE")
samplegroup <- factor(samplegroup)
age <- c(15, 22, 45, 52, 73, 81)
list1 <- list(species, df, number)

# Extract the second object from list1
list1[[2]]

# Extract the second object from the list1 and assign it to comp2
comp2 <- list1[[2]]

# Determine the class of "comp2"
class(comp2)

# Extract the first object from list1
list1[[1]]

# Extract the first object from list1 and then subset it to only have the first element of that vector
list1[[1]][1]

# Exercise 3
# Create List random
random <- list(metadata, age, list1, samplegroup, number)
# Extract samplegroup
random[[4]]

# Return the names of the list1 list
names(list1) 

# Name components of the list1 list
names(list1) <- c("species", "df", "number")

# Return the updated names of the list1 list
names(list1)

# Name components of the list1 list
names(list1) <- c("species", "df", "number")

# Return the updated names of the list1 list
names(list1)

# Extract "df" component
list1$df

# Exercise 4
# Set names for the random list you created in the last exercise
names(random) <-  c("metadata","age","list1","samplegroup","number")
#Extract age
random$age
