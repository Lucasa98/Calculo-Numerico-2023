function [df, h] = DifProgresivas(f,x0,hmin,hmax,n)
  h = linspace(hmin,hmax,n);
  fx0 = f(x0);
  fx1 = f(x0+h);
  df = (fx1-fx0)./h;
endfunction
