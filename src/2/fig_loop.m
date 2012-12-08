desc = ['2' '-' tc_name '-' a_name '-' num2str(lambda)];
dest_fig = ['fig/' desc '-' 'u'];
dest_fig = ['fig/' desc '-' 'u-only-cg'];
if ~exist([dest_fig '.png'], 'file')
  store_fig = @(fn) saveas(gcf, dest_fig, 'png');
  hold on
  for n = [100 200 400 800 1600 3200]
    store = @(c, fn) tofile(desc, c, fn, n);
    persist = @(c, fn) dlmwrite(makepath(desc, fn, n), c);
    exists = @(fn) exist(makepath(desc, fn, n), 'file');
    solve_2
  end
  hold off
  store_fig('u-only-cg')
  clf
end
