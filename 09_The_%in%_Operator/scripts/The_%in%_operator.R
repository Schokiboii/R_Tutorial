# The %in% Operator
# Feb 23rd, 2026

# Read in the expression data
rpkm_data <- read.csv("data/counts.rpkm.csv")

# View the first six lines of rpkm_data
head(rpkm_data)

# Return the number of columns in rpkm_data 
ncol(rpkm_data)

# Read in the mouse_exp_design.csv and assign it to metadata
metadata <- read.csv(file="data/mouse_exp_design.csv")

# Return the number of rows in metadata 
nrow(metadata)

# %in% 
# Vector with odd numbers
A <- c(1,3,5,7,9,11)
# Vector with even numbers
B <- c(2,4,6,8,10,12)

# Test to see if each of the elements of A is in B  
A %in% B



# Vector with odd numbers
A <- c(1,3,5,7,9,11)
# Vector with odd and even numbers
B <- c(2,4,6,8,1,5)

# Test to see if each of the elements of A is in B
A %in% B



# Test to see if each of the elements of A is in B and assign the logical vector output to intersection
intersection <- A %in% B

# Show the contents of intersection
intersection

# Subset the A vector by the values returning TRUE for being in both A and B
A[intersection]


# Test to see if any values of A are in B
any(A %in% B)

# Test to see if all values of A are in B
all(A %in% B)
 
# Exercise 1
# Evaluate if there are Elements from B in A
B %in% A
# Only Show same Values in B
B[B %in% A]


# Create a vector of numbers
A <- c(10,20,30,40,50)
# Create another vector of the same numbers but backwards
B <- c(50,40,30,20,10)

# Test to see if each element of A is in B
A %in% B

# Test to see if each element of A is in the same position in B
A == B

# Test if the vectors A and B are a perfect match
all(A == B)



# Assign the rownames of the metadata data frame to x 
x <- rownames(metadata)
# Assign the column names of the rpkm_data data frame to y
y <- colnames(rpkm_data)

# Test if all of the rownames in the metadata data frame are also in the column names in the rpkm_data data frame
all(x %in% y)

# Test if all of the rownames in the metadata data frame are also in the column names in the rpkm_data data frame
all(rownames(metadata) %in% colnames(rpkm_data))

# Test if all of the rownames in the metadata data frame are also in the column names in the rpkm_data data frame and in the same order
all(x == y)

# Reordering df
# Reorder rpkm_data
rpkm_ordered  <- rpkm_data[, rownames(metadata)]

# Check that the reorder worked
all(rownames(metadata) == colnames(rpkm_ordered))



#Exercise 2
# Create important genes vector
important_genes <- c("ENSMUSG00000083700", "ENSMUSG00000080990", "ENSMUSG00000065619", "ENSMUSG00000047945", "ENSMUSG00000081010", "ENSMUSG00000030970")

# Use %in% to check if Genes are in rownames
all(important_genes %in% rownames(rpkm_data))

# Extract corresponding rows
important_counts <- rpkm_data[rownames(rpkm_data) %in% important_genes, ]
important_counts

# Extract without %in%
important_counts <- rpkm_data[important_genes, ]
important_counts
