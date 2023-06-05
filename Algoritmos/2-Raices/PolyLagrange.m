function [y] = PolyLagrange (f,x,t)
  n=length(x);

  y=0;
  for i=1:n
    L = f(x(i));

    for j=1:n
      if j==i
        continue;
      endif
      L = L .* (t - x(j))./(x(i)-x(j));
    endfor

    y = y + L;
  endfor

endfunction
