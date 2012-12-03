function [ output_args ] = extreme_eigs( A, b )
%EXTREME_EIGS Return smallest and biggest eigenvalue

% TODO implement real solution
highest = rayleigh_quotient(A, power_iteration(A));
smallest = rayleigh_quotient(A, inverse_iteration(A,0));
output_args = [highest, smallest]';



end

