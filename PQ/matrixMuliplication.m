function C = matrixMultiplyLoop(A, B)
% MATRIXMULTIPLYLOOP  Multiply two matrices using explicit loops
%                      (no built-in * operator).
%
%   C = matrixMultiplyLoop(A, B)
%
%   A must be (m x n), B must be (n x p). Result C is (m x p).

    [m, n]  = size(A);
    [n2, p] = size(B);

    if n ~= n2
        error('Inner matrix dimensions must agree (columns of A must equal rows of B).');
    end

    C = zeros(m, p);

    for i = 1:m
        for j = 1:p
            s = 0;
            for k = 1:n
                s = s + A(i,k) * B(k,j);
            end
            C(i,j) = s;
        end
    end
end

%% ---- Quick test (run separately, or paste into command window) ----
% A = [1 2; 3 4];
% B = [5 6; 7 8];
% C = matrixMultiplyLoop(A, B)
% isequal(C, A*B)   % should return 1 (true)