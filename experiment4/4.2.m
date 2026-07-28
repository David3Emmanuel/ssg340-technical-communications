function [x1, x2] = solve_quadratic(a, b, c)
    % Edge Case: Linear or trivial cases
    if a == 0
        if b == 0
            if c == 0
                disp('Infinite solutions.');
                x1 = NaN; x2 = NaN;
            else
                disp('No solution.');
                x1 = NaN; x2 = NaN;
            end
        else
            disp('Linear equation (a = 0):');
            x1 = -c / b;
            x2 = x1;
        end
        return;
    end
    
    % Discriminant calculation
    D = b^2 - 4*a*c;
    
    if D > 0
        x1 = (-b + sqrt(D)) / (2*a);
        x2 = (-b - sqrt(D)) / (2*a);
    elseif D == 0
        x1 = -b / (2*a);
        x2 = x1;
    else
        x1 = (-b + 1i * sqrt(-D)) / (2*a);
        x2 = (-b - 1i * sqrt(-D)) / (2*a);
    end
end

% --- Testing & Evaluation ---
fprintf('--- Testing Quadratic Solver ---\n');

% Test 1: Real and distinct roots
[r1, r2] = solve_quadratic(1, -5, 6);
fprintf('Real Roots: x1 = %.2f, x2 = %.2f\n', r1, r2);

% Test 2: Repeated root
[r1, r2] = solve_quadratic(1, -4, 4);
fprintf('Repeated Root: x = %.2f\n', r1);

% Test 3: Complex roots
[r1, r2] = solve_quadratic(1, 2, 5);
fprintf('Complex Roots: x1 = %.2f + %.2fi, x2 = %.2f - %.2fi\n', real(r1), imag(r1), real(r2), abs(imag(r2)));

% Test 4: Edge Case (a = 0)
[r1, ~] = solve_quadratic(0, 2, -4);
fprintf('Linear Case: x = %.2f\n\n', r1);

