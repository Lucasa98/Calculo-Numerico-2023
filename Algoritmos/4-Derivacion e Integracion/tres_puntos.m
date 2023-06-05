function [df] = tres_puntos(f,x0,h)
    df = ( f(x0+h)-f(x0-h) )/(2*h);
endfunction