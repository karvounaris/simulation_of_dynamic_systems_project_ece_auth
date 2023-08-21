function dydt = dif_system_mix(t, sys_var, gamma_1, gamma_2, a, b, theta_m)

frequency = 40;
n_0 = 0.5;
u = 10 * sin(3*t);
noise = n_0 * sin (2*pi*frequency*t);

dydt = [- a * (sys_var(1)+noise) + b * u;
        - gamma_1 * (sys_var(1)+noise)^2 + gamma_1 * (sys_var(1)+noise) * sys_var(4);
        gamma_2 * (sys_var(1)+noise) * u - gamma_2 * sys_var(4) * u;
        - sys_var(2) * sys_var(1) + sys_var(3) * u + theta_m * ((sys_var(1)+noise) - sys_var(4))];
end
