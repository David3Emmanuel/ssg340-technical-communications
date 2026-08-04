fprintf('--- 18.1 Experiment 1: Linear Programming (LP) ---\n');
% Maximize f(x) = 4*x1 + 5*x2 -> Equivalent to minimizing -[4, 5]*x
lpObjective = [-4; -5];
lpConstraintMatrix = [2, 1;
                      1, 2];
lpConstraintRhs = [10; 8];
lpLowerBounds = [0; 0];

[lpSolution, lpObjValue] = linprog(lpObjective, lpConstraintMatrix, lpConstraintRhs, [], [], lpLowerBounds);
fprintf('LP Optimal Solution: x1 = %.4f, x2 = %.4f\n', lpSolution(1), lpSolution(2));
fprintf('Maximum Objective Value: %.4f\n\n', -lpObjValue);
