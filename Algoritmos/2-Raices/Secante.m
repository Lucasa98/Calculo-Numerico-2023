function [p,it,r,t] = Secante (f,p0,p1,tolerancia,maxit)
  tic();

  %p0 vendria a ser p(n-1)
  %p1 vendria a ser p(n-2)

  p = p0;
  it=1;

  while it < maxit

    p = p0 - ( f(p0)*(p0-p1) )/( f(p0)-f(p1) );

    %usamos una condicion de corte
    %   abs(f(p)) < tolerancia
    %   abs(p-p0) < tolerancia
    %   abs(p-p0)/abs(p) < tolerancia
    r(it) = p-p0;
    if abs(p-p0) < tolerancia
      break;
    endif

    it = it+1;
    p1 = p0;
    p0 = p;
  endwhile

  t = toc();
endfunction
