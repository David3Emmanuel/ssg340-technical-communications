%% 18.4 Experiment 4: Quadratic Programming (QP) for Portfolio Optimization
fprintf('--- 18.4 Experiment 4: Quadratic Programming (Portfolio) ---\n');
% Minimize f(x) = 0.5 * x^T * Q * x
% Subject to: sum(x) = 1, x >= 0
covarianceMatrix = [4, 1;
                    1, 2]; % Example covariance matrix
qpLinearTerm = [0; 0];
qpInequalityMatrix = []; qpInequalityRhs = [];
qpEqualityMatrix = [1, 1]; qpEqualityRhs = 1;
qpLowerBounds = [0; 0];

[portfolioWeights, portfolioVariance] = quadprog(covarianceMatrix, qpLinearTerm, qpInequalityMatrix, qpInequalityRhs, qpEqualityMatrix, qpEqualityRhs, qpLowerBounds);
fprintf('Optimal Portfolio Weights: w1 = %.4f, w2 = %.4f\n', portfolioWeights(1), portfolioWeights(2));
fprintf('Minimum Variance Objective: %.4f\n\n', portfolioVariance);
