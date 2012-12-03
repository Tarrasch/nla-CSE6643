function [ r ] = rayleigh_quotient( A, x )
%UNTITLED Rayleigh quotient for x in context A

r = (x'*A*x)/(x'*x);

end

