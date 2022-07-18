from sklearn.model_selection import KFold
import numpy as np

X = np.arange(20).reshape(10, 2)
y = np.array([1, 1, 2, 2, 2, 2, 2, 2, 2, 2])
kf = KFold(n_splits=2, shuffle=True)

sum = 0
total = 100000
for i in range(total):
    gen = kf.split(X).__iter__()
    train_index, test_index = gen.__next__()
    # print('train_index %s, test_index %s' % (train_index, test_index))
    # print('train_tag %s, test_tag %s' % (y[train_index], y[test_index]))
    sum += np.bincount(y[train_index])[1] != 1
print(sum)