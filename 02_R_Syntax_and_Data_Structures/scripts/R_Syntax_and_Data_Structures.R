# R Syntax and Data Structures
# Feb 18th, 2026

#Vectors
# Create a numeric vector and store the vector as an object called glengths
glengths <- c(4.6, 3000, 50000)

# Print the contents of glengths
glengths

# Create a character vector and store the vector as an object called species
species <- c("ecoli", "human", "corn")

# Print the contents of species
species

# What if you forget to put quotes around corn
# species <- c("ecoli", "human", corn)

#Exercise 1
#Create Vector Combined
combined <- c(glengths, species)
#Print combined
combined



#Factors
# Create a character vector and store the vector as an object called expression
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn the expression vector into a factor vector
expression <- factor(expression)

#Exercise 2
#Create Vector sample group
samplegroup <- c("CTL", "KO", "KO", "OE", "CTL", "CTL", "OE", "KO", "OE")
#Turn samplegroup into factor
samplegroup <- factor(samplegroup)



#Data Frame
# Create a data frame and store it as an object called df
df <- data.frame(species, glengths)

# Print the contents of df
df

#Exercise 3
# Create a character vector containing book names and assign it to titles
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
# Create a numeric vector containing page numbers and assign it to pages
pages <- c(453, 432, 328)

#Create Data Frame favorite_books
favorite_books <- data.frame(titles, pages)

#Print favorite_books
favorite_books



# Lists
# Create a list holding the objects species, df and number and assign it to an object called list1
number <- 15
list1 <- list(species, df, number)

# Print the contents of list1
list1

#Exercise 03
#Create list2
list2 <- list(species, glengths, number)
#Print list2
list2

