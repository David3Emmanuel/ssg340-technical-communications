%% Task 1: Creating and Accessing Multidimensional Arrays
fprintf('--- Task 1: 3D Matrix Creation and Access ---\n');
A2D = [1 2; 3 4; 5 6];        % base 2D matrix
A = cat(3, A2D, A2D*2);       % add a third dimension (2 layers)

disp('3D matrix A:');
disp(A);

fprintf('Element A(2,1,1) = %d\n', A(2,1,1));
fprintf('Element A(2,1,2) = %d\n', A(2,1,2));
disp('Slice A(:,:,2):');
disp(A(:,:,2));

%% Task 2: Matrix Reshaping
fprintf('\n--- Task 2: Matrix Reshaping ---\n');
B = [1:6];
B = reshape(B, 2, 3);      % reshape into 2x3
disp('Reshaped matrix B:');
disp(B);

Bsum = B + 10;              % simple operation on reshaped matrix
disp('B + 10:');
disp(Bsum);

%% Task 3: Using Special Matrices
fprintf('\n--- Task 3: Special Matrices (eye) ---\n');
I = eye(3);
disp('Identity matrix I:');
disp(I);

C = B(:,1:2) * I(1:2,1:2);   % fixed: dimensions now match (2x2 * 2x2)
disp('B(:,1:2) * I(1:2,1:2):');
disp(C);

%% Task 4: Tiling and Replication
fprintf('\n--- Task 4: Pascal Matrix and repmat ---\n');
P = pascal(5);
disp('Pascal matrix P:');
disp(P);

rowVec = [1 2 3];
Tiled = repmat(rowVec, 4, 1);   % replicate row vector 4 times
disp('Tiled matrix (row vector repeated 4x):');
disp(Tiled);

PdoubleTiled = repmat(P, 1, 2); % tile Pascal matrix side by side
disp('Pascal matrix tiled twice horizontally:');
disp(PdoubleTiled);