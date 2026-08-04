%% 18.3 Experiment 3: Convex Optimization Using MATLAB's CVX Toolbox
fprintf('--- 18.3 Experiment 3: Convex Optimization (CVX) ---\n');

cvx_begin quiet
    variables convexVars(2);
    minimize( convexVars(1)^2 + convexVars(2)^2 );
    subject to
        convexVars(1) + convexVars(2) == 4;
        convexVars(1) >= 0;
        convexVars(2) >= 0;
cvx_end

fprintf('CVX Optimal Solution: x1 = %.4f, x2 = %.4f\n', convexVars(1), convexVars(2));
fprintf('CVX Minimum Objective Value: %.4f\n\n', cvx_optval);
