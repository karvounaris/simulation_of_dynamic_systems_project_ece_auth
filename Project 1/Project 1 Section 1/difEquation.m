function dxdt = difEquation(t,x)

N = 100; %Number of samples
mass = 10; %kg
b = 0.5; %kg/s^
k = 2.5; %kg/s^2
u = 15*sin(3*t) + 8 * N;


dxdt = [x(2) ; - (b / mass) * x(2) - (k / mass) * x(1) + u / mass];
end