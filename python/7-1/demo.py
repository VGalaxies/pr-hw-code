from libsvm.svmutil import *

y, x = svm_read_problem('./data/w1a')
yt, xt = svm_read_problem('./data/w1a.t')
prob = svm_problem(y, x)
param = svm_parameter('-w+1 10')
model = svm_train(prob, param)
