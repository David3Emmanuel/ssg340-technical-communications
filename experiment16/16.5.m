
%% 16.5 Experiment 5: Gauss Elimination and Linear Systems
fprintf('\n--- 16.5 Experiment 5: Gauss Elimination ---\n');

% Test Matrix
A_gauss = [4, -2, 1; -2, 4, -2; 1, -2, 4];
b_gauss = [11; -16; 17];

% Task 1 & 6: Execute Custom Gauss Elimination (Function defined below)
x_custom = gauss_elimination_pivot(A_gauss, b_gauss);
fprintf('Solution using Custom Gauss Elimination (with pivoting):\n');
disp(x_custom);

% Task 3: Compare with MATLAB's built-in left division
x_builtin = A_gauss \ b_gauss;
fprintf('Solution using MATLAB built-in (\\):\n');
disp(x_builtin);

% --- Helper Function for Task 1 & 6 ---
% Note: MATLAB requires local functions to be at the end of the script
function x = gauss_elimination_pivot(A, b)
    % Implements Gauss Elimination with Partial Pivoting
    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square');
    end
    
    % Augmented matrix
    Aug = [A, b];
    
    % Forward Elimination with Partial Pivoting
    for k = 1:n-1
        % Task 6: Partial Pivoting
        [~, max_idx] = max(abs(Aug(k:n, k)));
        max_idx = max_idx + k - 1;
        if max_idx ~= k
            % Swap rows
            temp = Aug(k, :);
            Aug(k, :) = Aug(max_idx, :);
            Aug(max_idx, :) = temp;
        end
        
        % Elimination
        for i = k+1:n
            factor = Aug(i, k) / Aug(k, k);
            Aug(i, k:n+1) = Aug(i, k:n+1) - factor * Aug(k, k:n+1);
        end
    end
    
    % Back Substitution
    x = zeros(n, 1);
    x(n) = Aug(n, n+1) / Aug(n, n);
    for i = n-1:-1:1
        x(i) = (Aug(i, n+1) - Aug(i, i+1:n) * x(i+1:n)) / Aug(i, i);
    end
end