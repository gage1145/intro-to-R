# Advanced Data Visualization with the ggplot2 Library



# 1. Introduction to ggplot2 ----------------------------------------------



# Load the ggplot2 library
library(ggplot2)

# Basic structure of a ggplot2 plot
ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() +



# 2. Customizing Plots ----------------------------------------------------


  
  # Add labels
  labs(
    title = "MPG vs Horsepower",
    x = "Miles per Gallon",
    y = "Horsepower"
  ) +
  # Change the theme
  theme_bw() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5)
  ) +




# 3. Faceting -------------------------------------------------------------



  facet_grid(cols = vars(cyl))



# 4. Customizing Aesthetics -----------------------------------------------



# Changing colors based on a factor or continuous variable.
ggplot(mtcars, aes(x = mpg, y = hp, color = factor(cyl))) + 
  geom_point(size = 5)

# Mapping variables to point size
ggplot(mtcars, aes(x = mpg, y = hp, size = wt, color = factor(cyl))) + 
  geom_point()



# 5. Using Scales ---------------------------------------------------------



# Adjusting the appearance of plot elements using scale_* functions.
ggplot(mtcars, aes(x = mpg, y = hp, color = factor(cyl))) + 
  geom_point(size = 5) + 
  scale_color_manual(values = c("red", "blue", "green"))

ggplot(mtcars, aes(x = mpg, y = hp)) + 
  geom_point() + 
  scale_y_log10()



# 6. Adding Annotations ---------------------------------------------------



ggplot(mtcars, aes(x = mpg, y = hp)) + 
  geom_point() + 
  annotate("text", x = 25, y = 200, label = "High MPG", color = "red") +
  annotate("text", x = 15, y = 200, label = "Low MPG", color = "blue")



# 7. Saving Plots ---------------------------------------------------------



ggsave("scatter_plot.png", plot = last_plot(), width = 8, height = 6)





