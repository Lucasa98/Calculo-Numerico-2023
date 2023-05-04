function [x,it,r,t] = GaussSeidel (A,b,x0,tolerancia,maxit)
  tic();

  n=length(A(1,:));

  x=x0;
  it=0;
  %usamos x0 para almacenar el x de la iteracion anterior
  while (it < maxit)
    for i=1:n
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
                 %Gauss-Seidel  ^^^^^^^^
    endfor

    %error relativo:
    %  norm(x-x0)/norm(x);
    r(it+1) = norm(A*x-b);
    if r(it+1) < tolerancia
      break;
    endif

    x0=x;
    it=it+1;
  endwhile

  t = toc();
endfunction
