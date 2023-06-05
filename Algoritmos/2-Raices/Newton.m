function [p,it,r,t] = Newton (f,df,p0,tolerancia,maxit)
  tic();

  p = p0; %usamos p0 para guardar el p anterior
  it = 1;
  while it<maxit
    p = p0 - f(p0)/df(p0);

    %usamos una condicion de corte
    %   abs(f(p)) < tolerancia
    %   abs(p-p0) < tolerancia
    %   abs(p-p0)/abs(p) < tolerancia
    r(it) = p-p0;
    if abs(p-p0) < tolerancia
      break;
    endif

    it = it+1;
    p0 = p;

  endwhile

  if it == maxit
    disp("no se encontro raiz en maxit iteraciones");
  endif

  t=toc();
endfunction
