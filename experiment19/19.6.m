%% FA for f(x) = x^2 + 10sin(x)
numFireflies = 30; maxIter = 100; lowerBound = 0; upperBound = 2;
randomStep = 0.2; baseAttraction = 1; absorptionCoeff = 1;

positions = lowerBound + rand(numFireflies,1)*(upperBound-lowerBound);
history = zeros(maxIter,1);

for iterIdx = 1:maxIter
    fitness = arrayfun(@faObjective, positions);
    for movingIdx = 1:numFireflies
        for brighterIdx = 1:numFireflies
            if fitness(brighterIdx) < fitness(movingIdx)
                separation = abs(positions(movingIdx) - positions(brighterIdx));
                attraction = baseAttraction * exp(-absorptionCoeff * separation^2);
                positions(movingIdx) = positions(movingIdx) + attraction*(positions(brighterIdx) - positions(movingIdx)) + randomStep*(rand-0.5);
                positions(movingIdx) = max(min(positions(movingIdx), upperBound), lowerBound);
                fitness(movingIdx) = faObjective(positions(movingIdx));
            end
        end
    end
    history(iterIdx) = min(fitness);
end

[bestValue, bestIdx] = min(arrayfun(@faObjective, positions));
fprintf('FA best: x=%.4f, f=%.4f\n', positions(bestIdx), bestValue);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('FA Convergence'); grid on;

function penalisedValue = faObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    lowerConstraint = xVal - 1.5;      % >=0
    squareConstraint = xVal^2 - 2;     % <=0
    penalty = 100*max(0,-lowerConstraint)^2 + 100*max(0,squareConstraint)^2;
    penalisedValue = baseValue + penalty;
end
