function [ v_old, value, k ] = power_iteration( A )
%POWER_ITERATION Yields eigenvector corresponding to highest eigenvalue

[m, ign] = size(A);
v_old = zeros(m,1);
v_old(1) = 1;

for k = 1:10000
  if m > 12800
    break
  end
  w = A*v_old;
  v_old = w/norm(w);
end
value = rayleigh_quotient(A, v_old);
