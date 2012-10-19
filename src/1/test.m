function [ output_args ] = test( n )
%TEST Summary of this function goes here
%   Detailed explanation goes here

A = rand(n)
b = rand(n, 1)
A\b
solve_system(A, b)
A\b - solve_system(A, b)

end

