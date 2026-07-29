%% Task 1-3: Debug the recursive factorial with trace printing
fprintf('--- Debugging Factorial Recursion ---\n');
n = 5;
result = factDebug(n);
fprintf('Final result: %d! = %d\n', n, result);

% To debug interactively:
% 1. Open this file, click left of a line number inside factDebug to set a breakpoint
%    (or run: dbstop in yourfilename at 'fprintf' )
% 2. Run the script, use F10 (step), F11 (step in), F5 (continue) to walk through
% 3. Inspect 'n' in the Workspace panel at each paused call

function result = factDebug(n)
    fprintf('Entering factDebug with n = %d\n', n);   % trace execution flow
    if n < 0
        error('n must be non-negative.');
    elseif n == 0 || n == 1
        result = 1;
    else
        result = n * factDebug(n - 1);
    end
    fprintf('Returning from factDebug: n = %d, result = %d\n', n, result);
end