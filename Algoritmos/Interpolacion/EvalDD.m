function [y] = EvalDD(x,c,t)
  n = length(c);
  
  y = c(1);
  
  for i = 2:n
    aux = c(i);
    for j = 1:i-1
      aux = aux .* (t - x(j));
    endfor

    y = y + aux;
  endfor
endfunction