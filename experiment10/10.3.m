%% Task 2: Test factorial for 1 to 10
fprintf('--- Recursive Factorial ---\n');
for n = 1:10
    fprintf('%d! = %d\n', n, fact(n));
end

%% Function (must be at end)
function result = fact(n)
    if n < 0
        error('n must be non-negative.');
    elseif n == 0 || n == 1
        result = 1;
    else
        result = n * fact(n - 1);   % recursive call
    end
end