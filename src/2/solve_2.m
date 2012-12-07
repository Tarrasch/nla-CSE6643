m = n + 1;
h = 1 / m;
h2 = h*h;
x = h:h:1-h; % x is the vector x. not the Ax=b thingie!

% temporrary assignments
lambda = 1.0;
a = @(x) diag(sparse(x)); % sparse diag
a_prime = @(x) sparse(1:length(x), 1:length(x), 1); % sparse eye
% a = @(x) sparse(1:length(x), 1:length(x), 2); % sparse eye
% a_prime = @(x) sparse(length(x), length(x));
% a = @(x) sparse(length(x), length(x));
% a_prime = @(x) sparse(length(x), length(x));

on = ones(1, n-1);
h0_part = sparse(1:n, 1:n, lambda);
h1_part = a_prime(x)*gallery('tridiag', -on, zeros(n,1), on)/(2*h);
h2_part = a(x)*gallery('tridiag', on, -2*[on 1], on)/h2;
S = h0_part - h1_part - h2_part;
if ~is_posdef(S)
  display ' (!) The matrix is not positive definite, CG wont work!'
else
  display ' Hooray, matrix is posdef'
end
A = full(S);
b = (-0.5+h:h:0.5-h)';

tic
x_sd = steepest_descent(S, b);
toc
tic
x_cg = conjugate_gradient(S, b);
toc

% Plotting
myplot = @(values) plot(0:h:1, [0; values; 0]);
hold on
myplot(x_sd)
myplot(x_cg)
hold off
