function [ Q ] = V_gives_Q( V )
%V_GIVES_Q Create Q from a list of reflection vectors

m = length(V{1});
n = length(V);
Q = zeros(m, n);

for i = 1:m
  x = zeros(m,1);
  x(i) = 1;
  for k = n:-1:1
    x(k:m) = x(k:m) - 2*V{k}*(V{k}'*x(k:m));
  end
  Q(:,i) = x;
end
