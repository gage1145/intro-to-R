# Introduction to R for Beginners

# Objective: 
# By the end of this lesson, students will be able to:
# - Understand what R is and its applications.
# - Navigate RStudio and run basic R commands.
# - Perform simple data manipulation and visualization.



# 1. Introduction to R ----------------------------------------------------



# What is R?
# - Open-source statistical programming language
# - Used for data analysis, visualization, and statistical computing

# Why learn R?
# - Popular in academia, research, and industry (data science, biology, finance, etc.)
# - Large community and extensive packages

# Installing R and RStudio
# Download R: https://cran.r-project.org/
# Download RStudio: https://posit.co/download/rstudio-desktop/



# 2. Getting Started with RStudio -----------------------------------------



# Overview of RStudio interface:
# - Script Editor, Console, Environment, Plots/Help/Viewer panels

# Running R code directly in the console
print("Hello, world!")

# Basic operations in R
2 + 2
sqrt(16)
log(10)
log10(10)
10 < 9



# 3. Data Types and Variables ---------------------------------------------



# Assigning variables (`<-` vs. `=`)
x <- 10
y = 5
z <- x + y
print(z)

# Data types
num_val <- 10.5
int_val <- 10L
char_val <- "Hello"
bool_val <- TRUE

typeof(num_val)
typeof(int_val)
typeof(char_val)
typeof(bool_val)



# 4. Basic Data Structures ------------------------------------------------



# Vectors
# Vectors and basic indexing
vec <- c(1L, 2L, 3L, 4L, 5L)
# Alternatively
vec <- 1:5
typeof(vec)

vec
vec[2] # Access second element

# Lists
lst <- list(Name = "Alice", Age = 25, Scores = c(90, 95, 85))
print(lst)
print(lst$Scores)

# Matrices
mat <- matrix(1:9, nrow=3, ncol=3)
mat

# Data Frames
df <- data.frame(Name = c("Alice", "Bob"), Age = c(25, 30))
df
df$Name # Access column
View(df)



# 5. Importing and Exploring Data -----------------------------------------



# Reading CSV files
data <- read.csv("data.csv")
print(head(data))

# Checking data structure
print(str(data))
print(summary(data))



# 6. Basic Data Visualization ---------------------------------------------



# Base R plotting
plot(
  data$mpg, 
  data$hp, main = "MPG vs Horsepower", 
  xlab = "MPG", 
  ylab = "Horsepower", 
  col = "blue"
)

# Introduction to `ggplot2`
library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = hp)) + 
  geom_point(color = "blue") + 
  theme_minimal()



# 7. Wrap-Up and Next Steps -----------------------------------------------



# Recap of key concepts

# Suggestions for practice:
# - Try modifying variables and data frames
# - Import and visualize your own dataset

# Next steps: Functions, loops, conditional statements
my_function <- function(name) {
  return(paste("Hello,", name, "!"))
}
my_function("Alice")


# 8. Exercises ------------------------------------------------------------

# 1. Create a new data frame with three columns: "ID", "Name", and "Score".
#    Fill it with at least three rows of data.

# 2. Modify an existing vector by adding a new element.

# 3. Use ggplot2 to create:
#    a) A scatter plot of "mpg" vs. "hp" from `data.csv` (already loaded as `data`).
#    b) A bar plot showing the count of cars for each cylinder category (`cyl` column).

