clc; clear all; close all;

x = [1.2 2.8 4.3 5.4 6.8 7.9];
y = [7.5 16.1 38.9 67.0 146.6 366.2];
ylog = log(y);

a = min_cuadrados(x,y,2);
alog = min_cuadrados(x,ylog,1)

S = @(t) polyval(a,t);
Slog = @(t) exp(alog(2))*exp(alog(1)*t);
exp(alog(2))

% GRAFICAR
t = linspace(0,9,100);
%plot(t,S(t));
hold on;
plot(t,Slog(t));

for i=1:length(x)
  plot(x(i),y(i),"-bo");
endfor
