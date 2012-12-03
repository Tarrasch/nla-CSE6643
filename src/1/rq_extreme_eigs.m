function [ output_args ] = rq_extreme_eigs( A, b )
%EXTREME_EIGS Return smallest and biggest eigenvalue

n = length(A);
% TODO implement real solution
highest = rayleigh_quotient(A, rq_iteration(A, ev_guess(n, true)));
smallest = rayleigh_quotient(A, rq_iteration(A, ev_guess(n, false)));
output_args = [highest, smallest]';



end


