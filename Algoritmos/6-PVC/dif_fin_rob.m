function [x,y]=dif_fin_rob(f,inter,ycd,rob,L)
%function [x,y]=dif_fin_rob(f,[a b],alpha,[A B C],L)
%Metodo de diferencias finitas que resuelve
%el problema de valores de contorno lineal con
%condicion mixta
% y'' = p(x)y' + q(x)y + r(x) para x en [a,b]
% y(a)=alpha , Ay'(b) + By(b) = C
%f: funcion columnas con las funciones p,q,r
%L: cantidad de subintervalos

p=@(x) f(x)(:,1);
q=@(x) f(x)(:,2);
r=@(x) f(x)(:,3);

#division del intervalo
x=linspace(inter(1),inter(2),L+1)';
h=(inter(2)-inter(1))/L;

#construccion de la matriz
col=[-1-h/2*p(x(3:end)) 2+h^2*q(x(2:end-1)) -1+h/2*p(x(1:end-2))];
col=[col;0 2+h^2*q(x(end)) -1+h/2*p(x(end-1))];
A = spdiags(col, [-1 0 1], L+1, L+1);
A(end-1,end)=-1+h/2*p(x(end));
A(end,end-2:end)=[-rob(1) 2*h*rob(2) rob(1)];
#construccion del vector de terminos idependientes
b = -h^2*r(x(2:end));
b(1)+=(1+h/2*p(x(2)))*ycd;
b(end+1)=2*h*rob(3);

#resolucion del sistema
ys=A\b;

#solucion con las condiciones de contorno
y=[ycd;ys(1:end-1)];
