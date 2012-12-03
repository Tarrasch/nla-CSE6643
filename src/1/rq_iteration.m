function [ v_old ] = rq_iteration( A, v_guess )
%RQ_ITERATION Get an eigenvector given a close guess of it

[m, ign] = size(A);
v_old = v_guess;

for k = 2:101
  lambda_old = rayleigh_quotient(A, v_old);
  M = A-lambda_old*eye(m);
  if abs(det(M)) < 0.000001
    k
    break
  end
  w = M\v_old;
  v_old = w/norm(w);
end

