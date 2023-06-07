function Q = intNCcompuesta(f,a,b,L,n)
    % function Q = intNCcompuesta(f,a,b,L,n)
    % aproxima la integral de f sobre [a,b]
    % utilizando la formula de Newton-Cotes compuesta
    % de n puntos, subdividiendo en L subintervalos
    y = linspace(a,b,L+1);
    h = (b-a)/L;
    % calculamos los pesos una sola vez
    w = pesosNC(n);
    Q = 0;
    for i=1:L
        x = linspace(y(i),y(i+1),n);
        fx = f(x);
        Q = Q + h*(fx*w);
    endfor
endfunction