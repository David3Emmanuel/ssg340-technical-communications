%% 18.9 Experiment 9: KKT Conditions for Constrained Optimization
fprintf('--- 18.9 Experiment 9: KKT Conditions ---\n');
% Minimize f(x) = x1^2 + x2^2 
% Subject to g1(x) = x1 + x2 - 2 <= 0, g2(x) = x1 - 1 >= 0 -> -x1 + 1 <= 0
% Using fmincon to verify KKT numerical stationary points
options = optimoptions('fmincon', 'Display', 'off');
nonlcon = [];
[x_kkt, f_kkt, ~, ~, lambda_kkt] = fmincon(@(x) x(1)^2 + x(2)^2, [0, 0], [1, 1; -1, 0], [2; -1], [], [], [], [], nonlcon, options);

fprintf('KKT Verified Optimal Point: x1 = %.4f, x2 = %.4f\n', x_kkt(1), x_kkt(2));
fprintf('KKT Multipliers (Inequality Constraints): \n');
disp(lambda_kkt.ineqlin);
fprintf('\n');
