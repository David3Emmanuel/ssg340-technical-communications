%% 16.4 Experiment 4: Sparse Matrix Representation and Efficiency
fprintf('--- 16.4 Experiment 4: Sparse Matrix Efficiency ---\n');

% Task 1 & 2: Define a large sparse matrix and convert it
% Creating a 1000x1000 tridiagonal matrix as a stand-in for a large Markov matrix
N = 1000;
A_full = diag(0.5*ones(N,1)) + diag(0.25*ones(N-1,1), 1) + diag(0.25*ones(N-1,1), -1);
A_sparse = sparse(A_full);
b_large = rand(N, 1);

% Task 3: Compare memory usage and computation time
fprintf('Memory Comparison:\n');
info_full = whos('A_full');
info_sparse = whos('A_sparse');
fprintf('Full Matrix Bytes: %d\n', info_full.bytes);
fprintf('Sparse Matrix Bytes: %d\n', info_sparse.bytes);

% Task 4: Compare computation time
tic;
x_full = A_full \ b_large;
time_full = toc;

tic;
x_sparse = A_sparse \ b_large;
time_sparse = toc;

fprintf('\nComputation Time Comparison:\n');
fprintf('Full Matrix Solve Time: %f seconds\n', time_full);
fprintf('Sparse Matrix Solve Time: %f seconds\n', time_sparse);

% Task 5: Use spy function
figure('Name', '16.4 Sparsity Pattern');
spy(A_sparse);
title('Sparsity Pattern of Matrix');
