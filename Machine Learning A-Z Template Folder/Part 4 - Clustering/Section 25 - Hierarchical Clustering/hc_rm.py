import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.cluster.hierarchy as sch
from sklearn.cluster import AgglomerativeClustering

dataset = pd.read_csv('~/Documents/personal/ML_A_Z/Machine Learning A-Z Template Folder/Part 4 - Clustering/Section 24 - K-Means Clustering/Mall_Customers.csv')
X = dataset.iloc[:, [3, 4]].values

# dendrogram = sch.dendrogram(sch.linkage(X, method='ward'))
# plt.title('Clusters of clients')
# plt.xlabel('Customers')
# plt.ylabel('distances')
# plt.show()


hc = AgglomerativeClustering(n_clusters=5, affinity="euclidean", linkage='ward')
y_hc = hc.fit_predict(X)

plt.scatter(X[y_hc == 0, 0], X[y_hc == 0, 1], s=100, c='red', label='Smart Cookies')
plt.scatter(X[y_hc == 1, 0], X[y_hc == 1, 1], s=100, c='blue', label='Basic')
plt.scatter(X[y_hc == 2, 0], X[y_hc == 2, 1], s=100, c='green', label='Target')
plt.scatter(X[y_hc == 3, 0], X[y_hc == 3, 1], s=100, c='cyan', label='Loose')
plt.scatter(X[y_hc == 4, 0], X[y_hc == 4, 1], s=100, c='magenta', label='Frugal')
plt.title('Clusters of clients')
plt.xlabel('Annual income (k$)')
plt.ylabel('SpendingScore (1-100)')
plt.legend()
plt.show()
