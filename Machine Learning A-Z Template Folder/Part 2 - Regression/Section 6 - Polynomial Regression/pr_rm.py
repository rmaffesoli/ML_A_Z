import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# from sklearn.impute import SimpleImputer
from sklearn.preprocessing import PolynomialFeatures  # , LabelEncoder, OneHotEncoder, StandardScaler,
# from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
# from sklearn.compose import ColumnTransformer
# import statsmodels.formula.api as sm


dataset = pd.read_csv('/Users/rmaffesoli/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 6 - Polynomial Regression/Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

lin_reg = LinearRegression()
lin_reg.fit(X, y)
y_pred = lin_reg.predict(X)


lin_reg2 = LinearRegression()
poly_reg = PolynomialFeatures(degree=4)
X_poly = poly_reg.fit_transform(X)
poly_reg.fit(X_poly, y)
lin_reg2.fit(X_poly, y)
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape((len(X_grid), 1))
y_pred2 = lin_reg2.predict(poly_reg.fit_transform(X_grid))

# y_pred3 = lin_reg.predict(6.5)
# y_pred4 = lin_reg2.predict(poly_reg.fit_transform(6.5))


plt.scatter(X, y, color='red')
plt.plot(X, y_pred, color='blue')
plt.plot(X_grid, y_pred2, color='green')
# plt.scatter(6.5, y_pred3, color='yellow')
# plt.scatter(6.5, y_pred4, color='purple')
plt.title('Truth or Bluff')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()
