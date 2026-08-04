fprintf('--- 17.1: Newton''s Method ---\n');
cubicFunc = @(x) x.^3 + x - 3;
cubicDeriv = @(x) 3*x^2 + 1;
startPoints = [0, 1, 2, -1];   % different starting points

for startGuess = startPoints
    estimate = startGuess;
    for iterCount = 1:50
        nextEstimate = estimate - cubicFunc(estimate)/cubicDeriv(estimate);
        if abs(nextEstimate - estimate) < 1e-8
            estimate = nextEstimate; break;
        end
        estimate = nextEstimate;
    end
    fprintf('x0 = %.1f -> root = %.6f\n', startGuess, estimate);
end

plotGrid = linspace(-3, 3, 500);
figure; plot(plotGrid, cubicFunc(plotGrid), 'b'); hold on;
yline(0, 'k--');
plot(estimate, cubicFunc(estimate), 'ro', 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('f(x)'); title('Newton''s Method Root'); grid on;
