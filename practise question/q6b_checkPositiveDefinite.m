function [isPD, msg] = checkPositiveDefinite(A)
[r,c] = size(A);
if r ~= c
    isPD = false;
    msg = 'Matrix is not square.';
    return;
end
if ~isequal(A, A')
    isPD = false;
    msg = 'Matrix is not symmetric.';
    return;
end
[~, p] = chol(A);
if p == 0
    isPD = true;
    msg = 'Matrix is symmetric positive definite.';
else
    isPD = false;
    msg = 'Matrix is not positive definite.';
end
end
