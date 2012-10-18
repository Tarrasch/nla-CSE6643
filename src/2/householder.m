function [ R, V ] = householder( A )
%HOUSEHOLDER Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(A);
V = cell(1,n);

for k = 1:n
  x = A(k:m,k);
  V{k} = [sign(x(1))*norm(x, 2) zeros(1, length(x)-1)]' + x;
  V{k} = V{k}/norm(V{k}, 2);
  A(k:m, k:n) = A(k:m, k:n) - 2*V{k}*(V{k}'*A(k:m, k:n));
end

R = A;
