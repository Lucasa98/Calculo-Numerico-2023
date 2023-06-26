clc;
format long g;

%Armar la matriz
A = 0;
b = 0;
h=1/40;

% u segunda
ddu = @(x) 20.*e.^(-10.*(x - 0.7)^2);
%funcion para calcular los coeficientes de b
fb = @(x) ddu(x)*h^2;

A(1:39,1:39) = 0;
b(1:39) = 0;

A(1,1) = 2;
A(1,2) = -1;
b(1) = fb(h)+5;

for i=2:38
  A(i,i-1) = -1;
  A(i,i) = 2;
  A(i,i+1) = -1;
  b(i) = fb(h*i);
endfor

A(39,38) = -1;
A(39,39) = 2;
b(39) = fb(1-h)+6;
b = b'

A

%Resolucion del sistema
x0 = 0;
x0(1:39) = 0;
x0 = x0';
    %Criterio de parada: norm(A*x-b,Inf) < tolerancia=1e-6
[x,it,r,t] = GaussSeidel(A,b,x0,1e-6,5000);
x
it
plot(x);

%Temperatura en el punto medio:
Tm = x(20)