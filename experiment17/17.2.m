fprintf('\n--- 17.2: Bisection Method ---\n');
cubicFunc = @(x) x.^3 + x - 3;
lowerBound = 0; upperBound = 2;   % initial interval where f(a)*f(b) < 0
tolerance = 0.05;
iterCount = 0;

while (upperBound - lowerBound)/2 > tolerance
    midPoint = (lowerBound + upperBound)/2;
    if cubicFunc(lowerBound)*cubicFunc(midPoint) < 0
        upperBound = midPoint;
    else
        lowerBound = midPoint;
    end
    iterCount = iterCount + 1;
end
rootEstimate = (lowerBound+upperBound)/2;
fprintf('Root = %.6f found in %d bisections\n', rootEstimate, iterCount);

plotGrid = linspace(-1, 3, 500);
figure; plot(plotGrid, cubicFunc(plotGrid), 'b'); hold on;
yline(0, 'k--');
plot(rootEstimate, cubicFunc(rootEstimate), 'ro', 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('f(x)'); title('Bisection Method Root'); grid on;
