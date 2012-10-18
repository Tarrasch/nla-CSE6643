sigmas = arrayfun(@(x) 2^-x,1:n);
rng(0); % So program becomes deterministic
A = rand_sing(sigmas);
qr_methods = {'classi', 'stable', 'househ'}

[Q_classi, R_classi] = gram_classi(A);
[Q_stable, R_stable] = gram_stable(A);

[R_househ, V_househ] = househ(A);
Q_househ = V_gives_Q(V_househ);

for m = qr_methods
  m=m{1}
  eval(['norm_Q_' m ' = ' 'norm(Q_' m ')'])
  path = ['../../data/' 'norm-q-' m '-' num2str(n) '.dat']
  norm_var = ['norm_Q_' m]
  system(['echo ' num2str(eval(norm_var)) ' > ' path])
end
norm_Q_classi = norm(Q_classi, 2)
norm_Q_stable = norm(Q_stable, 2)
norm_Q_househ = norm(Q_househ, 2)

diff_Q = abs(Q_classi-Q_stable);
diff_R = abs(R_classi-R_stable);

% Now calculate the medians
median_row_diff_Q = median(diff_Q, 1);
median_col_diff_Q = median(diff_Q, 2);

save = @(fn) saveas(gcf, ['../../fig/' fn '-' num2str(n)], 'pdf');
plot(     median_col_diff_Q)
save(    'median_col_diff_Q')
plot( log(median_row_diff_Q))
save('log_median_row_diff_Q')

median_rows_diff_R_nonzeros = median(diff_R, 1); % TODO
median_cols_diff_R_nonzeros = median(diff_R, 2); % TODO
