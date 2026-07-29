
%% 18.2 Experiment 2: Integer Programming (IP) for Scheduling Optimization
fprintf('--- 18.2 Experiment 2: Integer Programming (IP) ---\n');
% Minimize f(x) = 3*x1 + 2*x2
f2 = [3; 2];
A2 = [-1, -1]; % -x1 - x2 >= -4  =>  x1 + x2 >= 4
b2 = [-4];
lb2 = [0; 0];
intcon2 = [1, 2]; % Specifies integer variables

[x_opt_ip, fval_ip] = intlinprog(f2, intcon2, A2, b2, [], [], lb2);
fprintf('IP Optimal Integer Solution: x1 = %d, x2 = %d\n', round(x_opt_ip(1)), round(x_opt_ip(2)));
fprintf('Minimum Objective Value: %.4f\n\n', fval_ip);