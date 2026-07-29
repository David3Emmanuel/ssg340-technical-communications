%% 18.6 Experiment 6: Linear Programming Duality and Sensitivity Analysis
fprintf('--- 18.6 Experiment 6: LP Duality & Sensitivity Analysis ---\n');
% Maximize f(x) = 4*x1 + 5*x2
% Subject to: 2*x1 + x2 <= 10, x1 + 2*x2 <= 8, x1,x2 >= 0
f_primal = [-4; -5];
A_primal = [2, 1; 1, 2];
b_primal = [10; 8];
lb_primal = [0; 0];

[x_primal, fval_primal, ~, output, lambda] = linprog(f_primal, A_primal, b_primal, [], [], lb_primal);
fprintf('Primal Optimal Objective: %.4f\n', -fval_primal);
fprintf('Dual Variables (Shadow Prices / Lagrange Multipliers for constraints):\n');
disp(lambda.ineqlin);
fprintf('\n');