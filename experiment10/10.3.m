%% Task 2: Test factorial for 1 to 10
fprintf('--- Recursive Factorial ---\n');
for testValue = 1:10
    fprintf('%d! = %d\n', testValue, recursiveFactorial(testValue));
end

%% Function (must be at end)
function factValue = recursiveFactorial(inValue)
    if inValue < 0
        error('n must be non-negative.');
    elseif inValue == 0 || inValue == 1
        factValue = 1;
    else
        factValue = inValue * recursiveFactorial(inValue - 1);   % recursive call
    end
end
