fprintf('\n--- 17.6: System of ODEs (ode23) ---\n');
odefun = @(t, v) [10*(v(2) - v(1));
                   -v(1)*v(3) + 28*v(1) - v(2);
                    v(1)*v(2) - (8/3)*v(3)];

tspan = [0 20];
v0 = [1; 1; 1];   % initial condition not specified, using standard Lorenz-like start

[t, v] = ode23(odefun, tspan, v0);

figure;
subplot(3,1,1); plot(t, v(:,1)); ylabel('x(t)'); grid on;
subplot(3,1,2); plot(t, v(:,2)); ylabel('y(t)'); grid on;
subplot(3,1,3); plot(t, v(:,3)); ylabel('z(t)'); xlabel('t'); grid on;
sgtitle('System of ODEs Solution');