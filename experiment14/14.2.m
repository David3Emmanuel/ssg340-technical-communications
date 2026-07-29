%% Task 2 & 3: Solve and Plot RL Circuit Current
fprintf('--- RL Circuit Response ---\n');
R = input('Enter resistance R (ohms, e.g. 1 to 100): ');
L = input('Enter inductance L (henries, e.g. 0.01 to 10): ');
V = input('Enter voltage source V (volts, e.g. 5 to 240): ');

tau = L / R;              % time constant
tEnd = 5 * tau;           % simulate 5 time constants (current essentially settled)
tspan = [0 tEnd];
i0 = 0;                    % initial current (circuit starts at rest)

% Numerical solution using ode45
odefun = @(t, i) (V - R*i) / L;   % rearranged from di/dt + (R/L)i = V/L
[t_num, i_num] = ode45(odefun, tspan, i0);

% Theoretical (analytical) solution
i_theory = (V/R) * (1 - exp(-R/L * t_num));

%% Task 4 & 5: Plot and Compare Numerical vs Theoretical
figure;
plot(t_num, i_num, 'b-', 'LineWidth', 1.5); hold on;
plot(t_num, i_theory, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Current, i(t) (A)');
title('RL Circuit Current: Numerical vs Theoretical');
legend('Numerical (ode45)', 'Theoretical (analytical)', 'Location', 'best');
grid on;
hold off;

maxError = max(abs(i_num - i_theory));
fprintf('Time constant tau = L/R = %.4f s\n', tau);
fprintf('Steady-state current V/R = %.4f A\n', V/R);
fprintf('Max difference between numerical and theoretical: %.6f A\n', maxError);