function [x, w] = gauss_xw(n)
    % [x, w] = gauss_xw(n)
    % Genera las abscisas y pesos para la Cuadratura Gauss-Legendre.
    % n: numero de puntos de integracion
    % x: abscisas de la cuadratura
    % w: pesos de la cuadratura
    x = zeros(n,1);
    w = x;
    m = (n+1)/2;
    for ii=1:m
        z = cos(pi*(ii-.25)/(n+.5)); % estimado Inicial.
        z1 = z+1;
        while abs(z-z1)>eps
            p1 = 1;
            p2 = 0;
            for jj = 1:n
                p3 = p2;
                p2 = p1;
                p1 = ((2*jj-1)*z*p2-(jj-1)*p3)/jj; % El polinomial. Legendre
            endfor
            pp = n*(z*p1-p2)/(z^2-1); % La L.P. Derivada.
            z1 = z;
            z = z1-p1/pp;
        endwhile
        x(ii) = -z; % Construye las abscissas.
        x(n+1-ii) = z;
        w(ii) = 2/((1-z^2)*(pp^2)); % Construye los pesos.
        w(n+1-ii) = w(ii);
    endfor
endfunction