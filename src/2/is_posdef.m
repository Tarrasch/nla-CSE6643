function [ output_args ] = is_posdef( A )

[R, p] = chol(A)
output_args = p == 0
end

