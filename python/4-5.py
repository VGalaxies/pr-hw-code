import numpy as np
from sklearn import metrics
import matplotlib.pyplot as plt

y_true = np.array([1, 0, 1, 1, 0, 1, 0, 0, 1, 0])
y_scores = np.array([1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1])

precision, recall, thresholds = metrics.precision_recall_curve(y_true, y_scores)
print(precision, recall, thresholds, sep='\n')

plt.plot(recall, precision)
plt.xlabel('recall')
plt.ylabel('precision')
plt.show()

print(metrics.auc(recall, precision))
print(metrics.average_precision_score(y_true, y_scores))