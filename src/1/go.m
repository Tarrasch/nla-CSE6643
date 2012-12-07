for n = [100 200 400 800 1600 3200 6400 12800 25600 51200]
%for n = [3200]
  n = n;
  desc = '1';
  store = @(c, fn) tofile(desc, c, fn, n);
  store_fig = @(fn) saveas(gcf, ['fig/' desc '-' fn '-' num2str(n)], 'png');
  tic
  solve
  toc
end
