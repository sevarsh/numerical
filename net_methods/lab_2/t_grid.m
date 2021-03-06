function [t, K] = t_grid(ts, N, d, x)
  K = 0;
  n1 = zeros(N+1, 1);
  n2 = zeros(N+1, 1);
  while true
    for i=1:N+1
      n2(i) = sin(exp(x(i)));
      n1(i) = abs(u(x(i), (K-1)*ts) - n2(i));
    end
    if max(n1) / max(n2) < d
      break;
    end
    K = K + 1;
  end
  T = ts * K;
  t = linspace(0, T, K+1);