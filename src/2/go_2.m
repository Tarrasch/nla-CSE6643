a1 = @(x) sparse(1:length(x), 1:length(x), 2); % sparse eye
a_prime1 = @(x) sparse(length(x), length(x));
a2 = @(x) diag(sparse(x)); % sparse diag
a_prime2 = @(x) sparse(1:length(x), 1:length(x), 1); % sparse eye
configurations = {...
                   {'const' a1 a_prime1 {100 10 1 -1}} ...
                   {'id' a2 a_prime2 {1 10 100 1000}}  ...
                 };
it_configurations = {...
                      {'cit' @(A)10000 @(A)10000 } ...
                      {'bit' @(A)100000 @(A)100000 } ...
                      {'kit' @(A)condest(A) @(A)sqrt(condest(A)) }  ...
                    };

for it_c = it_configurations
  [tc_name, tc_sd, tc_cg] = it_c{1}{:};
  for conf = configurations
    [a_name, a, a_prime, lambdas] = conf{1}{:};
    for lambda = lambdas
      lambda = lambda{1};
      fig_loop
    end
  end
end
