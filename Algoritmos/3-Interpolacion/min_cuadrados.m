function [a] = min_cuadrados(x,y,n)
    m = length(x);

    % Armamos la matriz
    K(1:n+1,1:n+1) = 0;
    b(1:n+1) = 0;

    for j = 1:n+1
        b(j) = 0;
        for i = 1:m
            b(j) += y(i) * (x(i)^(j-1));
        endfor
    endfor

    for j = 1:n+1
        for k = 1:n+1
            K(j,k) = 0;
            for i = 1:m
                K(j,k) += x(i)^(j+k-2);
            endfor
        endfor
    endfor

    a = GaussLUPP(K,b');

    % Como armamos la matriz, tendremos los coeficientes ordenados
    % de menor a mayor.
    % polyval los recibe de mayor a menor
    a = flip(a);
endfunction
