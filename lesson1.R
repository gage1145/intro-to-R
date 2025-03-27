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
# Copy this code into the terminal and press Enter.
print("Hello, world!")

# Basic operations in R
2 + 2
sqrt(16)
log(10)
log10(10)
10 < 9



# 3. Data Types and Variables ---------------------------------------------



# To make the best of the R language, you'll need a strong understanding of the 
# basic data types and data structures and how to operate on those.

# Very Important to understand because these are the things you will manipulate 
# on a day-to-day basis in R. Most common source of frustration among beginners.

# Everything in R is an object.

# R has 5 basic atomic classes

# - logical (e.g., TRUE, FALSE)
# - integer (e.g,, 2L, as.integer(3))
# - numeric (real or decimal) (e.g, 2, 2.0, pi)
# - complex (e.g, 1 + 0i, 1 + 4i)
# - character (e.g, "a", "swc")


# Assigning variables (`<-` vs. `=`)
x <- 10
y = 5
z <- x + y
print(z)

# Data types
num_var <- 10.5
int_var <- 10L
chr_var <- "Hello"
log_var <- TRUE
com_var <- 1 + 1i
fun_var <- function() return()

typeof(num_var)
typeof(int_var)
typeof(chr_var)
typeof(log_var)
typeof(com_var)
typeof(fun_var)

# Vectors can not have multiple data types. Attempts at this will coerce certain
# data types into another.
# The coersion rule goes logical -> integer -> numeric -> complex -> character
c(TRUE, 10L) |> typeof()
c(10L, 10.1) |> typeof()
c(10, 10+1i) |> typeof()
c(10+1i, "a") |> typeof()



# 4. Basic Data Structures: Vectors ---------------------------------------



# A vector is the most common and basic data structure in R and is pretty much
# the workhorse of R. Vectors can be of two types:
  
# - atomic vectors
# - lists

# Atomic Vectors: all elements are of the same type.
vector()
vector(length = 10)
vector("character", 10)
vector("numeric", 10)
vector("integer", 10)
vector("logical", 10)
vector("complex", 10)

# Making vectors with the c() function.
vec <- c(1L, 2L, 3L, 4L, 5L)
# Access second element
vec[2]
# Scaling
vec * 2
# Adding scalars
vec + 0.1
# Get max value
max(vec)
# Get the sum of the vector
sum(vec)

# Adding elements to a vector
vec <- c(vec, 6)

# Creating a vector as a sequence of numbers
1:10
seq(10)
seq(1, 10, 0.1)

# Indexing a vector
vec <- c(14, 205, 302, 40, 29)
vec[3]
vec[vec > 200]



# 5. Basic Data Structures: Matrix ----------------------------------------



# Matrices are a special vector in R. They are not a separate class of object
# but simply a vector but now with dimensions added on to it. Matrices have rows
# and columns.
m <- matrix(nrow = 2, ncol = 2)
dim(m)
# same as
attributes(m)

# Matrices are constructed column-wise.
matrix(1:16, nrow = 4, ncol = 4)

# Another way to construct a matrix
m <- 1:16
dim(m) <- c(4,4)

# Bind columns and rows using cbind() and rbind().
x <- 1:3
y <- 10:12
cbind(x,y)
# or
rbind(x,y)



# 6. Basic Data Structures: Lists -----------------------------------------



# In R lists act as containers. Unlike atomic vectors, its contents are not 
# restricted to a single mode and can encompass any data type. Lists are 
# sometimes called recursive vectors, because a list can contain other lists. 
# This makes them fundamentally different from atomic vectors.

# Create a list using list().
lst <- list(1L, "a", TRUE, 10.1, 1+10i)

# Coerce a vector into a list.
x <- 1:10
x <- as.list(x)


lst <- list(Name = "Alice", Age = 25, Scores = c(90, 95, 85))

# Indexing a list
lst$Scores
lst["Scores"]
lst[["Scores"]]
lst[3]
lst[[3]]

# Lists can be recursive
lst <- list(list(list(list())))



# 7. Basic Data Structures: Factors ---------------------------------------



# Factors are special vectors that represent categorical data.
# Factors can only contain pre-defined values.
# Factors can be ordered or unordered.

# Unordered example
fct <- factor(c("male", "female"))

# Ordered example
fct <- factor(
  c("small", "medium", "large", "small", "large", "small"), 
  levels = c("small", "medium", "large")
)

# Frequency table
table(fct)

# Strip out the class information
unclass(fct)



# 8. Basic Data Structures: Data Frames -----------------------------------



# A data frame is a very important data type in R. It's pretty much the de facto 
# data structure for most tabular data.

# A data frame is a special type of list where every element of a list has the 
# same length.

df_ <- data.frame(id = LETTERS[1:26], x = 1:26, y = rnorm(26), z = 1+2i)

# Check that the data frame is actually a list.
is.list(df_)
# Check that the list is a data.frame.
class(df_)

# Useful functions for data frames.
str(df_)
head(df_)
tail(df_)
dim(df_)
nrow(df_)
ncol(df_)
names(df_)

# Accessing a column

# Access a column as a list
df_["id"]
# Access a column as an atomic vector.
df_$id
df_[["id"]]

# Naming objects

# Rename data frame columns
colnames(df_) <- c("Letters", "index", "dist", "comp")

# Naming a vector
x <- 1:3
names(x) <- c("rich", "daniel", "diego")
x

# Naming a list
x <- as.list(1:10)
names(x) <- letters[seq(x)]
x

# Naming matrix dimensions
m <- matrix(1:4, nrow = 2)
# First element is row names, second is column names.
dimnames(m) <- list(c("a", "b"), c("c", "d"))



# 9. Missing Values -------------------------------------------------------



# Missing values are denoted by NA, NaN, or Inf.
is.na(NA)
is.nan(NaN)
is.infinite(Inf)

x <- c(1, 2, NA, 4, 5)
is.na(x)
is.nan(x)
is.infinite(x)

x <- c(1,2, NA, 0/0, 4, 1/0)
is.na(x)
is.nan(x)
is.infinite(x)



# 10. Importing and Exploring Data ----------------------------------------



# Reading CSV files
data <- read.csv("data.csv")
print(head(data))

# Checking data structure
print(str(data))
print(summary(data))



# 11. Basic Data Visualization --------------------------------------------



# Base R plotting
plot(
  mtcars$mpg, 
  mtcars$hp, 
  main = "MPG vs Horsepower", 
  xlab = "MPG", 
  ylab = "Horsepower", 
  col = "blue"
)

# Introduction to `ggplot2`
library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = hp)) + 
  geom_point(color = "blue") + 
  theme_minimal()



# 12. Wrap-Up and Next Steps ----------------------------------------------



# Recap of key concepts

# Suggestions for practice:
# - Try modifying variables and data frames
# - Import and visualize your own dataset

# Next steps: Functions, loops, conditional statements
my_function <- function(name) {
  return(paste("Hello,", name, "!"))
}
my_function("Alice")



# 13. Exercises -----------------------------------------------------------



# 1. Create a new data frame with three columns: "ID", "Name", and "Score".
#    Fill it with at least three rows of data.

# 2. Modify an existing vector by adding a new element.

# 3. Use ggplot2 to create:
#    a) A scatter plot of "mpg" vs. "hp" from `data.csv` (already loaded as `data`).
#    b) A bar plot showing the count of cars for each cylinder category (`cyl` column).

