%% 18.9 Experiment 9: KKT Conditions for Constrained Optimization
fprintf('--- 18.9 Experiment 9: KKT Conditions ---\n');
% Minimize f(x) = x1^2 + x2^2
% Subject to g1(x) = x1 + x2 - 2 <= 0, g2(x) = x1 - 1 >= 0 -> -x1 + 1 <= 0
% Using fmincon to verify KKT numerical stationary points
solverOptions = optimoptions('fmincon', 'Display', 'off');
nonlinearConstraints = [];
[kktSolution, kktObjValue, ~, ~, kktMultipliers] = fmincon(@(x) x(1)^2 + x(2)^2, [0, 0], [1, 1; -1, 0], [2; -1], [], [], [], [], nonlinearConstraints, solverOptions);

fprintf('KKT Verified Optimal Point: x1 = %.4f, x2 = %.4f\n', kktSolution(1), kktSolution(2));
fprintf('KKT Multipliers (Inequality Constraints): \n');
disp(kktMultipliers.ineqlin);
fprintf('\n');
