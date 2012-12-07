m = n + 1;
h = 1 / m;
h2 = h*h;
x = h:h:1-h; % x is the vector x. not the Ax=b thingie!

if ~exists('time_cg')
  % temporrary assignments
  % lambda = 1.0;
  % a = @(x) diag(sparse(x)); % sparse diag
  % a_prime = @(x) sparse(1:length(x), 1:length(x), 1); % sparse eye
  % a = @(x) sparse(1:length(x), 1:length(x), 2); % sparse eye
  % a_prime = @(x) sparse(length(x), length(x));
  % a = @(x) sparse(length(x), length(x));
  % a_prime = @(x) sparse(length(x), length(x));

  on = ones(1, n-1);
  h0_part = sparse(1:n, 1:n, lambda);
  h1_part = a_prime(x)*gallery('tridiag', -on, zeros(n,1), on)/(2*h);
  h2_part = a(x)*gallery('tridiag', on, -2*[on 1], on)/h2;
  S = h0_part - h1_part - h2_part;

  A = full(S);
  b = (-0.5+h:h:0.5-h)';

  cond_estimate = round(condest(S))

  tic
  x_cg = conjugate_gradient(S, b);
  time_cg = toc;
  storeVar = @(var) store(num2str(evalin('base',var)), var);
  storeVar('cond_estimate')
  storeVar('time_cg')
  if(cond_estimate < 1000000)

    tic
    x_sd = steepest_descent(S, b);
    time_sd = toc;

    Plotting
    myplot = @(values) plot(0:h:1, [0; values; 0]);
    p = myplot(x_sd);
    xlabel('x')
    ylabel('u(x)')
    set(p,'Color', [((log2(m)-5.64)/6.2) 0 (1-(log2(m)-5.64)/6.2)]);
    p = myplot(x_cg);
    xlabel('x')
    ylabel('u(x)')
    set(p,'Color', [0 (log2(m)-5.64)/6.2 0]);

    Storing

    storeVar = @(var) store(num2str(evalin('base',var)), var);
    storeVar('time_sd')
  else
    store('\?','time_sd')
  end
end
