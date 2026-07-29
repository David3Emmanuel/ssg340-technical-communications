fprintf('--- 18.1 Experiment 1: Linear Programming (LP) ---\n');
% Maximize f(x) = 4*x1 + 5*x2 -> Equivalent to minimizing -[4, 5]*x
f1 = [-4; -5];
A1 = [2, 1; 
      1, 2];
b1 = [10; 8];
lb1 = [0; 0];

[x_opt_lp, fval_lp] = linprog(f1, A1, b1, [], [], lb1);
fprintf('LP Optimal Solution: x1 = %.4f, x2 = %.4f\n', x_opt_lp(1), x_opt_lp(2));
fprintf('Maximum Objective Value: %.4f\n\n', -fval_lp);
