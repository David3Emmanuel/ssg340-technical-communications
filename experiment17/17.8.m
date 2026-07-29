fprintf('\n--- 17.8: System of ODEs (Runge-Kutta / ode45) ---\n');
odefun = @(t, v) [10*(v(2) - v(1));
                  -v(1)*v(3) + 28*v(1) - v(2);
                   v(1)*v(2) - (8/3)*v(3)];

tspan = [0 20];
v0 = [1; 1; 1];

[t, v] = ode45(odefun, tspan, v0);

figure;
plot3(v(:,1), v(:,2), v(:,3));
xlabel('x'); ylabel('y'); zlabel('z');
title('System of ODEs: Runge-Kutta (ode45)');
grid on;