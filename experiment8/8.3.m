%% 8.3 Experiment 3: Temperature Change Modeling and Analysis (Using a While Loop)
fprintf('--- 8.3 Experiment 3: Temperature Change Modeling ---\n');

% Task 2: Prompt the user to input the initial parameters
startTemp = input('Enter initial temperature of juice T0 (C, 25 to 35, e.g. 30): ');
fridgeTemp = input('Enter ambient temperature of fridge F (C, 2 to 5, e.g. 4): ');
coolingConst = input('Enter cooling constant K (0.01 to 0.05, e.g. 0.02): ');
timeStep = input('Enter time step dt (s, 0.1 to 1.0, e.g. 0.5): ');
outputInterval = input('Enter output interval opint (s, 1 to 5, must be a multiple of dt, e.g. 2.0): ');

% Task 5: Ensure output interval opint is an integer multiple of dt
% Using a small tolerance (1e-6) to account for floating-point arithmetic issues
if abs(mod(outputInterval, timeStep)) > 1e-6 && abs(mod(outputInterval, timeStep) - timeStep) > 1e-6
    sound(sin(1:3000)); % Play a sound as requested
    error('Error: Output interval (opint) must be an integer multiple of time step (dt). Program terminated.');
end

% Initialization for Task 3
currentTemp = startTemp;
elapsedTime = 0;
timeHistory = elapsedTime;
tempHistory = currentTemp;
settleTolerance = 0.1; % Temperature difference to define "stabilized near F"
lastPrintTime = 0;

fprintf('\nCooling Process Data:\n');
fprintf('Time (s) | Temperature (*C)\n');
fprintf('--------------------------\n');

% Task 3 & 4: While loop to simulate cooling process
while abs(currentTemp - fridgeTemp) > settleTolerance
    % Update temperature using the provided formula: T_{i+1} = T_i - K * dt * (T_i - F)
    currentTemp = currentTemp - coolingConst * timeStep * (currentTemp - fridgeTemp);
    elapsedTime = elapsedTime + timeStep;

    % Store data for plotting
    timeHistory(end+1) = elapsedTime;
    tempHistory(end+1) = currentTemp;

    % Print at specific output intervals
    if (elapsedTime - lastPrintTime) >= outputInterval - 1e-6
        fprintf('%8.2f | %14.2f\n', elapsedTime, currentTemp);
        lastPrintTime = elapsedTime;
    end
end

% Plotting for Experiment 3
figure('Name', 'Experiment 3: Temperature vs Time');
plot(timeHistory, tempHistory, 'b-', 'LineWidth', 2);
title('Temperature Cooling Over Time');
xlabel('Time');
ylabel('Temperature');
grid on;

% Task 6 & 7 Discussions printed to console
fprintf('\n--- Experiment 3 Discussion Notes ---\n');
fprintf('Task 6 (Cooling Constant K): A larger K value represents a faster rate of heat transfer, meaning the temperature will stabilize near F in a much shorter time. A smaller K means better insulation, taking longer to cool.\n');
fprintf('Task 7 (Time Step dt & Errors): Smaller time steps (dt) reduce numerical errors introduced by the discrete Euler approximation, making the simulation closer to continuous real-world physics. However, making dt too small increases computational loops and execution time.\n\n');

