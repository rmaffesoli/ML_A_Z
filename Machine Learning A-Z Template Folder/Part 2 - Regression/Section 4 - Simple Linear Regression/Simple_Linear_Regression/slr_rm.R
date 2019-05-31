# install.packages('caTools', repos = "http://cran.us.r-project.org")
# install.packages('ggplot2', repos = "http://cran.us.r-project.org")

dataset = read.csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 4 - Simple Linear Regression/Simple_Linear_Regression/Salary_Data.csv')

library(caTools)
library(ggplot2)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula=Salary ~ YearsExperience, data=training_set)
# summary(regressor)

y_pred_train = predict(regressor, newdata = training_set)
y_pred_test = predict(regressor, newdata = test_set)

ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color='red') +
  geom_line(aes(x=training_set$YearsExperience, y=y_pred_train),
            color='blue') +
  geom_point(aes(x=test_set$YearsExperience, y=y_pred_test),
             color='green') +
  ggtitle('Salary vs Experience') +
  xlab('Years of Experience') +
  ylab('Salary')
