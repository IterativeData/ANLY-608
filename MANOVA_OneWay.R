# Part 1: Bind Dependent Variables With Data Frames
dependent_variables <- cbind(df$dependent_variable1, df$dependent_variable2)

# Part 2: Create MANOVA Variable 
manova_model <- manova(dependent_variables ~ independent_variable, data = file_variable)

# Part 3: Assess, Default is Pillai Test, Check P 
summary(manova_model)

# Part 4: Check More Details With Each ANOVA Model
summary.aov(manova_model)

# Part 5: How Big Is The Effect?
install.packages ("effectsize") 
library(effectsize) 
effectsize::eta_squared(manova_model)


# Part 4: Post Hoc
install.packages("MASS") 
library(MASS) 
post_hoc <- lda(df$independent_variable ~ dependent_variables, CV=F) #CV=cross-validation, f=false 
post_hoc

# Part 5: Plot  
plot_lda <- data.frame(df[, "independent_variable"], lda = predict(post_hoc)$x) 
names(plot_lda) 
ggplot(plot_lda) + geom_point(aes(x = lda.LD1, y = lda.LD2, colour=df....independent_variable..), size = 4)
