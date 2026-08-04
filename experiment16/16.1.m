%% 16.1 Experiment 1: Population Dynamics with Leslie Matrix
fprintf('--- 16.1 Experiment 1: Population Dynamics ---\n');

% Task 1: Define the Leslie matrix L
% Placeholder 3x3 matrix (Fecundity in row 1, survival in subdiagonal)
leslieMatrix = [0, 1.5, 1.2;
                0.8, 0, 0;
                0, 0.5, 0];

% Task 2: Initialize the population vector X(0)
popVector = [0; 0; 1];
numMonths = 24;

% Arrays to store data for plotting
popHistory = zeros(3, numMonths + 1);
popHistory(:, 1) = popVector;
totalPopulation = zeros(1, numMonths + 1);
totalPopulation(1) = sum(popVector);

% Task 3 & 4: Compute population for each month and display
for monthIdx = 1:numMonths
    popVector = leslieMatrix * popVector;
    popHistory(:, monthIdx+1) = popVector;
    totalPopulation(monthIdx+1) = sum(popVector);
end

figure('Name', '16.1 Population Dynamics');
plot(0:numMonths, totalPopulation, 'b-', 'LineWidth', 2);
title('Total Rabbit Population Over 24 Months');
xlabel('Time (Months)');
ylabel('Total Population');
grid on;

% Task 5: Investigate the growth factor (Eigenvalues)
leslieEigenvalues = eig(leslieMatrix);
dominantEigenvalue = max(abs(leslieEigenvalues));
fprintf('Dominant Eigenvalue (Long-term growth factor): %.4f\n', dominantEigenvalue);
