function [r] = RadJacobi (A)
  [L D U] = DescomponerMatriz(A);
  T = inv(D)*(L+U);   %Matriz de iteracion de Jacobi
  r = max(abs(eig(T)));
endfunction
