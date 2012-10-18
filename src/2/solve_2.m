sigmas = arrayfun(@(x) 2^-x,1:n);
rng(0); % So program becomes deterministic
A = rand_sing(sigmas);

[Q_classic, R_classic] = gram_classic(A);
[Q_stable, R_stable] = gram_stable(A);

[R_householder, V_householder] = householder(A);
Q_householder = V_gives_Q(V_householder);

norm_Q_classic = norm(Q_classic, 2)
norm_Q_stable = norm(Q_stable, 2)
norm_Q_householder = norm(Q_householder, 2)

diff_Q = abs(Q_classic-Q_stable);
diff_R = abs(R_classic-R_stable);

% Now calculate the medians
median_row_diff_Q = median(diff_Q, 1);
median_columns_diff_Q = median(diff_Q, 2);

save = @(fn) saveas(gcf, ['../../fig/' fn], 'pdf');
plot(median_columns_diff_Q)
save('median_columns_diff_Q')
plot(log(median_row_diff_Q))
save('log_median_row_diff_Q')

median_row_diff_R_nonzeros = median(diff_R, 1); % TODO
median_columns_diff_R_nonzeros= median(diff_R, 2); % TODO
