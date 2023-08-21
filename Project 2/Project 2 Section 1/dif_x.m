function dxdt = dif_x(t,x)

a = 3;
b = 0.5; 
%u = 10;
u = 10 * sin (3*t);

dxdt = - a * x + b * u;
end