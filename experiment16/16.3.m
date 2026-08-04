
%% 16.3 Experiment 3: Solving Linear Equations Using MATLAB
fprintf('\n--- 16.3 Experiment 3: Solving Linear Equations ---\n');

% Task 1 & 2: Solve system Ax = b using left division
squareMatrix = [3, 2, -1; 2, -2, 4; -1, 0.5, -1];
rhsVector = [1; -2; 0];
solutionVector = squareMatrix \ rhsVector;
fprintf('Solution to Ax = b:\n');
disp(solutionVector);

% Task 3 & 4: Compute residual r = A*x - b
residual = squareMatrix * solutionVector - rhsVector;
fprintf('Residual (r = A*x - b):\n');
disp(residual);
fprintf('A residual close to zero indicates a highly accurate solution.\n');

% Task 5: Overdetermined and Underdetermined systems
tallMatrix = [1, 2; 3, 4; 5, 6];
tallRhs = [1; 2; 3];
leastSquaresSolution = tallMatrix \ tallRhs; % Least-squares solution
fprintf('\nOverdetermined Least-Squares Solution:\n');
disp(leastSquaresSolution);

wideMatrix = [1, 2, 3; 4, 5, 6];
wideRhs = [1; 2];
minimumNormSolution = wideMatrix \ wideRhs;
fprintf('Underdetermined Solution (One of infinitely many):\n');
disp(minimumNormSolution);

% Task 6: Investigate ill-conditioned systems using rcond
illConditioned = [1, 1; 1, 1.0001];
condEstimate = rcond(illConditioned);
fprintf('\nReciprocal condition number (rcond) of ill-conditioned matrix: %e\n', condEstimate);
