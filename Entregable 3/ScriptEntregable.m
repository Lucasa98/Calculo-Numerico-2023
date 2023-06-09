clc; clear all; close all;
format long g;

% - Mediciones
tx = [0 2 4 6];         %tiempo de la medicion
posx = [2.0 1.5 0.5 0.0]; %valor en x
ty = [0 1 2 3 4 5 6];
posy = [0.0 1.0 0.0 -1.0 0.0 1.0 0.0];

a=0;
b=6;

dy0 = pi/2;
dyn = -pi/2;

% - a) Interpolacion
disp("========================================")
[x,dx] = funcion_spline(tx,posx,0,0);   %velocidad inicial y final nulas en x
[a_x,b_x,c_x,d_x] = cubic_spline_clamped(tx,posx,0,0)
disp("========================================")
[y,dy] = funcion_spline(ty,posy,pi/2,-pi/2);
[a_y,b_y,c_y,d_y] = cubic_spline_clamped(ty,posy,pi/2,-pi/2)
disp("========================================")

% - b) Grafica
  % x(t) y dx(t)
figure(1);
t = linspace(0,2,50);
plot(t,x(t),'-r','linewidth',2);
hold on;
plot(t,dx(t),'-r');
t = linspace(2,4,50);
plot(t,x(t),'-m','linewidth',2);
plot(t,dx(t),'-m');
t = linspace(4,6,50);
plot(t,x(t),'-b','linewidth',2);
plot(t,dx(t),'-b');

grid on;
legend("x(t)","dx/dt(t)");
xlabel("x");
ylabel("t");

  % puntos (t,posx)
for i=1:length(tx)
  plot(tx(i),posx(i), 'color', 'r', 'markersize', 20, 'displayname', strcat("x(", num2str(tx(i)),")"));
endfor
plot(0,0,'color','g','markersize',15,'displayname','dx/dt(0)');
plot(6,0,'color','g','markersize',15,'displayname','dx/dt(6)');

figure(2);
  % y(t) y dy(t)
t = linspace(0,1,50);
plot(t,y(t),'-r', 'linewidth',2);
hold on;
plot(t,dy(t),'-r');
t = linspace(1,2,50);
plot(t,y(t),'-m', 'linewidth',2);
plot(t,dy(t),'-m');
t = linspace(2,3,50);
plot(t,y(t),'-b', 'linewidth',2);
plot(t,dy(t),'-b');
t = linspace(3,4,50);
plot(t,y(t),'-g', 'linewidth',2);
plot(t,dy(t),'-g');
t = linspace(4,5,50);
plot(t,y(t),'-c', 'linewidth',2);
plot(t,dy(t),'-c');
t = linspace(5,6,50);
plot(t,y(t),'-y', 'linewidth',2);
plot(t,dy(t),'-y');

grid on;
h = legend("y(t)","dy/dt(t)");
legend(h,"location","southwest");
xlabel("y");
ylabel("t");

  % puntos (t,posy)
for i=1:length(ty)
  plot(ty(i),posy(i), 'color', 'r', 'markersize', 20, 'displayname', strcat("y(", num2str(ty(i)),")"));
endfor
plot(0,dy0,'color','g','markersize',15,'displayname','dy/dt(0)');
plot(6,dyn,'color','g','markersize',15,'displayname','dy/dt(6)');

  % (x(t),y(t))
figure(3);
h=ezplot(x,y,[0 6]);
set(h,'color','r','linewidth',2);
hold on;
  % puntos (posx,posy)
for i=1:length(tx)
  plot(x(tx(i)),y(tx(i)), 'color', 'r', 'markersize', 20, 'displayname', strcat("S(", num2str(tx(i)),")"));
endfor

grid on;
h=legend("S(t)=(x(t),y(t))");
legend(h,"location","southeast");

% b) Evaluacion
% S(3)
pos3 = [x(3),y(3)]
% dS(3)
vel3 = [dx(3),dy(3)]

