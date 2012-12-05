a1 = @(x) sparse(1:length(x), 1:length(x), 2); % sparse eye
a_prime1 = @(x) sparse(length(x), length(x));
a2 = @(x) diag(sparse(x)); % sparse diag
a_prime2 = @(x) sparse(1:length(x), 1:length(x), 1); % sparse eye
configurations = {{'a(x) = 2' a1 a_prime1 {100 10 1 -1}} {'a(x) = x' a2 a_prime2 {1 10 100 1000}}};

%for n = [50 100 200 400 800 1600 3200]
for n = [50]
  for conf = configurations
    [a_name, a, a_prime, lambdas] = conf{1}{:};
    for lambda = lambdas
      lambda = lambda{1};
      solve_2
      break
    end
    break
  end
end

