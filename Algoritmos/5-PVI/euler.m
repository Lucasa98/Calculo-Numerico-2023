function [t,y] = euler(f,inter,y0,L)
% function [t,y] = euler(f,[t0 TF],y0,L)
% Metodo de Euler para resolver
%    y' = f(t,y)  en [t0,TF]
% y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar

t = linspace(inter(1),inter(2),L+1)'; 
h = (inter(2)-inter(1))/L;

% reservamos lugar en memoria para y
y = zeros( length(y0), L+1 );

y(:,1) = y0;
for n = 1:L
    y(:,n+1) = y(:,n) + h*f(t(n),y(:,n));
end

y = y';
