# Intermediate R: Control Structures, Functions, and Data Manipulation



# 1. Conditional Operations -----------------------------------------------



# if, else if, else
x <- 10
if (x > 5) {
  "x is greater than 5"
} else if (x == 5) {
  "x equals 5"
} else {
  "x is less than 5"
}

# ifelse() for vectorized conditions
nums <- c(3, 8, 1, 6)
ifelse(nums > 5, "Big", "Small")



# 2. Loops ----------------------------------------------------------------



# for loops
for (x in 1:10) {
  print(paste("x =", x))
  if (x > 5) {
    print("x is greater than 5")
  } else if (x == 5) {
    print("x equals 5")
  } else {
    print("x is less than 5")
  }
  cat("\n")
}

# while loops
x <- 1
while (x <= 10) {
  print(paste("x =", x))
  x <- x + 1
  cat("\n")
}



# 3. Writing Functions ----------------------------------------------------



# Create the is_five function.
is_five <- function(x) {
  if (x > 5) return(print("x is greater than 5"))
  if (x < 5) return(print("x is less than 5"))
  return(print("x equals 5"))
}

# Default arguments
greet <- function(name = "Student", mood = c("happy", "mad")) {
  if (is.vector(mood)) mood <- mood[1]
  if (mood == "happy") {
    return(print(paste0("Hello, ", name, ". Good to see you!")))
  }
  return(print(paste0("Ugh, it's you, ", name, ".")))
}

greet()
greet("Sarah")
greet("Sarah", "mad")



# 4. Applying Functions to Data -------------------------------------------



# Use apply() for matrices
mat <- matrix(1:9, nrow=3)
apply(mat, 1, sum)  # Row sums

# Use lapply() and sapply() for lists and vectors
numbers <- list(a = 1:3, b = 4:6)
lapplied <- lapply(numbers, sum)  # Returns a list
sapplied <- sapply(numbers, sum)  # Returns a vector

# Speed difference between loops and vectorized operations.
loop_start <- Sys.time()
for (x in 1:1000) is_five(x)
loop_end <- Sys.time()

vec_start <- Sys.time()
sapply(1:1000, is_five)
vec_end <- Sys.time()

loop_end - loop_start
vec_end - vec_start



# 5. Data Manipulation with dplyr -----------------------------------------


# Load the dplyr library
library(dplyr)

# Selecting and filtering
data <- read.csv("data.csv")
filtered_data <- data %>%
  filter(mpg > 20)

selected_data <- data %>%
  select(mpg, hp)

# Creating new columns
data <- data %>% 
  mutate(power_to_weight = hp / wt)

# Summarizing and grouping
sum_ <- data %>%
  group_by(cyl) %>%
  summarise(avg_mpg = mean(mpg))



# 6. Working with Factors -------------------------------------------------



# Creating factors
categories <- factor(c("low", "medium", "high", "low"))
print(categories)
levels(categories)

# Changing factor levels
categories <- factor(categories, levels = c("low", "medium", "high"))
categories



# 7. Exercises ------------------------------------------------------------



# 1. **Conditional Operations:** Write a function that returns 
#    "positive", "negative", or "zero" based on a number's value.
check_sign <- function(x) {
  # Your code here
}

# 2. **Loops:** Use a for loop to print all even numbers from 1 to 20.
for (i in 1:20) {
  # Your code here
}

# 3. **Functions:** Modify `greet()` to take an optional `time_of_day` argument.
greet <- function(name) {
  # Your code here
}

# 4. **Data Manipulation with dplyr**:
# - Find the car with the highest horsepower (`hp`).
most_powerful_car <- data
  # Your code here
  
# - Calculate the average miles per gallon (`mpg`) for cars with 6 cylinders.
avg_mpg_six_cyl <- data
  # Your code here



