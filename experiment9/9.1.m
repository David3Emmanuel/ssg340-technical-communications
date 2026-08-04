fprintf('--- 9.1 Experiment 1: Debugging Syntax Errors and Pitfalls in MATLAB ---\n\n');

%% Task 1: Syntax Errors and Debugging
fprintf('--- Task 1: Corrected Syntax Errors ---\n');
% Listing 9.1: Corrected Script
firstOperand = 5;
secondOperand = 3;
% FIX: Added the missing closing parenthesis for (y + 2)
result = firstOperand * (secondOperand + 2);

% FIX: Added the missing closing parenthesis for the disp() function
disp(['The result is ', num2str(result)]);
fprintf('\n');


%% Task 2: Identifying Logical Errors
fprintf('--- Task 2: Newton Quotient and Logical Errors ---\n');
% Define the function f(x) = x^2 using an anonymous function
squareFunc = @(x) x^2;
evalPoint = 2;

% The exact theoretical derivative of x^2 at x=2 is 2*x = 4.
fprintf('Theoretical exact derivative at x = 2 is 4.\n\n');

% Testing for several values of h to identify discrepancies (rounding errors)
stepSizes = [1, 0.1, 0.01, 1e-8, 1e-12, 1e-16];

fprintf('Testing Newton Quotient for f(x) = x^2 at x = 2:\n');
fprintf('h value      | Calculated Derivative\n');
fprintf('------------------------------------\n');

for stepIdx = 1:length(stepSizes)
    currentStep = stepSizes(stepIdx);
    % Newton quotient formula
    derivative = (squareFunc(evalPoint + currentStep) - squareFunc(evalPoint)) / currentStep;
    fprintf('%1.2e     | %f\n', currentStep, derivative);
end
fprintf('\nLogical Error Note: As h gets extremely small (e.g., 1e-16), floating-point precision limits cause catastrophic cancellation, making the result wildly inaccurate rather than converging to 4.\n\n');


%% Task 3: Pitfalls with Vector Sizes
fprintf('--- Task 3: Corrected Mismatched Vector Sizes ---\n');

% Listing 9.3: Corrected vector sizes
angleGrid = 0:pi/20:3*pi;
sineGrid = sin(angleGrid);

% The manual previously redefined x with a different step size (pi/40), causing a mismatch.
% FIX: We comment out the redefinition so x and y remain the exact same length.
% angleGrid = 0:pi/40:3*pi; % Redefine x with different length (COMMENTED OUT TO FIX ERROR)

% Create a plot to verify the fix works successfully
figure('Name', 'Task 3: Corrected Vector Plot');
plot(angleGrid, sineGrid, 'b-', 'LineWidth', 2);
title('Plot of y = sin(x) with matching vector sizes');
xlabel('x');
ylabel('y');
grid on;

fprintf('Task 3 plot generated successfully. The vector size mismatch was corrected by ensuring the x array was not improperly redefined before plotting.\n');
