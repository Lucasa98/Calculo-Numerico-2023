function [x] = GaussLUPP(A, b)
  [LU,P] = FactLUPP(A);

  n=length(A(1,:));
  b=P*b;
  LU=[LU b];

  %sust adelante para Ly=b
  y=b;
  for k=2:n
    for j=1:k-1
      y(k)=y(k)-LU(k,j)*y(j);
    endfor
  endfor

  %sust atras para Ux=y
  x=y;
  for k=n:-1:1
    for j=n:-1:k+1
      x(k)=x(k)-LU(k,j)*x(j);
    endfor
    x(k)=x(k)/LU(k,k);
  endfor
endfunction
