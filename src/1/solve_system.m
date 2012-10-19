function [ x ] = solve_system( A, b )
%SOLVE_SYSTEM Summary of this function goes here
%   Detailed explanation goes here

[P, L, U] = gauss(A);
y = forward(L, P*b);
x = backward(U, y);

end

