function classification = matrixDefiniteness(A)
[r,c] = size(A);
if r ~= c
    classification = 'Matrix is not square.';
    return;
end
if ~isequal(A, A')
    classification = 'Matrix is not symmetric.';
    return;
end
e = eig(A);
if all(e > 0)
    classification = 'Positive Definite';
elseif all(e >= 0)
    classification = 'Positive Semidefinite';
elseif all(e < 0)
    classification = 'Negative Definite';
elseif all(e <= 0)
    classification = 'Negative Semidefinite';
else
    classification = 'Indefinite';
end
end
