%% Task 1-3: Approximate Standard Normal CDF
fprintf('--- Normal CDF Approximation vs normcdf ---\n');

xVals = 0:0.1:4;

for i = 1:length(xVals)
    x = xVals(i);
    approx = normCDFApprox(x);
    actual = normcdf(x);
    fprintf('x=%.1f | Approx = %.6f | normcdf = %.6f | diff = %.2e\n', ...
        x, approx, actual, abs(approx - actual));
end

%% Function
function phi = normCDFApprox(x)
    % Zelen & Severo approximation
    b0 = 0.2316419;
    a1 = 0.319381530; a2 = -0.356563782; a3 = 1.781477937;
    a4 = -1.821255978; a5 = 1.330274429;

    t = 1 / (1 + b0*x);
    pdf = (1/sqrt(2*pi)) * exp(-x^2/2);
    poly = a1*t + a2*t^2 + a3*t^3 + a4*t^4 + a5*t^5;

    phi = 1 - pdf * poly;
end