m = n + 1;
h = 1 / m;
h2 = h*h;

on = ones(1, n-1);
A = gallery('tridiag', on, -2*[on 1], on);
b = arrayfun(@(i) (1/2-(i)*h)*h2, 1:n)';

u = A\b;
% u = solve_system(A, b);

% p = plot(0:h:1, [0 u' 0]);
% set(p,'Color', [0 (log2(m)-5.64)/6.2 0])
