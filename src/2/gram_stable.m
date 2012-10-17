function [ Q, R ] = gram_stable( A )
%GRAM_STABLE Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(A);
V = A;
Q = zeros(m, n);
R = zeros(n);

for i=1:n
  R(i,i) = norm(V(:,i), 2);
  Q(:,i) = V(:,i)/R(i,i);
  for j=i+1:n
    R(i,j) = Q(:,i)'*V(:,j);
    V(:,j) = V(:,j) - R(i,j)*Q(:,i);
  end
end

end
