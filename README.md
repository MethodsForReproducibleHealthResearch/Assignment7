# Assignment #7 Repository

Files: 
-cohort.csv (raw data)
-Assignment7.rmd; code containing analysis
-Assignment7.pdf; knitted output from Assignment7.rmd

Dataset:

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

Analyses Performed:

Summary Statistics; A detailed summary of the dataset was generated, providing insights into the distribution and characteristics of the variables. A table describing each variable, including its type, number of missing values, and unique values, was created.
Linear Regression Analysis; A linear regression model was fit to the data to investigate the relationship between age and cost. The model used the following formula: cost ~ age.

Results:
The intercept estimate was 8932.39, with a standard error of 14.68, indicating the baseline cost when age is zero. The coefficient for age was 17.84, with a standard error of 0.34, suggesting that for each additional year of age, the cost increases by approximately 17.84 units. The model had a Residual Standard Error of 322.1 on 4998 degrees of freedom, indicating the average deviation of the observed costs from the fitted values. The R-squared value was 0.36, and the Adjusted R-squared value was 0.3599, meaning that approximately 36% of the variability in cost is explained by age. The F-statistic was 2812, with a p-value of less than 2.2e-16, indicating that the model is statistically significant.

Visualization: A scatter plot with the regression line was created to provide a visual representation of the relationship between age and cost. A variable importance plot from the Random Forest model was also generated to highlight the key predictors.

Conclusion
The analyses demonstrated a significant positive relationship between age and cost. The linear regression model indicated that as age increases, cost also tends to increase. The Random Forest analysis further confirmed the importance of age as a key predictor for cost. These findings can be used to better understand and predict cost variations based on age.