%% Task 1-3: Approximate Standard Normal CDF
fprintf('--- Normal CDF Approximation vs normcdf ---\n');

testPoints = 0:0.1:4;

for pointIdx = 1:length(testPoints)
    currentPoint = testPoints(pointIdx);
    approxValue = normCDFApprox(currentPoint);
    builtinValue = normcdf(currentPoint);
    fprintf('x=%.1f | Approx = %.6f | normcdf = %.6f | diff = %.2e\n', ...
        currentPoint, approxValue, builtinValue, abs(approxValue - builtinValue));
end

%% Function
function cdfValue = normCDFApprox(inValue)
    % Zelen & Severo approximation
    scaleB = 0.2316419;
    coeff1 = 0.319381530; coeff2 = -0.356563782; coeff3 = 1.781477937;
    coeff4 = -1.821255978; coeff5 = 1.330274429;

    tTerm = 1 / (1 + scaleB*inValue);
    densityValue = (1/sqrt(2*pi)) * exp(-inValue^2/2);
    polyTerm = coeff1*tTerm + coeff2*tTerm^2 + coeff3*tTerm^3 + coeff4*tTerm^4 + coeff5*tTerm^5;

    cdfValue = 1 - densityValue * polyTerm;
end
