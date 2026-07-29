%% 18.3 Experiment 3: Convex Optimization Using MATLAB's CVX Toolbox
fprintf('--- 18.3 Experiment 3: Convex Optimization (CVX) ---\n');

cvx_begin quiet
    variables x_cvx(2);
    minimize( x_cvx(1)^2 + x_cvx(2)^2 );
    subject to
        x_cvx(1) + x_cvx(2) == 4;
        x_cvx(1) >= 0;
        x_cvx(2) >= 0;
cvx_end

fprintf('CVX Optimal Solution: x1 = %.4f, x2 = %.4f\n', x_cvx(1), x_cvx(2));
fprintf('CVX Minimum Objective Value: %.4f\n\n', cvx_optval);