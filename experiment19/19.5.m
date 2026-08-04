%% ACO for f(x) = x^2 + 10sin(x), continuous domain
numAnts = 30; maxIter = 100; lowerBound = 0; upperBound = 3;
evapRate = 0.1;

solutionArchive = lowerBound + rand(numAnts,1)*(upperBound-lowerBound);
history = zeros(maxIter,1);

for iterIdx = 1:maxIter
    fitness = arrayfun(@acoObjective, solutionArchive);
    [sortedFitness, rankOrder] = sort(fitness);
    solutionArchive = solutionArchive(rankOrder);

    nextArchive = solutionArchive;
    for antIdx = 1:numAnts
        guidePosition = solutionArchive(randi(numAnts/2));   % sample from better half (pheromone-guided)
        spread = evapRate * range(solutionArchive) + 0.01;
        nextArchive(antIdx) = guidePosition + randn*spread;
        nextArchive(antIdx) = max(min(nextArchive(antIdx), upperBound), lowerBound);
    end
    solutionArchive = nextArchive;
    history(iterIdx) = min(arrayfun(@acoObjective, solutionArchive));
end

[bestValue, bestIdx] = min(arrayfun(@acoObjective, solutionArchive));
fprintf('ACO best: x=%.4f, f=%.4f\n', solutionArchive(bestIdx), bestValue);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('ACO Convergence'); grid on;

function penalisedValue = acoObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    lowerConstraint = xVal - 1;    % >=0
    upperConstraint = 3 - xVal;    % >=0
    penalty = 100*max(0,-lowerConstraint)^2 + 100*max(0,-upperConstraint)^2;
    penalisedValue = baseValue + penalty;
end
