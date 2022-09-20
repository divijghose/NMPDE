#linearAdvection.m
#periodic bc, scheme FTBS FTFS
clc; clear;
x_min = 0.0;
x_max = 1.0;
a = 1;
t_0 = 0;
t_f = 2;

h = 1e-2;
Nh = (x_max-x_min)/h;
cfl = h/a;
dt = 1.1*cfl;
Nt = (t_f-t_0)/dt;

t = linspace(t_0,t_f,Nt);
x = linspace(x_min,x_max,Nh);
u_0 = sin(2*pi*x);
u = zeros(1,Nh);
t_n = t_0+dt;
while(t_n<=t_f)
  t=t+dt;
  for i = 2:Nh
    u(i) = u_0(i) - (a*dt/h)*(u_0(i)-u_0(i-1));
  endfor
  u(1) = u(Nh-1);
    u_0 = u;
    plot(x,u);
    pause(0.1);
  endwhile
   
plot(x,u);