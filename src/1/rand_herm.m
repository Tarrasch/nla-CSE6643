function [ M ] = rand_herm( n )
%RAND_HERM Summary of this function goes here
%   Detailed explanation goes here

A = rand(n);
M = triu(A) + triu(A, 1)';

end

