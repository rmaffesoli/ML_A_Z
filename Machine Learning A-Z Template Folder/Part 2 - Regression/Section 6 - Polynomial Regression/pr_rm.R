

dataset = read.csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 6 - Polynomial Regression/Position_Salaries.csv')
dataset = dataset[2:3]

# library(caTools)
# set.seed(123)

lin_reg = lm(formula= Salary ~ .,
             data=dataset)

# print(summary(lin_reg))

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula= Salary ~ .,
             data=dataset)
# print(summary(poly_reg))

library(ggplot2)
ggplot() +
  geom_point(aes(x=dataset$Level, y = dataset$Salary),
                 color='red') +
  geom_line(aes(x=dataset$Level, y = predict(lin_reg, newdata=dataset)),
                 color='blue') +
  geom_line(aes(x=dataset$Level, y = predict(poly_reg, newdata=dataset)),
                color='green') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

y_pred_lin = predict(lin_reg, data.frame(Level=6.5))
y_pred_poly = predict(poly_reg, data.frame(Level=6.5,
                                           Level2=6.5^2,
                                           Level3=6.5^3,
                                           Level4=6.5^4))
