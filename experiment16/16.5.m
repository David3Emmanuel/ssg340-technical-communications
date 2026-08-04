
%% 16.5 Experiment 5: Gauss Elimination and Linear Systems
fprintf('\n--- 16.5 Experiment 5: Gauss Elimination ---\n');

% Test Matrix
testMatrix = [4, -2, 1; -2, 4, -2; 1, -2, 4];
testRhs = [11; -16; 17];

% Task 1 & 6: Execute Custom Gauss Elimination (Function defined below)
customSolution = gaussEliminationPivot(testMatrix, testRhs);
fprintf('Solution using Custom Gauss Elimination (with pivoting):\n');
disp(customSolution);

% Task 3: Compare with MATLAB's built-in left division
builtinSolution = testMatrix \ testRhs;
fprintf('Solution using MATLAB built-in (\\):\n');
disp(builtinSolution);

% --- Helper Function for Task 1 & 6 ---
% Note: MATLAB requires local functions to be at the end of the script
function solution = gaussEliminationPivot(coeffMatrix, rhsVector)
    % Implements Gauss Elimination with Partial Pivoting
    [numRows, numCols] = size(coeffMatrix);
    if numRows ~= numCols
        error('Coefficient matrix must be square');
    end

    % Augmented matrix
    augmented = [coeffMatrix, rhsVector];

    % Forward Elimination with Partial Pivoting
    for pivotIdx = 1:numRows-1
        % Task 6: Partial Pivoting
        [~, relativeMaxIdx] = max(abs(augmented(pivotIdx:numRows, pivotIdx)));
        absoluteMaxIdx = relativeMaxIdx + pivotIdx - 1;
        if absoluteMaxIdx ~= pivotIdx
            % Swap rows
            swapHolder = augmented(pivotIdx, :);
            augmented(pivotIdx, :) = augmented(absoluteMaxIdx, :);
            augmented(absoluteMaxIdx, :) = swapHolder;
        end

        % Elimination
        for rowIdx = pivotIdx+1:numRows
            multiplier = augmented(rowIdx, pivotIdx) / augmented(pivotIdx, pivotIdx);
            augmented(rowIdx, pivotIdx:numRows+1) = augmented(rowIdx, pivotIdx:numRows+1) - multiplier * augmented(pivotIdx, pivotIdx:numRows+1);
        end
    end

    % Back Substitution
    solution = zeros(numRows, 1);
    solution(numRows) = augmented(numRows, numRows+1) / augmented(numRows, numRows);
    for rowIdx = numRows-1:-1:1
        solution(rowIdx) = (augmented(rowIdx, numRows+1) - augmented(rowIdx, rowIdx+1:numRows) * solution(rowIdx+1:numRows)) / augmented(rowIdx, rowIdx);
    end
end
