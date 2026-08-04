%% Task 1-3: Generalized Newton's Method (generalNewton) with function handles
fprintf('--- Generalized Newton (generalNewton) ---\n');

cubicFunc  = @(x) x^3 + x - 3;
cubicDeriv = @(x) 3*x^2 + 1;
cubicRoot = generalNewton(cubicFunc, cubicDeriv, 1, 1e-8, 100);
fprintf('Root of x^3+x-3: x = %.8f\n', cubicRoot);

squareFunc  = @(x) x^2 - 2;
squareDeriv = @(x) 2*x;
squareRoot = generalNewton(squareFunc, squareDeriv, 1, 1e-8, 100);
fprintf('Root of x^2-2 (sqrt(2)): x = %.8f\n', squareRoot);

%% Function (generalized Newton's method)
function estimate = generalNewton(func, funcDeriv, startGuess, tolerance, maxIter)
    estimate = startGuess;
    for iterCount = 1:maxIter
        nextEstimate = estimate - func(estimate)/funcDeriv(estimate);
        if abs(nextEstimate - estimate) < tolerance
            estimate = nextEstimate;
            return;
        end
        estimate = nextEstimate;
    end
end
