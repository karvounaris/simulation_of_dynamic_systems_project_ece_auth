%Παναγιώτης Καρβουνάρης ΑΕΜ10193

clear;
clc;

N = 4000; %Number of samples
t_span = linspace(0, 140, N);
a = 3;
b = 0.5;
gamma_1 = 10;
gamma_2 = 10;
theta_m = 0.1;
initial_conditions = [0, 0, 0, 0];
u = 10 * sin(3*t_span);

%find x and select the method you want to use
%[t, y] = ode45(@(t,sys_var) dif_system_parallel(t, sys_var, gamma_1, gamma_2, a, b), t_span, initial_conditions);
[t, y] = ode45(@(t,sys_var) dif_system_mix(t, sys_var, gamma_1, gamma_2, a, b, theta_m), t_span, initial_conditions);

figure
plot(t, y(:,1), t, y(:,4));
xlabel('Time');
ylabel('x(blue) and x estimation(red)');
title('x and x estimation');

a_array = ones(1, N) * a;
b_array = ones(1, N) * b;

figure
plot(t, a_array, t, y(:,2));
xlabel('Time');
ylabel('thita1(green) and thita1 estimation(blue)');
title('thita1 and thita1 estimation');

figure
plot(t, b_array, t, y(:,3));
xlabel('Time');
ylabel('thita2(green) and thita2 estimation(blue)');
title('thita2 and thita2 estimation');

%errors
x_error = y(:,1) - y(:,4);
thita_1_error = a_array -  y(:,2);
thita_2_error = b_array -  y(:,3);

figure
plot(t, x_error);
xlabel('Time');
ylabel('x error');
title('x error');

figure
plot(t, thita_1_error);
xlabel('Time');
ylabel('thita1 error');
title('thita1 error');

figure
plot(t, thita_2_error);
xlabel('Time');
ylabel('thita2 error');
title('thita2 error');







