function [r] = RadGaussSeidel (A)
  [L D U] = DescomponerMatriz(A);
  T = inv(D - L)*U;   %Matriz de iteracion de gauss seidel
  r = max(abs(eig(T)));
endfunction
