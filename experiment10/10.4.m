%% Task 1-3: Debug the recursive factorial with trace printing
fprintf('--- Debugging Factorial Recursion ---\n');
testValue = 5;
factResult = tracedFactorial(testValue);
fprintf('Final result: %d! = %d\n', testValue, factResult);

% To debug interactively:
% 1. Open this file, click left of a line number inside tracedFactorial to set a breakpoint
%    (or run: dbstop in yourfilename at 'fprintf' )
% 2. Run the script, use F10 (step), F11 (step in), F5 (continue) to walk through
% 3. Inspect 'inValue' in the Workspace panel at each paused call

function factValue = tracedFactorial(inValue)
    fprintf('Entering tracedFactorial with n = %d\n', inValue);   % trace execution flow
    if inValue < 0
        error('n must be non-negative.');
    elseif inValue == 0 || inValue == 1
        factValue = 1;
    else
        factValue = inValue * tracedFactorial(inValue - 1);
    end
    fprintf('Returning from tracedFactorial: n = %d, result = %d\n', inValue, factValue);
end
