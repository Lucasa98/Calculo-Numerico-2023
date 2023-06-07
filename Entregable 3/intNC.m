function [I,it,r,t,L] = intNC(f,a,b,n,tolerancia,maxit)
  % aproxima la integral de f sobre [a,b]
  % utilizando la formula de Newton-Cotes compuesta
  % de n puntos, subdividiendo en L subintervalos

  tic();

  % calculamos los pesos una sola vez
  w = pesosNC(n);

  L=1;
  h = b-a;
  y = linspace(a,b,L+1);
  % crea una matriz con los puntos a evaluar
  x = linspace(0, 1, n).' * (y(2:end) - y(1:end-1)) + y(1:end-1);
  x = reshape(x, [], L);

  fx = f(x);
  I = sum(h * (fx .* w)(:));
  % -------------
  for it=2:maxit
    % duplicamos los subintervalos
    L=L*2;
    h = h/2;
    y = linspace(a,b,L+1);
    % crea una matriz con los puntos a evaluar
    x = linspace(0, 1, n).' * (y(2:end) - y(1:end-1)) + y(1:end-1);
    x = reshape(x, [], L);

    fx = f(x);
    I1 = sum(h * (fx .* w)(:));

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
