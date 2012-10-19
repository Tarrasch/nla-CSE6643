function [ y ] = forward( L, b )
%FORWARD Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(L);
y = zeros(m, 1);

for j = 1:m
  y(j) = (b(j) - L(j,1:j-1)*y(1:j-1))/L(j,j);
end

end

