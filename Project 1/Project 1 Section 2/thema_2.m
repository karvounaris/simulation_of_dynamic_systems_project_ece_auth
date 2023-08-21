%Καρβουνάρης Παναγιώτης 10193

clear
clc

lamda = 100;
N = 600000;
t = linspace(0, 60, N);
[Vr, Vc] = v(t);
u1 = 2 * sin(4*t);
u2 = 4.*ones(1, N);

%Vc
sys1 = tf([1 0], [1 2*lamda lamda^2]);
sys2 = tf(1, [1 2*lamda lamda^2]);

phi1 = zeros(N, 6);
phi1(:, 1) = lsim(sys1, -Vc, t);
phi1(:, 2) = lsim(sys2, -Vc, t);
phi1(:, 3) = lsim(sys1, u1, t);
phi1(:, 4) = lsim(sys2, u1, t);
phi1(:, 5) = lsim(sys1, u2, t);
phi1(:, 6) = lsim(sys2, u2, t);

thita_transpose1= Vc * phi1 * inv(phi1.' * phi1);

Vc_estimation = thita_transpose1 * phi1.';

figure
plot(t, Vc_estimation, t, Vc);
xlabel('Time');
ylabel('Vc');
title('Plot of Vc and Vc estimation');

%Vr
sys3 = tf([1 0 0], [1 2*lamda lamda^2]);
sys4 = tf([1 0], [1 2*lamda lamda^2]);
sys5 = tf(1, [1 2*lamda lamda^2]);

phi = zeros(N, 8);
phi2(:, 1) = lsim(sys4, -Vr, t);
phi2(:, 2) = lsim(sys5, -Vr, t);
phi2(:, 3) = lsim(sys3, u1, t);
phi2(:, 4) = lsim(sys4, u1, t);
phi2(:, 5) = lsim(sys5, u1, t);
phi2(:, 6) = lsim(sys3, u2, t);
phi2(:, 7) = lsim(sys4, u2, t);
phi2(:, 8) = lsim(sys5, u2, t);

thita_transpose2= Vr * phi2 * inv(phi2.' * phi2);

Vr_estimation = thita_transpose2 * phi2.';

figure
plot(t, Vr_estimation, t, Vr);
xlabel('Time');
ylabel('Vr');
title('Plot of Vr and Vr estimation');

%errors
Vc_error = Vc - Vc_estimation;
Vr_error = Vr - Vr_estimation;

figure
plot(t, Vc_error);
xlabel('Time');
ylabel('Vc error');
title('Plot of Vc error');

figure
plot(t, Vr_error);
xlabel('Time');
ylabel('Vr error');
title('Plot of Vr error');






%repeat the same simulation with the spikes added
%not an efficient way to write code it could be done much better

rand_num =  randi([0 length(Vc)],3,1);
Vc(rand_num) = Vc(rand_num) + 20*Vc(rand_num);

rand_num =  randi([0 length(Vr)],3,1);
Vr(rand_num) = Vr(rand_num) + 20*Vr(rand_num);

%Vc
sys1 = tf([1 0], [1 2*lamda lamda^2]);
sys2 = tf(1, [1 2*lamda lamda^2]);

phi1 = zeros(N, 6);
phi1(:, 1) = lsim(sys1, -Vc, t);
phi1(:, 2) = lsim(sys2, -Vc, t);
phi1(:, 3) = lsim(sys1, u1, t);
phi1(:, 4) = lsim(sys2, u1, t);
phi1(:, 5) = lsim(sys1, u2, t);
phi1(:, 6) = lsim(sys2, u2, t);

thita_transpose1= Vc * phi1 * inv(phi1.' * phi1);

Vc_estimation = thita_transpose1 * phi1.';

figure
plot(t, Vc_estimation, t, Vc);
xlabel('Time');
ylabel('Vc');
title('Plot of Vc and Vc estimation');

%Vr
sys3 = tf([1 0 0], [1 2*lamda lamda^2]);
sys4 = tf([1 0], [1 2*lamda lamda^2]);
sys5 = tf(1, [1 2*lamda lamda^2]);

phi = zeros(N, 8);
phi2(:, 1) = lsim(sys4, -Vr, t);
phi2(:, 2) = lsim(sys5, -Vr, t);
phi2(:, 3) = lsim(sys3, u1, t);
phi2(:, 4) = lsim(sys4, u1, t);
phi2(:, 5) = lsim(sys5, u1, t);
phi2(:, 6) = lsim(sys3, u2, t);
phi2(:, 7) = lsim(sys4, u2, t);
phi2(:, 8) = lsim(sys5, u2, t);

thita_transpose2= Vr * phi2 * inv(phi2.' * phi2);

Vr_estimation = thita_transpose2 * phi2.';

figure
plot(t, Vr_estimation, t, Vr);
xlabel('Time');
ylabel('Vr');
title('Plot of Vr and Vr estimation');

%errors
Vc_error = Vc - Vc_estimation;
Vr_error = Vr - Vr_estimation;

figure
plot(t, Vc_error);
xlabel('Time');
ylabel('Vc error');
title('Plot of Vc error');

figure
plot(t, Vr_error);
xlabel('Time');
ylabel('Vr error');
title('Plot of Vr error');
