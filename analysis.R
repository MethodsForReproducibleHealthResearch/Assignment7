library(tidyverse)
library(gt)
library(webshot2)
library(ggplot2)
webshot::install_phantomjs()


data <- read.csv("raw-data/cohort.csv")  

data <- data %>%
  rename(
    gender = female,
    smoker = smoke
  )

# Convert to a factor with labels
data$cardiac <- factor(data$cardiac, levels = c(0, 1), labels = c("No", "Yes"))
data$gender <- factor(data$gender, levels = c(0, 1), labels = c("Male", "Female"))
data$smoker <- factor(data$smoker, levels = c(0, 1), labels = c("Non-Smoker", "Smoker"))

# Set variable labels
label(data$gender) <- "Gender"
label(data$cardiac) <- "Cardiac"
label(data$smoker) <- "Smoker"
label(data$age) <- "Age"
label(data$cost) <- "Cost"

# Create the descriptive table
library(table1)
table <- table1(~ age + cost + gender + smoker | cardiac, data = data)
print(table)

# Convert table to data frame for use with gt
table_df <- as.data.frame(table)

# Create gt table from data frame then save as image
gt_table <- gt(table_df)
gtsave(gt_table, filename = "summary_table.png", path = ".")




#plot gender and cardiac
library(ggplot2)
# Plot the relationship between gender and cardiac
ggplot(data, aes(x = gender, fill = cardiac)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribution of Cardiac Issues by Gender", x = "Gender", y = "Count", fill = "Cardiac Issues") +
  theme_minimal()
ggsave("gender_cardiac_plot.png")


#Regression analysis
#Logistic regression model 
# Univariate logistic regression for age
glm_age <- glm(cardiac ~ age, data = data, family = binomial)
summary(glm_age)

# Univariate logistic regression for cost
glm_cost <- glm(cardiac ~ cost, data = data, family = binomial)
summary(glm_cost)

# Univariate logistic regression for gender
glm_gender <- glm(cardiac ~ gender, data = data, family = binomial)
summary(glm_gender)

# Univariate logistic regression for smoker
glm_smoker <- glm(cardiac ~ smoker, data = data, family = binomial)
summary(glm_smoker)

# Multivariate logistic regression model
glm_model <- glm(cardiac ~ age + cost + gender + smoker, data = data, family = binomial)
summary(glm_model)

#Plot the predicted probabilities from the logistic regression model
data$predicted_prob <- predict(glm_model, type = "response")
ggplot(data, aes(x = predicted_prob, fill = cardiac)) +
  geom_histogram(binwidth = 0.05, position = "dodge") +
  labs(title = "Predicted Probabilities of Cardiac Issues", x = "Predicted Probability", y = "Count") +
  theme_minimal()
ggsave("predicted_probabilities_plot.png")

