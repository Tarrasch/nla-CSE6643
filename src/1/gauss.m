function [ P, L, U ] = gauss( A )
%GAUSS Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(A);
U = A; L = eye(m); P = eye(m);
for k = 1:m-1
  [ignore, i] = max(abs(U(k:m,k)));
  i = i + k - 1;
  U1=U(k, k:m);
  U2=U(i, k:m);
  U(i, k:m) = U1;
  U(k, k:m) = U2;
  maxx=U2(1);
  L([k, i], 1:k-1) = L([i, k], 1:k-1);
  P([k, i], :) = P([i, k], :);
  for j = k+1:m
    L(j, k) = U(j, k)/maxx;
    U(j, k:m) = U(j, k:m) - L(j, k)*U2;
  end
end

end

