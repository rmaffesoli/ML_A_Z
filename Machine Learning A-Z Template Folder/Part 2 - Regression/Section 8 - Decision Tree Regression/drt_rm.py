# Decision Tree Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.tree import DecisionTreeRegressor

# Importing the dataset
dataset = pd.read_csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 8 - Decision Tree Regression/Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values


regressor = DecisionTreeRegressor(random_state=0)
regressor.fit(X, y)

X_pred = 6.5
y_pred = regressor.predict([[X_pred]])
print(y_pred)

X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color='red')
plt.plot(X_grid, regressor.predict(X_grid), color='blue')
plt.scatter(X_pred, y_pred, color='green')
plt.title('Truth or Bluff (DTR)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()
