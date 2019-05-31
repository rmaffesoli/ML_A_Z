# install.packages('caTools', repos = "http://cran.us.r-project.org")
# install.packages('ggplot2', repos = "http://cran.us.r-project.org")


backwardsElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~., data=x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[,-j]
    }
    numVars = numVars - 1
  }
  return(regressor)
}


dataset = read.csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 5 - Multiple Linear Regression/50_Startups.csv')

# library(ggplot2)
library(caTools)

dataset$State = factor(dataset$State,
                       levels=c('New York', 'California', 'Florida'),
                       labels=c(1, 2, 3))


set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
SL = 0.05
dataset = dataset[,c(1,2,3,4,5)]
regressor = backwardsElimination(training_set, SL)
print(summary(regressor))
y_pred = predict(regressor, test_set)

# regressor = lm(formula = Profit ~ .,
               # data=training_set)
# print(summary(regressor))
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               # data=dataset)
# print(summary(regressor))
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               # data=dataset)
# print(summary(regressor))
# regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               # data=dataset)
# print(summary(regressor))
# regressor = lm(formula = Profit ~ R.D.Spend,
               # data=dataset)
# print(summary(regressor))
