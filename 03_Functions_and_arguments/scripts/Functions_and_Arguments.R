# Functions and Arguments
# Feb 19th, 2026

# Return the working directory
getwd()


#Basic Functions
glengths <- c(4.6, 3000, 50000)
# Adding 90 to the end of the glengths vector   
glengths <- c(glengths, 90)
# Adding 30 to the beginning of the glengths vector 
glengths <- c(30, glengths)

# Print out the glengths vector
glengths


# Return the square root of 81
sqrt(81)

# Return the square root for each value in glengths
sqrt(glengths)

# Round 3.14159 to the nearest integer
round(3.14159)



# Seeking Help on Arguments for Functions
# Open up the help page for the round() function
?round

# Return the names of the arguments for the round() function
args(round)

# Round 3.14159 to the nearest hundredths place
round(3.14159, digits=2)
# Round 3.14159 to the nearest hundredths place
round(3.14159, 2)


# Exercise 1
# find out if mean exists
?mean
#find out which arguments are taken
args(mean)
#use mean on glengths
mean(glengths)
#create new vector
test <- c(1, NA, 2, 3, NA, 4)
#use mean on test
mean(test, na.rm = TRUE)
#find out how sort works
?sort
#use sort on glengths
sort(glengths, decreasing = TRUE)


# User defined Functions
# Create a function called square_it which takes the value x as input 
square_it <- function(x) {
  # Squares the value of x and assigns it to the object called square
  square <- x * x
  # Returns the value of square to the console
  return(square)
}

# Create a function called square_it which takes the value x as input 
square_it <- function(x) {
  # Squares the value of x and returns the square to the console
  x * x
}

# Test the square_it function with 5
square_it(5)



# Exercise 2
#define function multiply_it
multiply_it <- function(x,y) {
  return(x*y)
}
# Test the multiply_it function with 5
multiply_it(x=4, y=6)