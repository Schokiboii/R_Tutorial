# Custom Function Exercises
# Feb 20th, 2026

# Exercise 1
temp_conv <- function(temp_f){
  temp_c = (temp_f - 32) * 5 / 9
  temp_k = temp_c + 273.15
  return (temp_k)
} 

temp_conv(70)

# Exercise 2
temp_conv_rounded <- function(temp_f){
  return (round(temp_conv(temp_f = temp_f),digits = 1))
}

temp_conv_rounded(70)

# Bonus
temp_conv_celsius <- function(temp_f){
  temp_c = (temp_f - 32) * 5 / 9
  return (temp_c)
}

temp_conv_celsius(100)