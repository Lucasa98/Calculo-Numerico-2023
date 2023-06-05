function [L D U] = DescomponerMatriz (A)
  v = diag(A);
  L = tril(A,-1);
  U = triu(A,1);
  D = diag(v);
endfunction
