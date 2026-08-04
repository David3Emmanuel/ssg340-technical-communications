function solution = solveLinearSystem(coeffMatrix, rhsVector)
    rankCoeff = rank(coeffMatrix);
    rankAugmented = rank([coeffMatrix, rhsVector]);
    numUnknowns = size(coeffMatrix, 2);

    if rankCoeff == rankAugmented
        if rankCoeff == numUnknowns
            disp('Result: Unique solution');
            solution = coeffMatrix \ rhsVector;
        else
            disp('Result: Infinite solutions');
            solution = [];
        end
    else
        disp('Result: No solution');
        solution = [];
    end
end

% --- Testing the specific cases ---

% Case 1: 1,1,5, 1,-1,1 -> unique solution
% x + y = 5
% x - y = 1
caseOneMatrix = [1, 1; 1, -1];
caseOneRhs = [5; 1];
fprintf('\nCase 1 (1,1,5 | 1,-1,1):\n');
caseOneSolution = solveLinearSystem(caseOneMatrix, caseOneRhs);
if ~isempty(caseOneSolution)
    fprintf('x = %.2f, y = %.2f\n', caseOneSolution(1), caseOneSolution(2));
end

% Case 2: 1,1,5, 2,2,10 -> infinite solutions
% x + y = 5
% 2x + 2y = 10
caseTwoMatrix = [1, 1; 2, 2];
caseTwoRhs = [5; 10];
fprintf('\nCase 2 (1,1,5 | 2,2,10):\n');
solveLinearSystem(caseTwoMatrix, caseTwoRhs);

% Case 3: 1,1,5, 1,1,3 -> no solution
% x + y = 5
% x + y = 3
caseThreeMatrix = [1, 1; 1, 1];
caseThreeRhs = [5; 3];
fprintf('\nCase 3 (1,1,5 | 1,1,3):\n');
solveLinearSystem(caseThreeMatrix, caseThreeRhs);
