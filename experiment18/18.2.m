
%% 18.2 Experiment 2: Integer Programming (IP) for Scheduling Optimization
fprintf('--- 18.2 Experiment 2: Integer Programming (IP) ---\n');
% Minimize f(x) = 3*x1 + 2*x2
ipObjective = [3; 2];
ipConstraintMatrix = [-1, -1]; % -x1 - x2 >= -4  =>  x1 + x2 >= 4
ipConstraintRhs = [-4];
ipLowerBounds = [0; 0];
ipIntegerVars = [1, 2]; % Specifies integer variables

[ipSolution, ipObjValue] = intlinprog(ipObjective, ipIntegerVars, ipConstraintMatrix, ipConstraintRhs, [], [], ipLowerBounds);
fprintf('IP Optimal Integer Solution: x1 = %d, x2 = %d\n', round(ipSolution(1)), round(ipSolution(2)));
fprintf('Minimum Objective Value: %.4f\n\n', ipObjValue);
