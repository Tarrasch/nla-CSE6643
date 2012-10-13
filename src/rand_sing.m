function [ A ] = rand_sing( sigmas )
%RAND_SING Generate random A which have the gives singular values

n = length(sigmas)
[u,ignore1] = gram_stable((rand(n)))
sigmas
[v_star,ignore2] = gram_stable((rand(n)))

A = u * diag(sigmas) * v_star

end

