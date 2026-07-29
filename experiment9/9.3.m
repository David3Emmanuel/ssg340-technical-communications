%% 9.3 Experiment 3: Error Trapping and Handling in MATLAB
fprintf('--- 9.3 Experiment 3: Error Trapping and Handling ---\n\n');

%% Task 1: Implementing Try-Catch Blocks
fprintf('--- Task 1: Division with Try-Catch Block ---\n');

% Testing with valid inputs
fprintf('Test 1 (Valid): 10 / 2\n');
num1_valid = 10;
num2_valid = 2;
try
    result_valid = num1_valid / num2_valid;
    fprintf('Result: %f\n', result_valid);
catch ME
    disp('Error occurred during valid division!')
    disp(ME.message)
end

% Testing with invalid inputs (Division by zero)
fprintf('\nTest 2 (Invalid): 10 / 0\n');
num1 = 10;
num2 = 0;
try
    % MATLAB natively returns 'Inf' for 10/0 instead of throwing a strict error.
    % We manually throw the error to demonstrate the catch block as required by the manual.
    if num2 == 0
        error('MATLAB:divideByZero', 'Division by zero is not allowed.');
    end
    result = num1 / num2; 
catch ME
    disp('Error occurred: Division by zero!')
    disp(ME.message)
end


%% Task 2: Using 'error' Function for Custom Messages
fprintf('\n--- Task 2: Quadratic Solver with Error Handling ---\n');

% Valid Test Case
fprintf('Testing with valid quadratic coefficients (a=1, b=-3, c=2):\n');
a_valid = 1; b_valid = -3; c_valid = 2;
if a_valid == 0
    error('This is not a quadratic equation!')
else
    discriminant = b_valid^2 - 4*a_valid*c_valid;
    root1 = (-b_valid + sqrt(discriminant)) / (2*a_valid);
    root2 = (-b_valid - sqrt(discriminant)) / (2*a_valid);
    disp(['Root 1: ', num2str(root1)])
    disp(['Root 2: ', num2str(root2)])
end

% Invalid Test Case (Wrapped in try-catch here so it doesn't crash the whole script)
fprintf('\nTesting with invalid quadratic coefficients (a=0, b=-1, c=2):\n');
a = 0; b = -1; c = 2;
try
    if a == 0
        error('This is not a quadratic equation!') % This triggers the custom error
    else
        discriminant = b^2 - 4*a*c;
        root1 = (-b + sqrt(discriminant)) / (2*a);
        root2 = (-b - sqrt(discriminant)) / (2*a);
        disp(['Root 1: ', num2str(root1)])
        disp(['Root 2: ', num2str(root2)])
    end
catch ME
    disp(['Custom Error Successfully Caught: ', ME.message]);
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
x = 5;
y = 'hello';

% FIX 1: Convert numeric 'x' to string using num2str() before concatenating
z = [num2str(x), ' ', y];
fprintf('Corrected String Concatenation (z): %s\n', z);

% FIX 2: Provide a valid numeric argument to the sin() function
a_val = sin(pi/2);
fprintf('Corrected sin() function (a_val): %f\n', a_val);

b_mat = [1, 2; 3, 4];

% FIX 3: Ensure matrices have matching dimensions for addition. 
% We replace the 1x3 vector [1, 2, 3] with a 2x2 matrix to match 'b_mat'.
c_mat = b_mat + [10, 20; 30, 40];
disp('Corrected Matrix Addition (c_mat):');
disp(c_mat);

disp('End of script (Executed Successfully without crashing)')