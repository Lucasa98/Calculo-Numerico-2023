clc;
format long g;
%Encontrar a
zaux = @(a) 0.04.*sqrt(a+0.02).*(1-0.02)-0.02.*sqrt(3.*a) - 0.02;

%Si z pasa cerca de w = 0.04*sqrt(19+t)*(1-t) - t*sqrt(57)
%entonces a es aproximadamente 19

figure(1);
t = linspace(0,25,100); % entre 19 y 20
plot(t,zaux(t),"-r");
hold on;

[a,it,r,t] = Biseccion(zaux,19,20,1e-6,100);
a

%Encontrar la raiz
z = @(t) 0.04.*sqrt(a+t).*(1-t) - t.*sqrt(3.*a);

figure(2);
t = linspace(-10,10,100);

plot(t,z(t),"-g");  % entre 0 y 0.5

[p,it,r,t] = Biseccion(z,0,0.5,1e-6,100);
p