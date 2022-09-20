#x' =  t^2 + x, 0<t<=2
#x(0) = 1 
clc; clear;
f = @(t,x) t^2+x;
x_0 = 1.0;

h = 1e-2; 
t_0 = 0;
t_f = 2;
N = 2/h;
t = linspace(t_0,t_f,N);

h = abs(t(2)-t(1));
x = zeros(1,N);
x(1) = x_0;
phi = @(h,t,x) f(t+0.5*h,x+0.5*h*f(t,x));

for n= 1:N-1
  x(n+1) = x(n) + h*phi(h,t(n),x(n));
 end
 
 plot(t,x);
 xlabel('t'), ylabel('x');
 