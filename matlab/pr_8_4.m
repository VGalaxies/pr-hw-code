% r = lognrnd(2, 0.5, 1000, 1);
% 
% [y1, x1, bw] = ksdensity(r);
% [y2, x2] = ksdensity(r, 'Bandwidth', 0.2);
% [y3, x3] = ksdensity(r, 'Bandwidth', 5);
% 
% x = 0:0.01:50;
% y = lognpdf(x, 2, 0.5);
% plot(x, y, x1, y1, x2, y2, x3, y3);
% legend('real', 'bw = default', 'bw = 0.2', 'bw = 5');

sample_list = [];
bw_list = [];
for index = 1:100
    samples = index * 1000;
    r = lognrnd(2, 0.5, samples, 1);
    [y, x, bw] = ksdensity(r);
    sample_list(index) = samples;
    bw_list(index) = bw;
end

plot(sample_list, bw_list);

