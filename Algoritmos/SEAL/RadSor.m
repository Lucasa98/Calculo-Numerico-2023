function [r] = RadSor (A,w)
  [L D U] = DescomponerMatriz(A);
  T = inv(D - w*L)*((1-w)*D + w*U);
  r = max(abs(eig(T)));
endfunction
