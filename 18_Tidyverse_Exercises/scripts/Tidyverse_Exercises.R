# Tidyverse Exercises
# Mar 1st, 2026

# Setup
animals <- read.csv(file="data/animals.csv" )
library(tidyverse)

# Exercise 1
# 1
?rownames_to_column
animals <- rownames_to_column(animals, var = "animal_names")
animals_tb <- as_tibble(animals)

# 2
ggplot(animals_tb) +
  geom_point(aes(x = animal_names, y = speed), color = "purple") + 
  theme_bw() + 
  ylab("Speed (km/h") + 
  xlab("Animal") + 
  ggtitle("Speed Comparisons Between Animals") + 
  theme(plot.title = element_text(hjust=0.5))

# 3 a  
animals_tb <- animals_tb %>% arrange(speed)
?pull

names_ordered_by_speed <- pull(animals_tb, animal_names)

names_ordered_by_speed

# 3 b
animals_tb <- animals_tb %>%
  mutate(animal_names = factor(animal_names, levels = names_ordered_by_speed))

# 3 c
ggplot(animals_tb) +
  geom_point(aes(x = animal_names, y = speed), color = "purple") + 
  theme_bw() + 
  ylab("Speed (km/h") + 
  xlab("Animal") + 
  ggtitle("Speed Comparisons Between Animals") + 
  theme(plot.title = element_text(hjust=0.5))

# 4
# Plot speichern
ggsave("results/animals_by_speed_scatterplot.pdf")

# 5 
animals_tb %>%
  filter(color %in% c("gray","tan")) %>%
  arrange(speed) %>% # 5a
  write_csv("results/animals_tb_ordered.csv") # 5b