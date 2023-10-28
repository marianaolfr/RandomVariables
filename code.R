install.packages("downloader")
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)

# represents the weights for the entire population.
x <- unlist( read.csv(filename) )

# this command specify that you want to use the "Mersenne-Twister" RNG 
# with both the "Inversion" and "Rejection" methods for generating random numbers 

RNGkind("Mersenne-Twister", "Inversion", "Rejection")

## Setting the RNG kind and methods is important in statistical simulations and 
# data analysis to ensure reproducibility and consistency of results, 
# as it controls how random numbers are generated and distributed

# What is the average of these weights? 
mean(x)

set.seed(1)
# command set any subsequent calls to functions that generate random numbers 
# will produce the same sequence of random numbers as long as you keep the seed set to 1

# What is the absolute value of the difference between the average a sample of 5
# and the average of all the values?

avg_all <- mean(x)
avg_sample <- mean( sample(x, 5) )

value_diff <- avg_sample - avg_all

abs(value_diff)

# Trying with seed set to 5
set.seed(5)

avg_all <- mean(x)
avg_sample <- mean( sample(x, 5) )

value_diff <- avg_sample - avg_all

abs(value_diff)

# Why are the answers from 2 and 3 different?
# Because the average of the samples is a random variable.




