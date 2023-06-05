function [t,y]=rk2(f, inter, y0, L)
%function [t,y]=rk2(f, [T0 Tf], y0, L)
% Metodo de Runge-Kutta de orden 2 
% para resolver
%    y' = f(t,y)  en [t0,TF]
%    y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar

t = linspace(inter(1),inter(2),L+1)'; 
h = (inter(2)-inter(1))/L;

% reservamos lugar en memoria para y
y = zeros( length(y0), L+1 );

y(:,1) = y0;

for n=1:L
  k1 = h * f(t(n)  , y(:,n));
  k2 = h * f(t(n+1), y(:,n)+k1);

  y(:,n+1) = y(:,n) + (k1 + k2)/2;
end
y=y';



