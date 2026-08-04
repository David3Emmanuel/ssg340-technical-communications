fprintf('\n--- 17.4: Euler''s Method Population Growth ---\n');
growthRate = 0.5;   % growth rate (not specified exactly, using typical value)
initialPop = 1000;
endTime = 5;
stepSizes = [2, 1, 0.5];

figure; hold on;
for currentStep = stepSizes
    timeGrid = 0:currentStep:endTime;
    population = zeros(size(timeGrid));
    population(1) = initialPop;
    for stepIdx = 1:length(timeGrid)-1
        population(stepIdx+1) = population(stepIdx) + currentStep * growthRate * population(stepIdx);
    end
    plot(timeGrid, population, '-o', 'DisplayName', ['h = ', num2str(currentStep)]);
end

exactTime = 0:0.01:endTime;
exactPop = initialPop * exp(growthRate*exactTime);
plot(exactTime, exactPop, 'k--', 'DisplayName', 'Exact solution');

xlabel('Time'); ylabel('Population N(t)');
title('Euler''s Method: Population Growth');
legend('show', 'Location', 'best'); grid on; hold off;
