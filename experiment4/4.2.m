function [root1, root2] = solveQuadratic(coeffA, coeffB, coeffC)
    % Edge Case: Linear or trivial cases
    if coeffA == 0
        if coeffB == 0
            if coeffC == 0
                disp('Infinite solutions.');
                root1 = NaN; root2 = NaN;
            else
                disp('No solution.');
                root1 = NaN; root2 = NaN;
            end
        else
            disp('Linear equation (a = 0):');
            root1 = -coeffC / coeffB;
            root2 = root1;
        end
        return;
    end

    % Discriminant calculation
    discriminant = coeffB^2 - 4*coeffA*coeffC;

    if discriminant > 0
        root1 = (-coeffB + sqrt(discriminant)) / (2*coeffA);
        root2 = (-coeffB - sqrt(discriminant)) / (2*coeffA);
    elseif discriminant == 0
        root1 = -coeffB / (2*coeffA);
        root2 = root1;
    else
        root1 = (-coeffB + 1i * sqrt(-discriminant)) / (2*coeffA);
        root2 = (-coeffB - 1i * sqrt(-discriminant)) / (2*coeffA);
    end
end

% --- Testing & Evaluation ---
fprintf('--- Testing Quadratic Solver ---\n');

% Test 1: Real and distinct roots
[firstRoot, secondRoot] = solveQuadratic(1, -5, 6);
fprintf('Real Roots: x1 = %.2f, x2 = %.2f\n', firstRoot, secondRoot);

% Test 2: Repeated root
[firstRoot, secondRoot] = solveQuadratic(1, -4, 4);
fprintf('Repeated Root: x = %.2f\n', firstRoot);

% Test 3: Complex roots
[firstRoot, secondRoot] = solveQuadratic(1, 2, 5);
fprintf('Complex Roots: x1 = %.2f + %.2fi, x2 = %.2f - %.2fi\n', real(firstRoot), imag(firstRoot), real(secondRoot), abs(imag(secondRoot)));

% Test 4: Edge Case (a = 0)
[firstRoot, ~] = solveQuadratic(0, 2, -4);
fprintf('Linear Case: x = %.2f\n\n', firstRoot);

