# Part 1: First F Test Proving Insignifcant IV:Covariant Interaction

  #Generalized Full Model (With IV:Covariant Interaction)
model.1 = lm (dependent_variable ~ Covariant + independent_variable + Covariant:independent_variable, data = Data)

  #Reduced ANCOVA Model (Goal is to show that the interaction term is not statistically significant do this by comparing full model with reduced model)
model.2 = lm (dependent_variable ~ Covariant + independent_variable, data = Data)

  # General linear F test on Full Model and Reduced Model
  # (to make sure indpendent categorical variable is significant AND to make sure IV_CategoricalVariable:Covariant is not significant)
anova(model.1,model.2)

    # If IV_CategoricalVariable:Covariant interaction is not significant (>.05) use ANCOVA model


# Part 2: Second F Test Proving ANCOVA effect is statistically significant <.05 (Proving ANCOVA Model is the right model to use)

  #Full model for this 2nd F Test is model.2 (ANCOVA model)

  #Reduced Model is a simple linear regression model
model.3 = lm (dependent_variable ~ Covariant, data = Data)

  #2nd General linear F test
anova(model.2,model.3)

#Final model is ANCOVA if F Tests meet criteria
summary(model.2)        

# Part 3: Assumption 2 Homogeneity of variance 
leveneTest(dependent_variable~independent_variable, data = an)



# Part 4: Post Hocs

file_variable$independent_variable <- factor(an$independent_variable) 
install.packages("multcomp") 
library(multcomp)
ancova_model <- aov(dependent_variable ~ independent_variable + covariate_variable, data =an) 

postHocs <- glht(model.2, linfct = mcp(independent_variable = "Tukey"))
summary(postHocs)


# Part 5: Visualization
# Plot
I.nought = -7.21091
I1 = I.nought + 0
I2 = I.nought + -10.06529
B  = 3.60275

plot(x   = Data$Temp,
     y   = Data$Pulse,
     col = as.factor(Data$Species),
     pch = 16,
     xlab = "Covariant",
     ylab = "Dependent Variable")

legend('bottomright',
       legend = levels(as.factor(Data$independent_variable)),
       col = 1:2,
       cex = 1,   
       pch = 16)

abline(I1, B, lty=1, lwd=2, col = 1)

abline(I2, B, lty=1, lwd=2, col = 2)


# Source: https://www.youtube.com/watch?v=2r0cFzBqyz4
