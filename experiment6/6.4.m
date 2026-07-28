%% Task 1: Matrix Creation and Subscript Access
fprintf('--- Task 1: Matrix Creation and Subscript Access ---\n');
A = [1 2 3; 4 5 6; 7 8 9];
disp('Matrix A:');
disp(A);

fprintf('A(2,3) = %d\n', A(2,3));
disp('A(:,2) (second column):');
disp(A(:,2));

%% Task 2: Matrix Multiplication and Element-wise Operations
fprintf('\n--- Task 2: Matrix Multiplication and Element-wise Ops ---\n');
B = [1 2 3; 4 5 6; 7 8 9];

C = A * B;        % matrix multiplication
D = A .* B;        % element-wise multiplication

disp('C = A * B (matrix multiplication):');
disp(C);
disp('D = A .* B (element-wise multiplication):');
disp(D);

%% Task 3: Matrix Transposition and Accessing Submatrices
fprintf('\n--- Task 3: Transposition and Submatrices ---\n');
Atrans = A';   % transpose of A
disp('A transpose:');
disp(Atrans);

sub = A(1:2, 2:3);   % submatrix using colon notation
disp('Submatrix A(1:2, 2:3):');
disp(sub);

%% Task 4: Advanced Matrix Reshaping and Operations
fprintf('\n--- Task 4: Matrix Reshaping ---\n');
x = 1:9;
M = reshape(x, 3, 3);   % reshape 1D array into 3x3 matrix
disp('Reshaped 3x3 matrix M:');
disp(M);

Mtrans = M';             % transpose of reshaped matrix
disp('Transpose of M:');
disp(Mtrans);

Msquared = M .^ 2;       % element-wise square, another operation on reshaped matrix
disp('Element-wise square of M:');
disp(Msquared);