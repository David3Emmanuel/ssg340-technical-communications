%% 18.7 Experiment 7: Branch and Bound for Integer Programming
fprintf('--- 18.7 Experiment 7: Branch and Bound ---\n');
% Minimize f(x) = 2*x1 + 3*x2 subject to x1 + 2*x2 <= 6, 3*x1 + x2 <= 7, x1,x2 in Z+
bbObjective = [2; 3];
bbConstraintMatrix = [1, 2; 3, 1];
bbConstraintRhs = [6; 7];
bbLowerBounds = [0; 0];
bbIntegerVars = [1, 2];

[bbSolution, bbObjValue] = intlinprog(bbObjective, bbIntegerVars, bbConstraintMatrix, bbConstraintRhs, [], [], bbLowerBounds);
fprintf('Branch and Bound Integer Solution: x1 = %d, x2 = %d\n', round(bbSolution(1)), round(bbSolution(2)));
fprintf('Optimal Cost: %.4f\n\n', bbObjValue);
