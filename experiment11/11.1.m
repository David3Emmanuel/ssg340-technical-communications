%% 11.1 Experiment 1: Update Processes and Temperature Modeling
clc; clear; close all;

T0 = 30; % Initial temp
F = 4;   % Fridge temp
K1 = 0.02; 
K2 = 0.05;

% Task 3: User inputs
dt = input('Enter time step (dt) [e.g., 1.0]: ');
out_interval = input('Enter output display interval [e.g., 2.0]: ');

t_max = 200;
t_num = 0:dt:t_max;
T_num1 = zeros(size(t_num)); T_num1(1) = T0;
T_num2 = zeros(size(t_num)); T_num2(1) = T0;

% Numerical update process
for i = 1:(length(t_num)-1)
    T_num1(i+1) = T_num1(i) - K1 * dt * (T_num1(i) - F);
    T_num2(i+1) = T_num2(i) - K2 * dt * (T_num2(i) - F);
    
    % Display at user-specified intervals
    if mod(t_num(i+1), out_interval) < 1e-5
        fprintf('Time: %5.1f | T (K=0.02): %5.2f | T (K=0.05): %5.2f\n', t_num(i+1), T_num1(i+1), T_num2(i+1));
    end
end

% Exact solutions
T_exact1 = F + (T0 - F) * exp(-K1 * t_num);
T_exact2 = F + (T0 - F) * exp(-K2 * t_num);

figure('Name', '11.1 Cooling Curves');
plot(t_num, T_num1, 'b--', t_num, T_exact1, 'b-', 'LineWidth', 1.5); hold on;
plot(t_num, T_num2, 'r--', t_num, T_exact2, 'r-', 'LineWidth', 1.5);
xlabel('Time'); ylabel('Temperature');
title('Cooling Curves: Numerical vs Exact');
grid on;

disp('Click on the graph to place the labels using gtext...');
gtext('K=0.02 Numerical');
gtext('K=0.02 Exact');
gtext('K=0.05 Numerical');
gtext('K=0.05 Exact');

