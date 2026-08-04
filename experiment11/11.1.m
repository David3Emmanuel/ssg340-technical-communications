%% 11.1 Experiment 1: Update Processes and Temperature Modeling
clc; clear; close all;

startTemp = 30; % Initial temp
fridgeTemp = 4;   % Fridge temp
slowConst = 0.02;
fastConst = 0.05;

% Task 3: User inputs
timeStep = input('Enter time step dt (s, 0.1 to 2.0, e.g. 1.0): ');
outputInterval = input('Enter output display interval (s, 1 to 10, multiple of dt, e.g. 2.0): ');

maxTime = 200;
timeGrid = 0:timeStep:maxTime;
slowNumeric = zeros(size(timeGrid)); slowNumeric(1) = startTemp;
fastNumeric = zeros(size(timeGrid)); fastNumeric(1) = startTemp;

% Numerical update process
for stepIdx = 1:(length(timeGrid)-1)
    slowNumeric(stepIdx+1) = slowNumeric(stepIdx) - slowConst * timeStep * (slowNumeric(stepIdx) - fridgeTemp);
    fastNumeric(stepIdx+1) = fastNumeric(stepIdx) - fastConst * timeStep * (fastNumeric(stepIdx) - fridgeTemp);

    % Display at user-specified intervals
    if mod(timeGrid(stepIdx+1), outputInterval) < 1e-5
        fprintf('Time: %5.1f | T (K=0.02): %5.2f | T (K=0.05): %5.2f\n', timeGrid(stepIdx+1), slowNumeric(stepIdx+1), fastNumeric(stepIdx+1));
    end
end

% Exact solutions
slowExact = fridgeTemp + (startTemp - fridgeTemp) * exp(-slowConst * timeGrid);
fastExact = fridgeTemp + (startTemp - fridgeTemp) * exp(-fastConst * timeGrid);

figure('Name', '11.1 Cooling Curves');
plot(timeGrid, slowNumeric, 'b--', timeGrid, slowExact, 'b-', 'LineWidth', 1.5); hold on;
plot(timeGrid, fastNumeric, 'r--', timeGrid, fastExact, 'r-', 'LineWidth', 1.5);
xlabel('Time'); ylabel('Temperature');
title('Cooling Curves: Numerical vs Exact');
grid on;

disp('Click on the graph to place the labels using gtext...');
gtext('K=0.02 Numerical');
gtext('K=0.02 Exact');
gtext('K=0.05 Numerical');
gtext('K=0.05 Exact');

