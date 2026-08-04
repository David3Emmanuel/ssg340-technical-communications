%% 9.3 Experiment 3: Error Trapping and Handling in MATLAB
fprintf('--- 9.3 Experiment 3: Error Trapping and Handling ---\n\n');

%% Task 1: Implementing Try-Catch Blocks
fprintf('--- Task 1: Division with Try-Catch Block ---\n');

% Testing with valid inputs
fprintf('Test 1 (Valid): 10 / 2\n');
validNumerator = 10;
validDenominator = 2;
try
    validQuotient = validNumerator / validDenominator;
    fprintf('Result: %f\n', validQuotient);
catch err
    disp('Error occurred during valid division!')
    disp(err.message)
end

% Testing with invalid inputs (Division by zero)
fprintf('\nTest 2 (Invalid): 10 / 0\n');
testNumerator = 10;
testDenominator = 0;
try
    % MATLAB natively returns 'Inf' for 10/0 instead of throwing a strict error.
    % We manually throw the error to demonstrate the catch block as required by the manual.
    if testDenominator == 0
        error('MATLAB:divideByZero', 'Division by zero is not allowed.');
    end
    testQuotient = testNumerator / testDenominator;
catch err
    disp('Error occurred: Division by zero!')
    disp(err.message)
end


%% Task 2: Using 'error' Function for Custom Messages
fprintf('\n--- Task 2: Quadratic Solver with Error Handling ---\n');

% Valid Test Case
fprintf('Testing with valid quadratic coefficients (a=1, b=-3, c=2):\n');
validA = 1; validB = -3; validC = 2;
if validA == 0
    error('This is not a quadratic equation!')
else
    validDiscriminant = validB^2 - 4*validA*validC;
    validRoot1 = (-validB + sqrt(validDiscriminant)) / (2*validA);
    validRoot2 = (-validB - sqrt(validDiscriminant)) / (2*validA);
    disp(['Root 1: ', num2str(validRoot1)])
    disp(['Root 2: ', num2str(validRoot2)])
end

% Invalid Test Case (Wrapped in try-catch here so it doesn't crash the whole script)
fprintf('\nTesting with invalid quadratic coefficients (a=0, b=-1, c=2):\n');
badA = 0; badB = -1; badC = 2;
try
    if badA == 0
        error('This is not a quadratic equation!') % This triggers the custom error
    else
        badDiscriminant = badB^2 - 4*badA*badC;
        badRoot1 = (-badB + sqrt(badDiscriminant)) / (2*badA);
        badRoot2 = (-badB - sqrt(badDiscriminant)) / (2*badA);
        disp(['Root 1: ', num2str(badRoot1)])
        disp(['Root 2: ', num2str(badRoot2)])
    end
catch err
    disp(['Custom Error Successfully Caught: ', err.message]);
end


%% Task 3: Analyzing MATLAB's Error Messages
fprintf('\n--- Task 3: Correcting Multiple Errors from Listing 9.8 ---\n');

% ---------------------------------------------------------
% ORIGINAL SCRIPT (Commented out to prevent crashing)
% ---------------------------------------------------------
% % Script generating multiple common errors
% x = 5;
% y = 'hello';
% z = x + y; % Incompatible types (numeric + string)
%
% a = sin(); % Missing argument in sin function
% b = [1, 2; 3, 4];
% c = b + [1, 2, 3]; % Mismatched matrix dimensions
%
% disp('End of script')

% ---------------------------------------------------------
% CORRECTED SCRIPT
% ---------------------------------------------------------
numericPart = 5;
textPart = 'hello';

% FIX 1: Convert the numeric value to a string using num2str() before concatenating
joinedText = [num2str(numericPart), ' ', textPart];
fprintf('Corrected String Concatenation (joinedText): %s\n', joinedText);

% FIX 2: Provide a valid numeric argument to the sin() function
sineResult = sin(pi/2);
fprintf('Corrected sin() function (sineResult): %f\n', sineResult);

baseMatrix = [1, 2; 3, 4];

% FIX 3: Ensure matrices have matching dimensions for addition.
% We replace the 1x3 vector [1, 2, 3] with a 2x2 matrix to match 'baseMatrix'.
sumMatrix = baseMatrix + [10, 20; 30, 40];
disp('Corrected Matrix Addition (sumMatrix):');
disp(sumMatrix);

disp('End of script (Executed Successfully without crashing)')
