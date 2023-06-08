function [I,it,r,t,L] = intGauss(f,a,b,n,tolerancia,maxit)
  % aproxima la integral de f sobre [a,b],
  %subdividiendo en L subintervalos

  tic();

  % calculamos los pesos y los puntos a evaluar t una sola vez
  [xg,w] = gauss_xw(n);
  t = linspace(-1,1,n);

  L=1;
  h=b-a;

  y=linspace(a,b,L+1);
  I=0;
  for i=1:L
    t = h/2*(xg+1)+y(i);
    I += h/2*(w'*f(t));
  endfor
  % -------------
  for it=2:maxit
    % duplicamos los subintervalos
    L=L*2;
    h=h/2;

    y=linspace(a,b,L+1);
    I1=0;
    for i=1:L
      t = h/2*(xg+1)+y(i);
      I1 += h/2*(w'*f(t));
    endfor

    %residuo
    r(it-1) = abs(I1-I);
    if r(it-1) < tolerancia
      I = I1;
      break;
    endif

    I = I1;
  endfor

  t = toc();

  if it == maxit
    disp("la integral no converge para maxit iteraciones");
  endif
endfunction
