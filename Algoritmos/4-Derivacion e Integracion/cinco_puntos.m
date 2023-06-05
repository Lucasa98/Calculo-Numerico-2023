function [df] = cinco_puntos(f,x0,h)
    df = ( f(x0-2*h)-8*f(x0-h)+8*f(x0+h)-f(x0+2*h) )/(12*h);
endfunction