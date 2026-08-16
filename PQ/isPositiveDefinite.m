function tf = isPositiveDefinite(A)
% ISPOSITIVEDEFINITE  Check whether a square matrix A is positive definite.
%
%   tf = isPositiveDefinite(A)   returns true/false
%
%   Method: A symmetric matrix is positive definite iff a Cholesky
%   factorization exists (chol() succeeds without error / with p == 0).
%   This is the standard, exam-friendly way to test it in MATLAB.

    [rows, cols] = size(A);
    if rows ~= cols
        error('Input matrix must be square.');
    end

    % Positive definite matrices must be symmetric (real case).
    % Some examiners accept checking symmetry; others only care about chol().
    if ~isequal(A, A')
        tf = false;
        return;
    end

    [~, p] = chol(A);   % p == 0 means Cholesky succeeded -> positive definite
    tf = (p == 0);
end

%% ---- Alternative method: check all eigenvalues > 0 ----
% function tf = isPositiveDefiniteEig(A)
%     if ~isequal(A, A')
%         tf = false;
%         return;
%     end
%     tf = all(eig(A) > 0);
% end

%% ---- Quick tests ----
% isPositiveDefinite([2 -1; -1 2])   % expect true
% isPositiveDefinite([1 2; 2 1])     % expect false (eigenvalues -1 and 3)
