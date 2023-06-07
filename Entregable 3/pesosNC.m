function w = pesosNC(n)
    % function w = pesosNC(n)
    % se calculan los pesos
    % de la formula de Newton-Cotes de n puntos
    x = linspace(0,1,n);
    A = ones(n,n);
    for i=2:n
      A(i,:) = A(i-1,:) .* x;
    end
    b = 1./(1:n)';
    w = A\b;
endfunction
