m = n + 1;
h = 1 / m;
h2 = h*h;

on = ones(1, n-1);
S = gallery('tridiag', on, -2*[on 1], on);

b = ((-0.5+h)*h2:h*h2:(0.5-h)*h2)';
ml_eigs = sort(eig(S));
ml_largest = ml_eigs(1);
ml_smallest = ml_eigs(end);

[v_l, my_largest, it_l] = power_iteration(S);
[v_s, my_smallest, it_s] = inverse_iteration(S,0);

[v_rq_l, my_rq_largest, it_rq_l] = rq_iteration(S, ev_guess(n, true));
[v_rq_s, my_rq_smallest, it_rq_s] = rq_iteration(S, ev_guess(n, false));

cond_A = round(condest(S));
pi_conv_ratio = 1-ml_eigs(2)/ml_eigs(1);
diff_largest = ml_largest - my_largest;
diff_smallest = ml_smallest - my_smallest;
diff_rq_largest = ml_largest - my_rq_largest;
diff_rq_smallest = ml_smallest - my_rq_smallest;
my_cond_A = round(my_rq_largest/my_rq_smallest);

storeVar = @(var) store(num2str(evalin('base',var)), var);

storeVar('cond_A')
storeVar('my_cond_A')

storeVar('pi_conv_ratio')
storeVar('diff_largest')
storeVar('it_l')

storeVar('diff_smallest')
storeVar('it_s')

storeVar('diff_rq_largest')
storeVar('it_rq_l')

storeVar('diff_rq_smallest')
storeVar('it_rq_s')

