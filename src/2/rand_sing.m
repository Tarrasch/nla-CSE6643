function [ A ] = rand_sing( sigmas )
%RAND_SING Generate random A which have the singular values sigmas

n = length(sigmas)
[u,ignore1] = gram_stable((rand(n)));
sigmas;
[v_star,ignore2] = gram_stable((rand(n)));

A = u * diag(sigmas) * v_star;

end

