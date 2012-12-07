function [ ] = tofile( problem, content, filename, n)
%TOFILE Summary of this function goes here
% example:
%   content  = "123.25e+21"
%   filename = "1-eigenvalue" (without n and full path)

if n >= 100
  path = makepath(problem, filename, n);
  cmd = ['echo ' content ' > ' path];
  system(cmd);
end

end

