%% Task 1: Matrix Creation and Subscript Access
fprintf('--- Task 1: Matrix Creation and Subscript Access ---\n');
A = [1 2 3; 4 5 6; 7 8 9];
fprintf('Creating a 3x3 Matrix A:\n');
disp(A);

fprintf('Accessing the element in the 2nd row, 3rd column (A(2,3)):\n');
fprintf('Result: %d\n\n', A(2,3));

fprintf('Extracting the entire second column (A(:,2)):\n');
disp(A(:,2));

%% Task 2: Matrix Multiplication and Element-wise Operations
fprintf('\n--- Task 2: Matrix Multiplication and Element-wise Ops ---\n');
B = [1 2 3; 4 5 6; 7 8 9];

C = A * B;        % matrix multiplication
D = A .* B;       % element-wise multiplication

fprintf('Performing standard matrix multiplication (C = A * B):\n');
disp(C);

fprintf('Performing element-wise multiplication (D = A .* B):\n');
disp(D);

%% Task 3: Matrix Transposition and Accessing Submatrices
fprintf('\n--- Task 3: Transposition and Submatrices ---\n');
Atrans = A';   % transpose of A
fprintf('Transposing Matrix A (switching rows and columns):\n');
disp(Atrans);

sub = A(1:2, 2:3);   % submatrix using colon notation
fprintf('Extracting a submatrix from A (rows 1 to 2, columns 2 to 3):\n');
disp(sub);

%% Task 4: Advanced Matrix Reshaping and Operations
fprintf('\n--- Task 4: Matrix Reshaping ---\n');
x = 1:9;
M = reshape(x, 3, 3);   % reshape 1D array into 3x3 matrix
fprintf('Reshaping a 1D array (1 to 9) into a 3x3 matrix M:\n');
disp(M);

Mtrans = M';             % transpose of reshaped matrix
fprintf('Transposing the reshaped matrix M:\n');
disp(Mtrans);

Msquared = M .^ 2;       % element-wise square, another operation on reshaped matrix
fprintf('Calculating the element-wise square of M (M .^ 2):\n');
disp(Msquared);