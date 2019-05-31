# install.packages('e1071', repos = "http://cran.us.r-project.org")
library(ggplot2)
library(e1071)

dataset = read.csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)/Position_Salaries.csv')

regressor = svm(formula=Salary ~ .,
                data=dataset,
                type='eps-regression')

# y_pred = predict(regressor, data.frame(Level = 6.5))


ggplot() +
  geom_point(aes(x=dataset$Level, y = dataset$Salary),
                 color='red') +
  geom_line(aes(x=dataset$Level, y = predict(regressor, newdata=dataset)),
                 color='blue') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')
