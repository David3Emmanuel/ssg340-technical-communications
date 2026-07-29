%% 8.3 Experiment 3: Temperature Change Modeling and Analysis (Using a While Loop)
fprintf('--- 8.3 Experiment 3: Temperature Change Modeling ---\n');

% Task 2: Prompt the user to input the initial parameters
T0 = input('Enter initial temperature of juice T0 (C, 25 to 35, e.g. 30): ');
F = input('Enter ambient temperature of fridge F (C, 2 to 5, e.g. 4): ');
K = input('Enter cooling constant K (0.01 to 0.05, e.g. 0.02): ');
dt = input('Enter time step dt (s, 0.1 to 1.0, e.g. 0.5): ');
opint = input('Enter output interval opint (s, 1 to 5, must be a multiple of dt, e.g. 2.0): ');

% Task 5: Ensure output interval opint is an integer multiple of dt
% Using a small tolerance (1e-6) to account for floating-point arithmetic issues
if abs(mod(opint, dt)) > 1e-6 && abs(mod(opint, dt) - dt) > 1e-6
    sound(sin(1:3000)); % Play a sound as requested
    error('Error: Output interval (opint) must be an integer multiple of time step (dt). Program terminated.');
end

% Initialization for Task 3
T = T0;
t = 0;
time_array = t;
temp_array = T;
tolerance = 0.1; % Temperature difference to define "stabilized near F"
last_print_time = 0;

fprintf('\nCooling Process Data:\n');
fprintf('Time (s) | Temperature (*C)\n');
fprintf('--------------------------\n');

% Task 3 & 4: While loop to simulate cooling process
while abs(T - F) > tolerance
    % Update temperature using the provided formula: T_{i+1} = T_i - K * dt * (T_i - F)
    T = T - K * dt * (T - F);
    t = t + dt;
    
    % Store data for plotting
    time_array(end+1) = t;
    temp_array(end+1) = T;
    
    % Print at specific output intervals
    if (t - last_print_time) >= opint - 1e-6
        fprintf('%8.2f | %14.2f\n', t, T);
        last_print_time = t;
    end
end

% Plotting for Experiment 3
figure('Name', 'Experiment 3: Temperature vs Time');
plot(time_array, temp_array, 'b-', 'LineWidth', 2);
title('Temperature Cooling Over Time');
xlabel('Time');
ylabel('Temperature');
grid on;

% Task 6 & 7 Discussions printed to console
fprintf('\n--- Experiment 3 Discussion Notes ---\n');
fprintf('Task 6 (Cooling Constant K): A larger K value represents a faster rate of heat transfer, meaning the temperature will stabilize near F in a much shorter time. A smaller K means better insulation, taking longer to cool.\n');
fprintf('Task 7 (Time Step dt & Errors): Smaller time steps (dt) reduce numerical errors introduced by the discrete Euler approximation, making the simulation closer to continuous real-world physics. However, making dt too small increases computational loops and execution time.\n\n');

