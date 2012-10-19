function [ x ] = backward( U, b )
%BACKWARD Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(U);
x = zeros(m, 1);

for j = m:-1:1
  x(j) = (b(j) - U(j,j+1:m)*x(j+1:m))/U(j,j);
end

end

