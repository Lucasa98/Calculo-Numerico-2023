function [a, b, c, d] = cubic_spline_natural(x,y)
    # Pasamos un arreglo de puntos x e y
    # Es una función para el calculo de una Spline Cúbica Natural, es decir con 
    # derivadas segundas nulas en el contorno del dominio.
    # Programado en base a Burden Edición 10 pag 110. 
    # Ojo tener cuidado el contador i está inicializado en 1.
    # S(x) = Sj(x) = aj + bj(x-xj) + cj(x-xj)^2 + dj(x-xj)^3 para xj <= x <= xj+1;
    # S''(x1) = 0  , S''(xn+1) = 0 (libre o natural)

    % Medimos la longitud de los datos
    n = length(x);
    alpha = zeros(n,1);
    c = alpha;

    % Paso 1: Calculamos los h de cada Spline.
    h(1:n-1) = x(2:n)-x(1:n-1); # sin usar el lazo

    % Paso 2: Calcula los terminos independientes (alpha)
    alpha(2:n-1) = 3*( (y(3:n) - y(2:n-1))./h(2:n-1) - (y(2:n-1) - y(1:n-2))./h(1:n-2) );   %filas 2...n-1

    # Resolvemos el sistema lineal tridiagonal (Factorización de Crout)
    % Paso 3:
    l = ones(n,1);
    u = zeros(n,1);
    z = zeros(n,1);

    % Paso 4: 
    for i = 2:n-1
        l(i) = 2*(x(i+1)-x(i-1))-h(i-1)*u(i-1);
        u(i) = h(i)./l(i);
        z(i) = (alpha(i)-h(i-1)*z(i-1))./l(i);
    endfor

    %Paso 6:

    for i = n-1:-1:1
        c(i) = z(i)- u(i)*c(i+1);
        b(i) = (y(i+1)-y(i))./h(i)-(h(i)*(c(i+1)+2*c(i)))/3;
        d(i) = (c(i+1)-c(i))./(3*h(i));
    endfor

    a = y(1:n-1)';
    b = b';
    c = c(1:n-1);
    d = d';
 endfunction