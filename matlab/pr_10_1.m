n = 100;
pts = 1:n;
l = length(pts);
fib = zeros(l, 1);
for i = 1:l
    fib(i) = fibonacci(i) / (fibonacci(n + 2) - 1); 
end

stem(pts, fib, 'filled');