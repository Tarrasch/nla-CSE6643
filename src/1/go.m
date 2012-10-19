hold on
fplot(@(x) -(x*x*x/6 - x*x/4 + x/12), [0 1], 'r')

for n = [50 100 200 400 800]
  solve
end
