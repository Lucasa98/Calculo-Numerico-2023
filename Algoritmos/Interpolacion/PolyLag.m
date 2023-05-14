%P: vector de coeficientes del polinomio de Lagrange que interpola los puntos (x,y)
%x: valores que toman los puntos interpolantes
%y: valores de la funcion interpolada en los puntos x[i]
function [P] = PolyLag (x,y)
  n = length(x);

  % calculamos el primer miembro solo para no enquilombarnos de indices despues
  L1 = [1 (-1)*x(2)];
  div = x(1)-x(2);
  for i=3:n
    L1 = conv(L1, [1 (-1)*x(i)]);
    div = div*(x(1)-x(i));
  endfor
  P = L1 * (y(1)/div);

  for i=2:n
    % inicializamos el i-esimo miembro del polinomio de Lagrange
    Laux = [1 (-1)*x(1)];
    div = x(i)-x(1);

    for j=2:n
      if j!=i
        Laux = conv(Laux, [1 (-1)*x(j)]);
        div = div*(x(i)-x(j));
      endif
    endfor
    div
    P = P + Laux * (y(i)/div);
  endfor

endfunction
