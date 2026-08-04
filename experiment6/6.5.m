%% Task 1: Solving a Linear System with Left Division
fprintf('--- Task 1: Solving A*X = B ---\n');
systemMatrix = [2, 3; 4, 5];
systemRhs = [8; 14];

systemSolution = systemMatrix \ systemRhs;   % left division solves the system without forming the inverse

disp('Coefficient matrix systemMatrix:');
disp(systemMatrix);
disp('Right-hand side systemRhs:');
disp(systemRhs);
disp('Solution systemSolution:');
disp(systemSolution);

%% Task 2: Determinant, Inverse and the Identity Check
fprintf('\n--- Task 2: Determinant and Inverse ---\n');
invertibleMatrix = [3, 2; 4, 1];

determinantValue = det(invertibleMatrix);              % non-zero determinant means the matrix is invertible
inverseMatrix = inv(invertibleMatrix);
identityCheck = invertibleMatrix * inverseMatrix;      % should return the identity matrix

disp('Matrix invertibleMatrix:');
disp(invertibleMatrix);
fprintf('Determinant: %.4f\n', determinantValue);
disp('Inverse:');
disp(inverseMatrix);
disp('Matrix * inverse (should be the identity):');
disp(identityCheck);

%% Task 3: Eigenvalues and Eigenvectors
fprintf('\n--- Task 3: Eigenvalues and Eigenvectors ---\n');
eigenMatrix = [4, 1; 2, 3];

[eigenvectors, eigenvalueDiag] = eig(eigenMatrix);   % columns hold the eigenvectors, the diagonal holds the eigenvalues

disp('Matrix eigenMatrix:');
disp(eigenMatrix);
disp('Eigenvectors (one per column):');
disp(eigenvectors);
disp('Eigenvalues (on the diagonal):');
disp(eigenvalueDiag);

%% Task 4: LU Decomposition
fprintf('\n--- Task 4: LU Decomposition ---\n');
factorMatrix = [4, 2; 3, 1];

[lowerFactor, upperFactor] = lu(factorMatrix);   % factorises into a lower and an upper triangular matrix

disp('Matrix factorMatrix:');
disp(factorMatrix);
disp('Lower triangular factor:');
disp(lowerFactor);
disp('Upper triangular factor:');
disp(upperFactor);
disp('lowerFactor * upperFactor (should reproduce factorMatrix):');
disp(lowerFactor * upperFactor);
