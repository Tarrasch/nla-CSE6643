desc = ['2' '-' a_name '-' num2str(lambda)];
store_fig = @(fn) saveas(gcf, ['fig/' desc '-' fn], 'png');
hold on
for n = [100 200 400 800 1600 3200]
  store = @(c, fn) tofile(desc, c, fn, n);
  exists = @(fn) exist(makepath(desc, fn, n), 'file');
  solve_2
end
hold off
% store_fig('u')
clf
