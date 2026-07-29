
%% 16.3 Experiment 3: Solving Linear Equations Using MATLAB
fprintf('\n--- 16.3 Experiment 3: Solving Linear Equations ---\n');

% Task 1 & 2: Solve system Ax = b using left division
A = [3, 2, -1; 2, -2, 4; -1, 0.5, -1];
b = [1; -2; 0];
x_sol = A \ b;
fprintf('Solution to Ax = b:\n');
disp(x_sol);

% Task 3 & 4: Compute residual r = A*x - b
r = A * x_sol - b;
fprintf('Residual (r = A*x - b):\n');
disp(r);
fprintf('A residual close to zero indicates a highly accurate solution.\n');

% Task 5: Overdetermined and Underdetermined systems
A_over = [1, 2; 3, 4; 5, 6]; 
b_over = [1; 2; 3];
x_over = A_over \ b_over; % Least-squares solution
fprintf('\nOverdetermined Least-Squares Solution:\n');
disp(x_over);

A_under = [1, 2, 3; 4, 5, 6];
b_under = [1; 2];
x_under = A_under \ b_under;
fprintf('Underdetermined Solution (One of infinitely many):\n');
disp(x_under);

% Task 6: Investigate ill-conditioned systems using rcond
A_ill = [1, 1; 1, 1.0001];
rcond_val = rcond(A_ill);
fprintf('\nReciprocal condition number (rcond) of ill-conditioned matrix: %e\n', rcond_val);