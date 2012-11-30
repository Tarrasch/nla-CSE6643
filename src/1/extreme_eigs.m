function [ output_args ] = extreme_eigs( A, b )
%EXTREME_EIGS Return smallest and biggest eigenvalue

% TODO implement real solution
temp = sort(eig(A));
output_args = temp([1 end]);

end

