rand('seed', 0);
data = randn(5000, 10);

function [corr1, corr2] = foo(data, scale)
  avg = [1 2 3 4 5 6 7 8 9 10];

  data = data + repmat(avg * scale, 5000, 1);

  m = mean(data);
  m1 = m / norm(m);

  # without centering
  # data = ~ * S * V'
  [~, S, V] = svd(data);
  S = diag(S);
  # first eigenvector
  # data' * data
  # column vector
  # no transpose?
  e1 = V(:, 1); 

  # with centering
  newdata = data - repmat(m, 5000, 1);
  [~, S, V] = svd(newdata);
  S = diag(S);
  # first eigenvector
  new_e1 = V(:, 1);

  avg = avg - mean(avg);
  avg = avg / norm(avg);

  e1 = e1 - mean(e1);
  e1 = e1 / norm(e1);

  new_e1 = new_e1 - mean(new_e1);
  new_e1 = new_e1 / norm(new_e1);

  corr1 = avg * e1;
  # note transpose
  corr2 = e1' * new_e1;
endfunction

##scales = [1 0.5 0.1 0.05 0.01 0.005 0.001 0.0005 0.0001];
##corr1_list = [];
##corr2_list = [];
##
##for i=1:9
##  [corr1, corr2] = foo(data, scales(i));
##  corr1_list(i) = corr1;
##  corr2_list(i) = corr2;
##endfor

plot(scales, corr1_list, scales, corr2_list);
legend('corr1', 'corr2');

p = polyfit(corr1_list, corr2_list, 1)