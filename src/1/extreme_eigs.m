function [ output_args ] = extreme_eigs( A, b )
%EXTREME_EIGS Return smallest and biggest eigenvalue

[v_l, largest, it_l] = power_iteration(A);
[v_s, smallest, it_s] = inverse_iteration(A,0);
extreme_values = [largest, smallest]';



end

