# Create and save a new R script
write("print('Hello, RStudio!')", file = "script.R")

# Locate the built-in dataset 'mtcars' and view its structure
View(mtcars)
str(mtcars)
summary(mtcars)

# Set a working directory and verify the path
setwd("C:/CC/Code/R-Labs") 
getwd()

# Practicing Built-in Functions

# Basic Descriptive Statistics
num_vector <- c(1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10)
mean(num_vector)  # Calculate mean
median(num_vector)  # Calculate median
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
mode(num_vector)  # Calculate mode

# Generate a sequence from 1 to 100 and find the sum of all even numbers
num_seq <- 1:100
sum_even <- sum(num_seq[num_seq %% 2 == 0])
sum_even

# Use paste() to concatenate strings
paste("Hello", "World", sep = "-")

# Create a matrix and perform operations
mat <- matrix(1:9, nrow = 3, byrow = TRUE)
t(mat)  # Transpose
det(mat)  # Determinant (only works for square matrices)
solve(mat)  # Inverse matrix

# Working with Library Packages

# Install and load ggplot2
install.packages("ggplot2")
library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = hp)) + geom_point()

# Use dplyr to filter and arrange iris dataset
install.packages("dplyr")
library(dplyr)
iris %>% filter(Species == "setosa") %>% arrange(Sepal.Length)

# Install and use tidyr for pivoting
install.packages("tidyr")
library(tidyr)
df <- data.frame(Name = c("A", "B"), Q1 = c(10, 20), Q2 = c(15, 25))
long_df <- pivot_longer(df, cols = starts_with("Q"), names_to = "Quarter", values_to = "Value")
wide_df <- pivot_wider(long_df, names_from = "Quarter", values_from = "Value")

# Explore data.table
install.packages("data.table")
library(data.table)
dt <- data.table(ID = 1:5, Score = c(80, 90, 85, 70, 95))
dt[, .(Avg_Score = mean(Score))]

# Advanced Tasks

# lubridate for date parsing
install.packages("lubridate")
library(lubridate)
date <- ymd("2025-03-18")
format(date, "%B %d, %Y")

# Web scraping with rvest
install.packages("rvest")
library(rvest)
url <- "https://example.com"
web_page <- read_html(url)
text_data <- web_page %>% html_text()

# Machine learning with caret
install.packages("caret")
library(caret)
data(iris)
model <- train(Species ~ ., data = iris, method = "rpart")
print(model)

# Time-series visualization with xts and zoo
install.packages("xts")
install.packages("zoo")
library(xts)
library(zoo)
time_series_data <- xts(mtcars$mpg, order.by = as.Date("2025-01-01") + 1:nrow(mtcars))
plot(time_series_data, main = "Time-Series Data")
