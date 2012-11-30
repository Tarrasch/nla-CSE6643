m = n + 1;
h = 1 / m;
h2 = h*h;

on = ones(1, n-1);
A = gallery('tridiag', on, -2*[on 1], on);
b = arrayfun(@(i) (1/2-(i)*h)*h2, 1:n)';
