% x: puntos xi, i=1,2,...,n
% y: puntos yi correspondiente a f(xi), i=1,2,...,n
% df1 y dfn: valor de la derivada de f en x0 y xn
function [ai,bi,ci,di] = cubic_spline_clamped(x,y,df1,dfn)
    n = length(x);

    ai = y;

    h(1:n-1) = x(2:n) - x(1:n-1);

    % - Calculamos los terminos independientes
    b(1:n) = 0;
    b(1) = 3*( (y(2) - y(1))/h(1) - df1 );    %fila 1
    b(2:n-1) = 3*( (y(3:n) - y(2:n-1))./h(2:n-1) - (y(2:n-1) - y(1:n-2))./h(1:n-2) );   %filas 2...n-1
    b(n) = 3*( dfn - (y(n) - y(n-1))/h(n-1) );    %fila n

    % - Calculamos (metodo de crout)
    l(1) = 2*h(1); 
    u(1) = 0.5;
    z(1) = b(1)/l(1);

    for i = 2:n-1
        l(i) = 2 * ( x(i+1)-x(i-1) ) - h(i-1) * u(i-1);
        u(i) = h(i) / l(i);
        z(i) = (b(i) - h(i-1) * z(i-1) ) / l(i);
    endfor

    l(n) = h(n-1) * (2-u(n-1));
    z(n) = (b(n) - h(n-1)*z(n-1) ) / l(n);
    ci(n) = z(n);

    % Paso 7:
    for i = n-1:-1:1
        ci(i) = z(i) - u(i) * ci(i+1);
        bi(i) = (y(i+1)-y(i))/ h(i) - h(i) * ( ci(i+1) + 2 * ci(i) ) / 3;
        di(i) = (ci(i+1)-ci(i))/(3*h(i));
    endfor

    ai = y(1:n-1)';
    bi = bi';
    ci = ci(1:n-1)';
    di = di';
endfunction