%% 18.6 Experiment 6: Linear Programming Duality and Sensitivity Analysis
fprintf('--- 18.6 Experiment 6: LP Duality & Sensitivity Analysis ---\n');
% Maximize f(x) = 4*x1 + 5*x2
% Subject to: 2*x1 + x2 <= 10, x1 + 2*x2 <= 8, x1,x2 >= 0
primalObjective = [-4; -5];
primalConstraintMatrix = [2, 1; 1, 2];
primalConstraintRhs = [10; 8];
primalLowerBounds = [0; 0];

[primalSolution, primalObjValue, ~, solverOutput, multipliers] = linprog(primalObjective, primalConstraintMatrix, primalConstraintRhs, [], [], primalLowerBounds);
fprintf('Primal Optimal Objective: %.4f\n', -primalObjValue);
fprintf('Dual Variables (Shadow Prices / Lagrange Multipliers for constraints):\n');
disp(multipliers.ineqlin);
fprintf('\n');
