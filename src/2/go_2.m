a1 = @(x) sparse(1:length(x), 1:length(x), 2); % sparse eye
a_prime1 = @(x) sparse(length(x), length(x));
a2 = @(x) diag(sparse(x)); % sparse diag
a_prime2 = @(x) sparse(1:length(x), 1:length(x), 1); % sparse eye
configurations = {{'const' a1 a_prime1 {100 10 1 -1}} {'id' a2 a_prime2 {1 10 100 1000}}};

%for n = [100 200 400 800 1600 3200]
for n = [12]
  for conf = configurations
    [a_name, a, a_prime, lambdas] = conf{1}{:};
    for lambda = lambdas
      lambda = lambda{1};
      desc = ['2' '-' a_name '-' num2str(lambda)]
      store_fig = @(fn) saveas(gcf, ['fig/' desc '-' fn '-' num2str(n)], 'png');
      store = @(c, fn) tofile(desc, c, fn, n);
      solve_2
      break
    end
  end
end

