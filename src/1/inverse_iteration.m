function [ v_old, value, k ] = inverse_iteration( A, mu )
%INVERSE_ITERATION Yields ev corresponding to provided ew estimate mu

[m, ign] = size(A);
v_old = zeros(m,1);
v_old(1) = 1;

for k = 2:101
  w = (A-mu*eye(m))\v_old;
  v_old = w/norm(w);

end
value = rayleigh_quotient(A, v_old);
