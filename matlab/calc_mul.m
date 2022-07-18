function MF = calc_mul(sigma1, sigma2)
    pts = -5:0.1:5;
    l = length(pts);
    MF = zeros(l);
    for i = 1:l
        for j = 1:l
            MF(i, j) = normcdf(pts(i), 0, sigma1) * normcdf(pts(j), 0, sigma2);
        end
    end
    MF = MF / sum(MF(:));
end