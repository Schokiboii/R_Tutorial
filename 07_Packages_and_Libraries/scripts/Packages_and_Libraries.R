# Packages and Libraries
# Feb 21st, 2026

# Print version information about R, the OS and loaded packages
sessionInfo()

# Gives a list of loaded packages
search()

# Install the ggplot2 package from CRAN
install.packages("ggplot2")

# DO NOT RUN
# Install the BiocManager package from CRAN
install.packages("BiocManager")


# DO NOT RUN
# Install the ggplot2 package from Bioconductor
BiocManager::install("ggplot2")

# DO NOT RUN
# Install the ggplot2 package from the source files locally
install.packages("~/Downloads/ggplot2_1.0.1.tar.gz", type="source", repos=NULL)

# Load the ggplot2 library
library(ggplot2)

#Exercise 1
# Install the tidyverse package from CRAN
install.packages("tidyverse")