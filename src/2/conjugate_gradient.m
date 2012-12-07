function [ x_old ] = conjugate_gradient( A, b )
%CONJUGATE_GRADIENTS Solve Ax = b. A must be positive definite

x_old = zeros(length(A), 1);
r_old = b;
p_old = r_old;

for i=1:100
  alpha = r_old'*r_old/(p_old'*A*p_old);
  x_old = x_old + alpha*p_old;
  r = r_old - alpha*A*p_old;
  beta = (r'*r)/(r_old'*r_old);
  p_old = r + beta*r_old;

  r_old = r;
end


end

