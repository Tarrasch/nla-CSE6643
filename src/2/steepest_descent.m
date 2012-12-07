function [ x_old ] = steepest_descent( A, b )
%STEEPEST_DESCENT Solve Ax = b. A must be positive definite

kappa = condest(A);
x_old = b;

for i=1:kappa
  r = b - A*x_old;
  alpha = r'*r/(r'*A*r);
  x_old = x_old + alpha*r;
end

end

