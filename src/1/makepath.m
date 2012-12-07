function [ path ] = makepath( problem, filename, n)
%TOFILE Summary of this function goes here
% example:
%   content  = "123.25e+21"
%   filename = "1-eigenvalue" (without n and full path)

path = ['data/' problem '-' filename '-' num2str(n) '.dat'];

end


