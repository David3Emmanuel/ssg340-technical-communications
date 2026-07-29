%% 16.1 Experiment 1: Population Dynamics with Leslie Matrix
fprintf('--- 16.1 Experiment 1: Population Dynamics ---\n');

% Task 1: Define the Leslie matrix L
% Placeholder 3x3 matrix (Fecundity in row 1, survival in subdiagonal)
L = [0, 1.5, 1.2; 
     0.8, 0, 0; 
     0, 0.5, 0];

% Task 2: Initialize the population vector X(0)
X = [0; 0; 1]; 
months = 24;

% Arrays to store data for plotting
pop_history = zeros(3, months + 1);
pop_history(:, 1) = X;
total_pop = zeros(1, months + 1);
total_pop(1) = sum(X);

% Task 3 & 4: Compute population for each month and display
for t = 1:months
    X = L * X;
    pop_history(:, t+1) = X;
    total_pop(t+1) = sum(X);
end

figure('Name', '16.1 Population Dynamics');
plot(0:months, total_pop, 'b-', 'LineWidth', 2);
title('Total Rabbit Population Over 24 Months');
xlabel('Time (Months)');
ylabel('Total Population');
grid on;

% Task 5: Investigate the growth factor (Eigenvalues)
eigenvalues = eig(L);
dominant_eigenvalue = max(abs(eigenvalues));
fprintf('Dominant Eigenvalue (Long-term growth factor): %.4f\n', dominant_eigenvalue);
