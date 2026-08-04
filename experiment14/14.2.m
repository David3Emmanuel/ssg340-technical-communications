%% Task 2 & 3: Solve and Plot RL Circuit Current
fprintf('--- RL Circuit Response ---\n');
resistance = input('Enter resistance R (ohms, e.g. 1 to 100): ');
inductance = input('Enter inductance L (henries, e.g. 0.01 to 10): ');
sourceVoltage = input('Enter voltage source V (volts, e.g. 5 to 240): ');

timeConstant = inductance / resistance;   % time constant
endTime = 5 * timeConstant;               % simulate 5 time constants (current essentially settled)
timeSpan = [0 endTime];
initialCurrent = 0;                        % initial current (circuit starts at rest)

% Numerical solution using ode45
circuitOde = @(t, current) (sourceVoltage - resistance*current) / inductance;   % rearranged from di/dt + (R/L)i = V/L
[timePoints, numericCurrent] = ode45(circuitOde, timeSpan, initialCurrent);

% Theoretical (analytical) solution
theoryCurrent = (sourceVoltage/resistance) * (1 - exp(-resistance/inductance * timePoints));

%% Task 4 & 5: Plot and Compare Numerical vs Theoretical
figure;
plot(timePoints, numericCurrent, 'b-', 'LineWidth', 1.5); hold on;
plot(timePoints, theoryCurrent, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Current, i(t) (A)');
title('RL Circuit Current: Numerical vs Theoretical');
legend('Numerical (ode45)', 'Theoretical (analytical)', 'Location', 'best');
grid on;
hold off;

maxError = max(abs(numericCurrent - theoryCurrent));
fprintf('Time constant tau = L/R = %.4f s\n', timeConstant);
fprintf('Steady-state current V/R = %.4f A\n', sourceVoltage/resistance);
fprintf('Max difference between numerical and theoretical: %.6f A\n', maxError);
