function [ v_old, value, k ] = inverse_iteration( A, mu )
%INVERSE_ITERATION Yields ev corresponding to provided ew estimate mu

[m, ign] = size(A);
v_old = zeros(m,1);
v_old(1) = 1;
value_old = mu;

for k = 2:101
  w = (A-sparse(1:m,1:m,mu))\v_old;
  v_old = w/norm(w);
  value = rayleigh_quotient(A, v_old);
  delta = abs(value - value_old);
  if delta < 1e-14
    break
  end
  value_old = value;
end
