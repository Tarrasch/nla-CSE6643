function [ ev ] = ev_guess( n, highest )
%EV_QUESS If highest, then alternating signs

ev = ones(n, 1)+[(1:n/2) (n/2+mod(n,2)):-1:1]';
ss = repmat([1 -1]', n, 1);
ss = ss(1:n);
if highest;
  ev = ev .* ss;
end

ev = ev/norm(ev);

end

