%% Task 1: Solving a Linear System with Left Division
fprintf('--- Task 1: Solving A*X = B ---\n');
A1 = [2, 3; 4, 5];
B1 = [8; 14];

X = A1 \ B1;   % left division solves A1*X = B1 without forming the inverse

disp('Coefficient matrix A1:');
disp(A1);
disp('Right-hand side B1:');
disp(B1);
disp('Solution X:');
disp(X);

%% Task 2: Determinant, Inverse and the Identity Check
fprintf('\n--- Task 2: Determinant and Inverse ---\n');
A2 = [3, 2; 4, 1];

det_A2 = det(A2);              % non-zero determinant means A2 is invertible
inv_A2 = inv(A2);
identity_check = A2 * inv_A2;  % should return the identity matrix

disp('Matrix A2:');
disp(A2);
fprintf('Determinant of A2: %.4f\n', det_A2);
disp('Inverse of A2:');
disp(inv_A2);
disp('A2 * inv(A2) (should be the identity):');
disp(identity_check);

%% Task 3: Eigenvalues and Eigenvectors
fprintf('\n--- Task 3: Eigenvalues and Eigenvectors ---\n');
A3 = [4, 1; 2, 3];

[V, D] = eig(A3);   % V holds the eigenvectors in columns, D the eigenvalues on its diagonal

disp('Matrix A3:');
disp(A3);
disp('Eigenvectors (one per column of V):');
disp(V);
disp('Eigenvalues (on the diagonal of D):');
disp(D);

%% Task 4: LU Decomposition
fprintf('\n--- Task 4: LU Decomposition ---\n');
A4 = [4, 2; 3, 1];

[L, U] = lu(A4);   % factorises A4 into a lower and an upper triangular matrix

disp('Matrix A4:');
disp(A4);
disp('Lower triangular factor L:');
disp(L);
disp('Upper triangular factor U:');
disp(U);
disp('L * U (should reproduce A4):');
disp(L * U);
