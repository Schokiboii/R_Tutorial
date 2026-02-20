# Data Wrangling Subsetting Vectors and Factors
# Feb 20th, 2026

# Subsetting Vectors
# Create a vector with some random ages and assign it to age 
age <- c(15, 22, 45, 52, 73, 81)

# Extract the fifth value from the age vector
age[5]

# Extract all of the values except for the fifth value from the age vector
age[-5]

# Use a nested approach to extract multiple values from the age vector
age[c(3,5,6)]   

# Or create an index vector first for the indices to extract from then age vector
idx <- c(3,5,6) 
# Then extract the ages from the age vector using the index vector
age[idx]

# Extract the first four ages from the age vector
age[1:4]


# Exercise 1
# create alphabets vector
alphabets <- c("C","D","X","L","F")

# show only CDF
alphabets[c(1,2,5)]

# display all except X
alphabets[-3]

# show in reverse order
alphabets[5:1]

# Show the age vector
age

# Return a logical vector for values in age greater than 50
age > 50

# Return a logical vector for values in age greater than 50 or less than 18
age > 50 | age < 18

# Use a nested approach to extract values from the age vector greater than 50 or less than 18
age[age > 50 | age < 18]

# Or create a logical vector for values in age greater than 50 or less than 18
idx <- age > 50 | age < 18
# Then extract the ages from the age vector using the index vector
age[idx]

# Return the indicies for the values in age which are greater than 50 or less than 18
which(age > 50 | age < 18)

# Use a nested approach to extract indicies from the age vector where the values are greater than 50 or less than 18
age[which(age > 50 | age < 18)]

# Or create an index vector for indices from the age vector where the values are greater than 50 or less than 18
idx_num <- which(age > 50 | age < 18)
# Then extract the ages from the age vector using the index vector
age[idx_num]

#create new vector
test <- c(1, NA, 2, 3, NA, 4)

# Print test object
test

# Subset test just using a logical operator
# NA values retained
test[test > 1]

# Subset test using which() around a logical operator
# NA values discarded
test[which(test > 1)]

# Factors
# Create a character vector and store the vector as an object called expression
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn the expression vector into a factor vector
expression <- factor(expression)

# Return the values in the expression factor vector equal to "high"
expression[expression == "high"]  

#Exercise 2
#Create Vector sample group
samplegroup <- c("CTL", "KO", "KO", "OE", "CTL", "CTL", "OE", "KO", "OE")
#Turn samplegroup into factor
samplegroup <- factor(samplegroup)

#Extract all items which are not KO
samplegroup[samplegroup != "KO"]

# Releveling Factors
# Show the expression factor vector
expression

# Return the structure of the expression factor vector
str(expression)

# Re-level the expression factor vector 
expression <- factor(expression, levels=c("low", "medium", "high"))     
# Return the updated structure of the expression factor vector
str(expression)

# Exercise 3
# Re-level samplegroup
samplegroup <- factor(samplegroup, levels = c("KO","CTL","OE"))
# Return the updated structure of the samplegroup factor vector
str(samplegroup)
samplegroup