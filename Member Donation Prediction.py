import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import seaborn as sns
from sklearn.metrics import confusion_matrix, classification_report, roc_ 
df = pd.read_csv('/Users/xiaohangli/Desktop/215 Query 1 result.csv')
x = df.drop(columns= (['PID', 'Donation_Made']))
y = df['Donation_Made']
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2)
logmodel = LogisticRegression()
logmodel.fit(x_train, y_train)
ypred = [1 if i >= 0.5 else 0 for i in logmodel.predict(x_test)]
Acc = np.mean(ypred == y_test)
cm = confusion_matrix(y_test, ypred) 
tn, fp, fn, tp = cm.ravel()
TPR = tp / (tp + fn) if (tp + fn) > 0 else 0 
FPR = fp / (fp + tn) if (fp + tn) > 0 else 0 
print(f"Accuracy: {Acc}")
print("True Positive Rate (TPR):", TPR) 
print("False Positive Rate (FPR):", FPR)
plt.figure()
sns.lineplot(x=fpr, y=tpr)
plt.plot([0, 1], [0, 1], linestyle='--', color='gray')
plt.show()