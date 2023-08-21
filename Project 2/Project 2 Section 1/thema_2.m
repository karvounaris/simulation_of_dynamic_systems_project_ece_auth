%Παναγιώτης Καρβουνάρης ΑΕΜ10193

clear;
clc;

N = 1000; %Number of samples
t_span = linspace(0, 20, N);
am = 2;
a = 3;
b = 0.5;
gamma = 1;
initial_conditions = 0;


%find x
[t, x] = ode45(@dif_x, t_span, initial_conditions);

%if you want to change the u the you have to change it in the dif_x
%function too
%u = ones(1, N) * 10;
u = 10 * sin(3*t);

%find a_estimation and b_estimation
thita_estimation_1 = zeros(1, N);
thita_estimation_2 = zeros(1, N);
x_estimation = zeros(1, N);
phi_1 = zeros(1, N);
phi_2 = zeros(1, N);
for i = 1:1:N
    %solution of the differential equation φ1(dot)=-φ1*αm+x
    phi_1(i) = exp(-2*t(i))*(x(i)/am) + x(i)/am;
    %solution of the differential equation φ2(dot)=-φ2*αm+u
    phi_2(i) = exp(-2*t(i))*(u(i)/am) + u(i)/am;
    
    %solution of the differential equation θ(dot)=γ*(θ*-θ^)*φ^2
    %θ1* = αm - α
    %θ2* = b
    thita_estimation_1(i) = (am - a) - (am - a) * exp(-gamma*(phi_1(i)^2)*t(i));
    thita_estimation_2(i) = b - b * exp(-gamma*(phi_2(i)^2)*t(i));
    
    %find x_estimation
    x_estimation(i) = [thita_estimation_1(i), thita_estimation_2(i)] * [phi_1(i); phi_2(i)];
end

am = ones(1, N) * am;
a_estimation = am - thita_estimation_1;
b_estimation = thita_estimation_2;
a = ones(1, N) * a;
b = ones(1, N) * b;

figure
plot(t, x, t, x_estimation);
xlabel('Time');
ylabel('x(blue) and x estimation(red)');
title('Plot of x and x estimation');

figure
plot(t, a, t, a_estimation);
xlabel('Time');
ylabel('a(blue) and a estimation(red)');
title('Plot of a and a estimation');

figure
plot(t, b, t, b_estimation);
xlabel('Time');
ylabel('b(blue) and b estimation(red)');
title('Plot of b and b estimation');

x_error = x' - x_estimation;
a_error = a - a_estimation;
b_error = b - b_estimation;

figure
plot(t, x_error);
xlabel('Time');
ylabel('x error');
title('Plot of x error');

figure
plot(t, a_error);
xlabel('Time');
ylabel('a error');
title('Plot of a error');

figure
plot(t, b_error);
xlabel('Time');
ylabel('b error');
title('Plot of b error');

