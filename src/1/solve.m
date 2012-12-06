m = n + 1;
h = 1 / m;
h2 = h*h;

on = ones(1, n-1);
S = gallery('tridiag', on, -2*[on 1], on);
A = full(S);

b = arrayfun(@(i) (1/2-(i)*h)*h2, 1:n)';
ml_eigs = sort(eig(S));
ml_largest = ml_eigs(1);
ml_smallest = ml_eigs(end);

[v_l, my_largest, it_l] = power_iteration(A);
[v_s, my_smallest, it_s] = inverse_iteration(A,0);

[v_rq_l, my_rq_largest, it_rq_l] = rq_iteration(A, ev_guess(n, true));
[v_rq_s, my_rq_smallest, it_rq_s] = rq_iteration(A, ev_guess(n, false));

diff_largest = ml_largest - my_largest
diff_smallest = ml_smallest - my_smallest
diff_rq_largest = ml_largest - my_rq_largest
diff_rq_smallest = ml_smallest - my_rq_smallest

