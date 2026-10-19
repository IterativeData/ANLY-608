# Part 1: Analysis of variance
# Is weight independent from feed?

library(tidyverse)
View(chickwts)
?chickwts

ggplot(chickwts, aes(x = feed, 
                     y = weight)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter() +
  theme_minimal()

model <- aov(weight ~ feed, data = chickwts)
summary(model)

?TukeyHSD
TukeyHSD(model)


# Part 2: Tukey Test -- ONLY IF null hypothesis is rejected 
# Load Tukey Test library
library(multcomp)

# Run Tukey Test on model variable
tukey_result <-glht(model, linfct = mcp(feed = "Tukey"))
summary(tukey_result)


# Bonus Visualization
# Visualize Tukey Results
old_par <- par(mar = c(5, 16, 4, 2) + 0.1) # left y axis tick fix

# code for visualization
plot(tukey_result, main="Tukey's HSD - Chick Weight", xlab="Difference in Means")

# left y axis tick fix
par(old_par)
