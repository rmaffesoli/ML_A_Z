data_set = read.csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Data.csv')
# data_set = data_set[, 2:3]

data_set$Age = ifelse(is.na(data_set$Age),
                      ave(data_set$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      data_set$Age)
data_set$Salary = ifelse(is.na(data_set$Salary),
                         ave(data_set$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                         data_set$Salary)

data_set$Country = factor(data_set$Country,
                          levels= c('France', 'Spain', 'Germany'),
                          labels = c(1, 2, 3))

data_set$Purchased = factor(data_set$Purchased,
                            levels = c('No', 'Yes'),
                            labels= c(0,1))

# install.packages('caTools', repos = "http://cran.us.r-project.org")
library(caTools)
set.seed(123)
split = sample.split(data_set$Purchased, SplitRatio = 0.8)
training_set = subset(data_set, split == TRUE)
test_set = subset(data_set, split == FALSE)

# training_set[ ,2:3] = scale(training_set[ ,2:3])
# test_set[ ,2:3] = scale(test_set[ ,2:3])

print(training_set)
print(test_set)
