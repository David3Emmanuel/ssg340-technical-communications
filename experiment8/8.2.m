%% Task 1-4: Binomial Coefficient using For Loop (simplified formula)
fprintf('--- Binomial Coefficient: Simplified Formula (for loop) ---\n');
topValue = input('Enter value of n (0 to 170): ');
chooseValue = input('Enter value of r (0 to n): ');

tic;
loopResult = 1;
for termIdx = 0:(chooseValue-1)
    loopResult = loopResult * (topValue - termIdx);
end
loopResult = loopResult / factorial(chooseValue);
loopElapsed = toc;

fprintf('C(%d, %d) = %d\n', topValue, chooseValue, loopResult);
fprintf('Time taken (simplified formula): %.8f seconds\n', loopElapsed);

%% Task 5: Compare with Factorial-based Approach
fprintf('\n--- Comparison: Factorial-based Formula ---\n');
tic;
factorialResult = factorial(topValue) / (factorial(chooseValue) * factorial(topValue - chooseValue));
factorialElapsed = toc;

fprintf('C(%d, %d) = %d\n', topValue, chooseValue, factorialResult);
fprintf('Time taken (factorial-based): %.8f seconds\n', factorialElapsed);

fprintf('\nNote: factorial(n) grows very fast and overflows/loses precision for large n\n');
fprintf('(e.g. factorial(171) already exceeds double precision limits),\n');
fprintf('while the simplified formula avoids computing huge factorials directly,\n');
fprintf('making it more efficient and numerically stable for large n.\n');
