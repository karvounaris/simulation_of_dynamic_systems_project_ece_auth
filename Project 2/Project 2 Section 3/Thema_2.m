%Παναγιώτης Καρβουνάρης ΑΕΜ10193

clear;
clc;

N = 2000; %Number of samples
t_span = linspace(0, 20, N);
A = [-0.25 3 ; -5 0];
B = [0.5 ; 1.5];
C = [10 0 ; 0 10];
gamma_1 = 13.5;
gamma_2 = 3.5;
initial_conditions = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
u = 3.5 * sin(7.2*t_span) + 2 * sin(11.7*t_span);

%find x
[t, y] = ode45(@(t,sys_var) dif_system(t, sys_var, A, B, C, gamma_1, gamma_2), t_span, initial_conditions);

figure
plot(t, y(:,1), t, y(:,9));
xlabel('Time');
ylabel('x1(blue) and x1 estimation(red)');
title('x1 and x1 estimation');

figure
plot(t, y(:,2), t, y(:,10));
xlabel('Time');
ylabel('x2(blue) and x2 estimation(red)');
title('x2 and x2 estimation');

a11array = ones(1, N) * A(1,1);
a12array = ones(1, N) * A(1,2);
a21array = ones(1, N) * A(2,1);
a22array = ones(1, N) * A(2,2);
b1array = ones(1, N) * B(1);
b2array = ones(1, N) * B(2);

figure
plot(t, a11array, t, y(:,3));
xlabel('Time');
ylabel('a11(blue) and a11 estimation(red)');
title('a11 and a11 estimation');

figure
plot(t, a12array, t, y(:,4));
xlabel('Time');
ylabel('a12(blue) and a12 estimation(red)');
title('a12 and a12 estimation');

figure
plot(t, a21array, t, y(:,5));
xlabel('Time');
ylabel('a21(blue) and a21 estimation(red)');
title('a21 and a21 estimation');

figure
plot(t, a22array, t, y(:,6));
xlabel('Time');
ylabel('a22(blue) and a22 estimation(red)');
title('a22 and a22 estimation');

figure
plot(t, b1array, t, y(:,7));
xlabel('Time');
ylabel('b1(blue) and b1 estimation(red)');
title('b1 and b1 estimation');

figure
plot(t, b2array, t, y(:,8));
xlabel('Time');
ylabel('b2(blue) and b2 estimation(red)');
title('b2 and b2 estimation');

error_x1 = y(:,1) - y(:,9);
error_x2 = y(:,2) - y(:,10);
error_a11 = a11array - y(:,3);
error_a12 = a12array - y(:,4);
error_a21 = a21array - y(:,5);
error_a22 = a22array - y(:,6);
error_b1 = b1array - y(:,7);
error_b2 = b2array - y(:,8);

figure
plot(t, error_x1);
xlabel('Time');
ylabel('x1 error');
title('x1 error');

figure
plot(t, error_x2);
xlabel('Time');
ylabel('x2 error');
title('x2 error');

figure
plot(t, error_a11);
xlabel('Time');
ylabel('a11 error');
title('a11 error');

figure
plot(t, error_a12);
xlabel('Time');
ylabel('a12 error');
title('a12 error');

figure
plot(t, error_a21);
xlabel('Time');
ylabel('a21 error');
title('a21 error');

figure
plot(t, error_a22);
xlabel('Time');
ylabel('a22 error');
title('a22 error');

figure
plot(t, error_b1);
xlabel('Time');
ylabel('b1 error');
title('b1 error');

figure
plot(t, error_b2);
xlabel('Time');
ylabel('b2 error');
title('b2 error');

