fprintf('\n--- 17.5: Bacteria Growth (Euler) ---\n');
growthRate = 0.8; initialCount = 1000; endTime = 5;
stepSizes = [1, 0.5, 0.1];

figure; hold on;
for currentStep = stepSizes
    timeGrid = 0:currentStep:endTime;
    bacteriaCount = zeros(size(timeGrid));
    bacteriaCount(1) = initialCount;
    for stepIdx = 1:length(timeGrid)-1
        bacteriaCount(stepIdx+1) = bacteriaCount(stepIdx) + currentStep * growthRate * bacteriaCount(stepIdx);
    end
    plot(timeGrid, bacteriaCount, '-o', 'DisplayName', ['h = ', num2str(currentStep)]);
end

exactTime = 0:0.01:endTime;
exactCount = initialCount * exp(growthRate*exactTime);
plot(exactTime, exactCount, 'k--', 'DisplayName', 'Exact solution');

xlabel('Time'); ylabel('N(t)');
title('Bacteria Growth: Euler vs Exact');
legend('show', 'Location', 'best');
grid on;
hold off;
