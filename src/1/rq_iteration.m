function [ v_old, value, iterations ] = rq_iteration( A, v_guess )
%RQ_ITERATION Get an eigenvector given a close guess of it

[m, ign] = size(A);
v_old = v_guess;

iterations = 0;
lambda = rayleigh_quotient(A, v_old);
M = A-lambda*eye(m);
while abs(det(M)) > 0.000001
  iterations = iterations + 1;
  w = M\v_old;
  v_old = w/norm(w);
  lambda = rayleigh_quotient(A, v_old);
  M = A-lambda*eye(m);
end
value = rayleigh_quotient(A, v_old);
