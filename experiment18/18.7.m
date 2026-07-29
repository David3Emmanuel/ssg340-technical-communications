%% 18.7 Experiment 7: Branch and Bound for Integer Programming
fprintf('--- 18.7 Experiment 7: Branch and Bound ---\n');
% Minimize f(x) = 2*x1 + 3*x2 subject to x1 + 2*x2 <= 6, 3*x1 + x2 <= 7, x1,x2 in Z+
f_bb = [2; 3];
A_bb = [1, 2; 3, 1];
b_bb = [6; 7];
lb_bb = [0; 0];
intcon_bb = [1, 2];

[x_bb, f_bb_val] = intlinprog(f_bb, intcon_bb, A_bb, b_bb, [], [], lb_bb);
fprintf('Branch and Bound Integer Solution: x1 = %d, x2 = %d\n', round(x_bb(1)), round(x_bb(2)));
fprintf('Optimal Cost: %.4f\n\n', f_bb_val);
