%Panagiotis Karvounaris 10193
clear;
clc;

%plot of y
N = 2000; %Number of samples
lamda = 2;
tspan = linspace(0, 200, 2000);
initialConditions = [0; 0];
u = 15 * sin(3*tspan) + 8 * N;

[t, y] = ode45(@difEquation, tspan, initialConditions);

% figure;
% plot(t, y(:,1));
% xlabel('Time');
% ylabel('y');
% title('Plot of y');


%plot of the estimation of y
sys1 = tf([1 0], [1 2*lamda lamda^2]);
sys2 = tf(1, [1 2*lamda lamda^2]);
phi = zeros(N, 3);
phi(:,1) = lsim(sys1, y(:,1), tspan);
phi(:,2) = lsim(sys2, y(:,1), tspan);
phi(:,3) = lsim(sys2, u, tspan);

%calculate thita, which is a 1x3 matrix and include the estimations for
%our parameters
thita_transpose= y(:,1).' * phi * inv(phi.' * phi);

%calculate the estimation of y
y_estimation = thita_transpose * phi.';

figure
plot(tspan, y_estimation, tspan, y(:,1));
xlabel('Time');
ylabel('y');
title('Plot of y and y estimation');



%plot the error
y_error = y(:,1).' - y_estimation;

figure;
plot(tspan, y_error);
xlabel('Time');
ylabel('y error');
title('Plot of y error');

