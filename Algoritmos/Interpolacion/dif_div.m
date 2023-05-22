%c: vector de coeficientes del polinomio interpolante en la forma de Newton
%   P(x)=c(i)*(x-x0)(x-x1)...(x-xn)
%x: valores que toman los puntos interpolantes
%y: valores de la funcion interpolada en los puntos x[i]
function [c] = dif_div(x,y)
  n = length(x);
  
  c(1) = y(1);
  for i=2:n
    % ci = f[x1,x2,...,xi] = (f[x2,x3,...,xi] - f[x1,x2,...,xi-1]) / (xi - x1)
    c(i) = (DD(x,y,2,i) - c(i-1)) / (x(i) - x(1));
  endfor
endfunction