% c) Integración
integrando = @(t) sqrt(dx(t).^2 + dy(t).^2);

  % Grafica del integrando con los polinomios interpolantes por subintervalo
figure(4);
t = linspace(0.0001,6,100);
plot(t,integrando(t),'linewidth',2);
hold on;

h = (b-a)/8;
    % n=2 (Trapecio)
for i=1:8
  p = linspace(a+(i-1)*h,a+i*h,2);
  fp = integrando(p);
  P = PolyLag(p,fp);
  t = linspace(a+(i-1)*h,a+i*h,50);
  plot(t,polyval(P,t),'-m');
endfor
    % n=3 (Simpson)
for i=1:8
  p = linspace(a+(i-1)*h,a+i*h,3);
  fp = integrando(p);
  P = PolyLag(p,fp);
  t = linspace(a+(i-1)*h,a+i*h,50);
  plot(t,polyval(P,t),'-b');
endfor
    % n=4
for i=1:8
  p = linspace(a+(i-1)*h,a+i*h,4);
  fp = integrando(p);
  P = PolyLag(p,fp);
  t = linspace(a+(i-1)*h,a+i*h,50);
  plot(t,polyval(P,t),'-g');
endfor
    % n=5
for i=1:8
  p = linspace(a+(i-1)*h,a+i*h,5);
  fp = integrando(p);
  P = PolyLag(p,fp);
  t = linspace(a+(i-1)*h,a+i*h,50);
  plot(t,polyval(P,t),'-y');
endfor
legend('integrando','NC orden 1','NC orden 2','NC orden 3','NC orden 4');

% Calculo de la integral
tolerancia = 1e-6;
maxit = 30;

[INC2,itNC2,rNC2,tNC2,LNC2] = intNC(integrando,0,6,2,tolerancia,maxit);
INC2
itNC2
tNC2
LNC2

[INC3,itNC3,rNC3,tNC3,LNC3] = intNC(integrando,0,6,3,tolerancia,maxit);
INC3
itNC3
tNC3
LNC3

[INC4,itNC4,rNC4,tNC4,LNC4] = intNC(integrando,0,6,4,tolerancia,maxit);
INC4
itNC4
tNC4
LNC4

[INC5,itNC5,rNC5,tNC5,LNC5] = intNC(integrando,0,6,5,tolerancia,maxit);
INC5
itNC5
tNC5
LNC5

[INC30,itNC30,rNC30,tNC30,LNC30] = intNC(integrando,0,6,30,tolerancia,maxit);
INC30
itNC30
tNC30
LNC30
disp("===================================");

[IG2,itG2,rG2,tG2,LG2] = intGauss(integrando,0,6,2,tolerancia,maxit);
IG2
itG2
tG2
LG2

[IG3,itG3,rG3,tG3,LG3] = intGauss(integrando,0,6,3,tolerancia,maxit);
IG3
itG3
tG3
LG3

[IG4,itG4,rG4,tG4,LG4] = intGauss(integrando,0,6,4,tolerancia,maxit);
IG4
itG4
tG4
LG4

[IG5,itG5,rG5,tG5,LG5] = intGauss(integrando,0,6,5,tolerancia,maxit);
IG5
itG5
tG5
LG5

[IG30,itG30,rG30,tG30,LG30] = intGauss(integrando,0,6,30,tolerancia,maxit);
IG30
itG30
tG30
LG30

% Graficar residuos
figure(5);
semilogy(rNC2);
hold on;
semilogy(rNC3);
semilogy(rNC4);
semilogy(rNC5);
semilogy(rNC30,'color','r','linestyle','--');
semilogy(rG2,'linewidth',2);
semilogy(rG3,'linewidth',2);
semilogy(rG4,'linewidth',2);
semilogy(rG5,'linewidth',2);
semilogy(rG30,'color','r','linestyle','--');
legend('ResNC2', 'ResNC3', 'ResNC4', 'ResNC5', 'ResNC30', 'ResG2', 'ResG3', 'ResG4', 'ResG5', 'ResG30');
xlabel('iteraciones');
ylabel('error absoluto');
