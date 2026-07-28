function X = solve_linear_system(A, B)
    rank_A = rank(A);
    rank_AB = rank([A, B]);
    num_vars = size(A, 2);
    
    if rank_A == rank_AB
        if rank_A == num_vars
            disp('Result: Unique solution');
            X = A \ B;
        else
            disp('Result: Infinite solutions');
            X = [];
        end
    else
        disp('Result: No solution');
        X = [];
    end
end

% --- Testing the specific cases ---

% Case 1: 1,1,5, 1,-1,1 -> unique solution
% x + y = 5
% x - y = 1
A1 = [1, 1; 1, -1];
B1 = [5; 1];
fprintf('\nCase 1 (1,1,5 | 1,-1,1):\n');
X1 = solve_linear_system(A1, B1);
if ~isempty(X1)
    fprintf('x = %.2f, y = %.2f\n', X1(1), X1(2));
end

% Case 2: 1,1,5, 2,2,10 -> infinite solutions
% x + y = 5
% 2x + 2y = 10
A2 = [1, 1; 2, 2];
B2 = [5; 10];
fprintf('\nCase 2 (1,1,5 | 2,2,10):\n');
solve_linear_system(A2, B2);

% Case 3: 1,1,5, 1,1,3 -> no solution
% x + y = 5
% x + y = 3
A3 = [1, 1; 1, 1];
B3 = [5; 3];
fprintf('\nCase 3 (1,1,5 | 1,1,3):\n');
solve_linear_system(A3, B3);