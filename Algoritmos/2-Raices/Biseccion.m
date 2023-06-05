function [p,it,r,t] = Biseccion (f,a,b,tolerancia,maxit)
  tic();

  it = 1;
  pant = a;
  while it < maxit
    p = a + (b-a)/2;

    %elegimos una condicion de corte
    %   error absoluto: abs(p-pant)
    %   error relativo: abs(p-pant)/abs(p)
    %   cercanica al eje x (el peor): abs(f(p))
    r(it) = (p-pant)/p;
    if abs(f(p)) < tolerancia
      break;
    endif

    if f(p)*f(b) < 0
      a = p;
    else
      b = p;
    endif

    pant = p;
    it = it + 1;
  endwhile

  if it == maxit
    disp("no se encontro raiz en maxit iteraciones");
  endif

  t = toc();
endfunction
