%% Task 1-4: Binomial Coefficient using For Loop (simplified formula)
fprintf('--- Binomial Coefficient: Simplified Formula (for loop) ---\n');
n = input('Enter value of n (0 to 170): ');
r = input('Enter value of r (0 to n): ');

tic;
C_simplified = 1;
for k = 0:(r-1)
    C_simplified = C_simplified * (n - k);
end
C_simplified = C_simplified / factorial(r);
time_simplified = toc;

fprintf('C(%d, %d) = %d\n', n, r, C_simplified);
fprintf('Time taken (simplified formula): %.8f seconds\n', time_simplified);

%% Task 5: Compare with Factorial-based Approach
fprintf('\n--- Comparison: Factorial-based Formula ---\n');
tic;
C_factorial = factorial(n) / (factorial(r) * factorial(n - r));
time_factorial = toc;

fprintf('C(%d, %d) = %d\n', n, r, C_factorial);
fprintf('Time taken (factorial-based): %.8f seconds\n', time_factorial);

fprintf('\nNote: factorial(n) grows very fast and overflows/loses precision for large n\n');
fprintf('(e.g. factorial(171) already exceeds double precision limits),\n');
fprintf('while the simplified formula avoids computing huge factorials directly,\n');
fprintf('making it more efficient and numerically stable for large n.\n');