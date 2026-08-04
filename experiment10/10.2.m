%% Task 2 & 3: Newton's Method for x^3 + x - 3 = 0
startGuess = 1;          % initial guess
tolerance = 1e-8;
maxIter = 100;

estimate = startGuess;
fprintf('--- Newton''s Method ---\n');
for iterCount = 1:maxIter
    funcValue = cubicFunc(estimate);
    derivValue = cubicDeriv(estimate);
    nextEstimate = estimate - funcValue/derivValue;
    stepError = abs(nextEstimate - estimate);
    fprintf('Iter %d: x = %.8f, error = %.2e\n', iterCount, nextEstimate, stepError);
    if stepError < tolerance
        estimate = nextEstimate;
        break;
    end
    estimate = nextEstimate;
end
fprintf('Root found: x = %.8f after %d iterations\n', estimate, iterCount);

%% Functions (M-file style, kept local here)
function outValue = cubicFunc(inValue)
    outValue = inValue^3 + inValue - 3;
end

function outValue = cubicDeriv(inValue)
    outValue = 3*inValue^2 + 1;
end
