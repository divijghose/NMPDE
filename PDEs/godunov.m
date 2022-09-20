#w_t + f(w)_x = 0, 0<t<=0.25, 0<x<2
#1. f(w) = (w^2)/2 --> w(x,0) = { 2, if x<=1
#                              ={ 0.5 if X > 1
#2. f(w) = (w^2)/(w^2+0.5*(1-w)^2) --> w(x,0) = {0.5 if x<=1
#                                             = {2 if x>1
clc; clear
K = 2;
x_min = 0;
x_max = 2;
h = 1e-2;
Nh = (x_max - x_min)/h;
x = linspace(x_min,x_max,Nh);

t_min = 0;
t_max = 0.25;

f1 = @(w) (w^2)/2;
f2 = @(w) (w^2)/((w^2)+0.5*((1-w)^2));
u1_0 = zeros(1,Nh);
for i = 1:Nh
  if(x(i)>1)
    u1_0(i) = 0.5;
    u2_0(i) = 2;
  elseif(x(i)<=1)
    u1_0(i) = 2;
    u2_0(i) = 0.5;
   endif
endfor
#replace with element wise

##function FG = calcGodunovF(u,v)
##  if (u <= v)
##    FG = min(((u^2)/2.0),((v^2)/2.0));
##  else 
##    FG = max(((u^2)/2.0),((v^2)/2.0));
##  endif
##  
## endfunction
function FG = calcGodunovF(u,v)
  if (u <= v)
    FG = min(((u^2)/((u^2)+0.5*((1-u)^2))),((v^2)/((v^2)+0.5*((1-v)^2))));
  else 
    FG = max(((u^2)/((u^2)+0.5*((1-u)^2))),((v^2)/((v^2)+0.5*((1-v)^2))));
  endif
  
 endfunction
#
dt = h/2;
t_0 = 0;
t_n = t_0;
u = zeros(1,Nh);
while(t_n<=t_max)
  #dt = returnDt(u,h,Nh);
  t_n=t_n+dt;
  for i = 2:Nh-1
    u(i) = u1_0(i) - (dt/h)*(calcGodunovF(u1_0(i),u1_0(i+1))-calcGodunovF(u1_0(i-1),u1_0(i)));
  endfor
  u(1) = u(2);
  u(Nh) = u(Nh-1);
  u1_0 = u;
  plot(x,u);
  pause(0.1);
endwhile
