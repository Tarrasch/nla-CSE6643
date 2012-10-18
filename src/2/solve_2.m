sigmas = arrayfun(@(x) 2^-x,1:n);
rng(0); % So program becomes deterministic
A = rand_sing(sigmas);
qr_methods = {'classi', 'stable', 'househ'};

[Q_classi, R_classi] = gram_classi(A);
[Q_stable, R_stable] = gram_stable(A);

[R_househ, V_househ] = househ(A);
Q_househ = V_gives_Q(V_househ);

save = @(fn) saveas(gcf, ['../../fig/' fn '-' num2str(n)], 'png');

for m = qr_methods
  m=m{1};

  % First do the norm
  eval(['norm_Q_' m ' = ' 'norm(Q_' m ');']);
  path = ['../../data/' 'norm-q-' m '-' num2str(n) '.dat'];
  norm_var = ['norm_Q_' m];
  system(['echo ' num2str(eval(norm_var)) ' > ' path]);

  % Then the A comparisions
  eval(['std_Q_' m ' = ' 'std(std(A - Q_' m '*R_' m '));']);
  path = ['../../data/' 'std-q-' m '-' num2str(n) '.dat'];
  std_var = ['std_Q_' m];
  system(['echo ' num2str(eval(std_var)) ' > ' path]);
end
norm_Q_classi = norm(Q_classi, 2);
norm_Q_stable = norm(Q_stable, 2);
norm_Q_househ = norm(Q_househ, 2);

diff_Q = abs(Q_classi-Q_stable);
diff_R = abs(R_classi-R_stable);

% Now calculate the medians
median_col_diff_Q = median(diff_Q, 1);
median_row_diff_Q = median(diff_Q, 2);

plot(     median_row_diff_Q)
xlabel('i')
ylabel('Median of values from row i of \Delta Q ')
save(    'median-row-Q')
plot( log(median_col_diff_Q))
xlabel('i')
ylabel('Logarithm of median of values from column i of \Delta Q ')
save('log-median-col-Q')

% median_col_diff_R_nonzeros = []
% for i = 1:n
%   slice = diff_R(1:i, i)
%   median_col_diff_R_nonzeros = [median_col_diff_R_nonzeros median(slice)]
% end
median_col_diff_R_nonzeros = arrayfun(@(i) median(diff_R(1:i, i)), 1:n);
median_row_diff_R_nonzeros = arrayfun(@(i) median(diff_R(i, i:n)), 1:n);

plot( log(median_row_diff_R_nonzeros))
xlabel('i')
ylabel('Logarithm of median of values from row i of \Delta R ')
save('log-median-row-R')

plot( log(median_col_diff_R_nonzeros))
xlabel('i')
ylabel('Logarithm of median of values from column i of \Delta R ')
save('log-median-col-R')
