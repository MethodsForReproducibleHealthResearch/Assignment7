#install.packages("dplyr")
#install.packages("knitr")
#install.packages("tidyr")
#install.packages("psych")
#install.packages("coefplot")
#install.packages("ggplot2")
library(dplyr)
library(knitr)
library(tidyr)
library(psych)
library(coefplot)
library(ggplot2)

# set wd and read in data.
setwd("~/Documents/GitHub/Assignment7")
output <- "~/Documents/GitHub/Assignment7/analysis/output"
data <- read.csv("~/Documents/GitHub/Assignment7/raw-data/cohort.csv")

#####     Create Table     #####
# generate summary stats, gather min, mean, max and SD for each variable. 
summary_stats <- describe(data)
summary_stats_table <- summary_stats[c("min", "mean", "max", "sd")]

# format, generate LaTeX, and save table 
colnames(summary_stats_table) <- c("Min", "Mean", "Max", "SD")  
rownames(summary_stats_table) <- c("Smoke", "Female", "Age", "Cardiac", "Cost")
latex_code <- knitr::kable(summary_stats_table, format = "latex", booktabs = TRUE)
output_path <- file.path(output, "summary_stats_table.tex")
cat(latex_code, file = output_path)

#####     Run regression and plot results     #####
ols <- lm(cost ~ age + cardiac + female + smoke, data = data)
summary(ols)
plot_ols <- coefplot(ols, title = "", xlab = "Estimate", ylab = "Variable") + 
  theme(panel.background = element_rect(fill = "white"))
ggsave(file.path(output, "coefficient_plot.pdf"), plot_ols, width = 8, height = 6)