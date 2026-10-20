# Part 0: Inspecting Data
View(ToothGrowth)

ggplot(ToothGrowth, aes(x = factor(dose), 
                     y = len)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter() +
  theme_minimal()

ggplot(ToothGrowth, aes(x = factor(supp), 
                        y = len)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter() +
  theme_minimal()


# Part 1: Identify Variables and Convert To Factors (if applicable)
ToothGrowth$dose <- factor(ToothGrowth$dose)

# Part 1A: Test One-Way ANOVA For Each Variable (To get a baseline)
one.way <- aov(len ~ supp, data = ToothGrowth)
summary(one.way)

one.way.dose <- aov(len ~ dose, data = ToothGrowth)
summary(one.way.dose)

# Part 2: Test Independent Variables Together
two.way <- aov(len ~ supp + dose, data = ToothGrowth)
summary(two.way)

# Part 3: Test Both Independent Variables AND Their Interaction
two.way_interaction <- aov(len ~ supp*dose, data = ToothGrowth)
summary(two.way_interaction)

# Part 4: Test The Extra Column(s), (if data has an extra column)
blocking <- aov(Dependent_Variable ~ Independent_Variable + Independent_Variable + Independent_Variable, data = file_name)
summary(blocking)


# Part 5: Which Model Wins? aictab()
model.set <- list(one.way, one.way.dose, two.way, two.way_interaction)
model.names <- c("supp_only","dose_only", "two.way", "two.way_interaction")
aictab(model.set, modnames = model.names)

# Part 6: Check Tables  (Based on best aictab() top model)
          # Check p values (stars to see if the IV matters if <.05 )
summary(two.way_interaction)

# Part 7: TukeyHSD() Which Groups Differ?  
  # Use Decision Tree to decide which model and variables to run Tukey on
TukeyHSD(two.way_interaction, "supp:dose")

