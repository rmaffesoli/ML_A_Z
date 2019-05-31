import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.svm import SVR
from sklearn.preprocessing import StandardScaler

dataset = pd.read_csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)/Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2:].values

sc_X = StandardScaler()
sc_y = StandardScaler()
X = sc_X.fit_transform(X)
y = sc_y.fit_transform(y)

regressor = SVR(kernel='rbf')
regressor.fit(X, y)

X_pred = sc_X.transform(np.array([[6.5]]))
y_pred = regressor.predict(X_pred)
y_pred_it = sc_y.inverse_transform(y_pred)
y_it = sc_y.inverse_transform(y)

plt.scatter(X, y_it, color='red')
plt.scatter(X_pred, y_pred_it, color='green')
plt.plot(X, sc_y.inverse_transform(regressor.predict(X)), color='blue')
plt.title('Truth or Bluff (SVR)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()
