 function dydt = dif_system(t, x, A, B, C, gamma_1, gamma_2)

u = 3.5 * sin(7.2*t) + 2 * sin(11.7*t);

%x(1) = x1
%x(2) = x2
%x(3) = a1,1 hat
%x(4) = a1,2 hat
%x(5) = a2,1 hat
%x(6) = a2,2 hat
%x(7) = b1 hat
%x(8) = b2 hat
%x(9) = x1 hat
%x(10) = x2 hat

error_x1 = x(1) - x(9);
error_x2 = x(2) - x(10);

dydt = [A(1,1) * x(1) + A(1,2) * x(2) + B(1) * u; %x1
        A(2,1) * x(1) + A(2,2) * x(2) + B(2) * u; %x2
        gamma_1 * x(1) * error_x1; %a1,1 hat
        gamma_1 * x(2) * error_x1; %a1,2 hat
        gamma_1 * x(1) * error_x2; %a2,1 hat
        gamma_1 * x(2) * error_x2; %a2,2 hat
        gamma_2 * u * error_x1; %b1 hat
        gamma_2 * u * error_x2; %b2 hat
        x(3) * x(1) + x(4) * x(2) + x(7) * u + C(1,1) * error_x1 + C(1,2) * error_x2; %x1 hat
        x(5) * x(1) + x(6) * x(2) + x(8) * u + C(2,1) * error_x1 + C(2,2) * error_x2]; %x2 hat
end
