iSigma = inv([2 1; 1 4]);
pts = -5:0.1:5;
l = length(pts);
GT = zeros(l);
for i = 1:l
    for j = 1:l
        temp = [pts(i) pts(j)];
        GT(i, j) = exp(-0.5 * temp * iSigma * temp');
    end
end
GT = GT / sum(GT(:));

range = 0.05:0.05:3;
l = length(range);
ERROR = zeros(l);
for i = 1:l
    for j = 1:l
        MF = calc_mul(i, j);
        ERROR(i, j) = 1 - sum(min(GT(:), MF(:)));
        fprintf("i = %d, j = %d\n", i, j);
    end
end

surf(range, range, ERROR);