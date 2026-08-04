%% 16.4 Experiment 4: Sparse Matrix Representation and Efficiency
fprintf('--- 16.4 Experiment 4: Sparse Matrix Efficiency ---\n');

% Task 1 & 2: Define a large sparse matrix and convert it
% Creating a 1000x1000 tridiagonal matrix as a stand-in for a large Markov matrix
matrixSize = 1000;
fullMatrix = diag(0.5*ones(matrixSize,1)) + diag(0.25*ones(matrixSize-1,1), 1) + diag(0.25*ones(matrixSize-1,1), -1);
sparseMatrix = sparse(fullMatrix);
rhsVector = rand(matrixSize, 1);

% Task 3: Compare memory usage and computation time
fprintf('Memory Comparison:\n');
fullInfo = whos('fullMatrix');
sparseInfo = whos('sparseMatrix');
fprintf('Full Matrix Bytes: %d\n', fullInfo.bytes);
fprintf('Sparse Matrix Bytes: %d\n', sparseInfo.bytes);

% Task 4: Compare computation time
tic;
fullSolution = fullMatrix \ rhsVector;
fullElapsed = toc;

tic;
sparseSolution = sparseMatrix \ rhsVector;
sparseElapsed = toc;

fprintf('\nComputation Time Comparison:\n');
fprintf('Full Matrix Solve Time: %f seconds\n', fullElapsed);
fprintf('Sparse Matrix Solve Time: %f seconds\n', sparseElapsed);

% Task 5: Use spy function
figure('Name', '16.4 Sparsity Pattern');
spy(sparseMatrix);
title('Sparsity Pattern of Matrix');
