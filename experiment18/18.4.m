%% 18.4 Experiment 4: Quadratic Programming (QP) for Portfolio Optimization
fprintf('--- 18.4 Experiment 4: Quadratic Programming (Portfolio) ---\n');
% Minimize f(x) = 0.5 * x^T * Q * x
% Subject to: sum(x) = 1, x >= 0
Q = [4, 1; 
     1, 2]; % Example covariance matrix
f_qp = [0; 0];
A_qp = []; b_qp = [];
Aeq_qp = [1, 1]; beq_qp = 1;
lb_qp = [0; 0];

[x_opt_qp, fval_qp] = quadprog(Q, f_qp, A_qp, b_qp, Aeq_qp, beq_qp, lb_qp);
fprintf('Optimal Portfolio Weights: w1 = %.4f, w2 = %.4f\n', x_opt_qp(1), x_opt_qp(2));
fprintf('Minimum Variance Objective: %.4f\n\n', fval_qp);
