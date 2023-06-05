clc; clear all; close all;
format long g;

% - Mediciones
tx = [0 2 4 6];         %tiempo de la medicion
posx = [2.0 1.5 0.5 0.0]; %valor en x
ty = [0 1 2 3 4 5 6];
posy = [0.0 1.0 0.0 -1.0 0.0 1.0 0.0];

dy0 = pi/2;
dyn = -pi/2;

% - a) Interpolacion
[x,dx] = funcion_spline(tx,posx,0,0);   %velocidad inicial y final nulas en x
[y,dy] = funcion_spline(ty,posy,dy0,dyn);

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
t = linspace(0.001,1,50);
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
