 %% DE for f(x) = x^2 + 10sin(x)
popSize = 30; maxGen = 100; mutationFactor = 0.8; crossoverRate = 0.9;
lowerBound = 0; upperBound = 3;

population = lowerBound + rand(popSize,1)*(upperBound-lowerBound);
history = zeros(maxGen,1);

for genIdx = 1:maxGen
    for memberIdx = 1:popSize
        pickedIdx = randperm(popSize, 3);
        while any(pickedIdx == memberIdx)
            pickedIdx = randperm(popSize, 3);
        end
        baseVector = population(pickedIdx(1)); diffOne = population(pickedIdx(2)); diffTwo = population(pickedIdx(3));
        mutantVector = baseVector + mutationFactor*(diffOne - diffTwo);
        mutantVector = max(min(mutantVector, upperBound), lowerBound);

        trialVector = population(memberIdx);
        if rand < crossoverRate
            trialVector = mutantVector;
        end

        if deObjective(trialVector) < deObjective(population(memberIdx))
            population(memberIdx) = trialVector;
        end
    end
    fitness = arrayfun(@deObjective, population);
    [bestValue, bestIdx] = min(fitness);
    history(genIdx) = bestValue;
end

fprintf('DE best: x=%.4f, f=%.4f\n', population(bestIdx), history(end));
figure; plot(history); xlabel('Generation'); ylabel('Best Fitness'); title('DE Convergence'); grid on;

function penalisedValue = deObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    squareConstraint = xVal^2 - 4;    % <=0
    lowerConstraint = xVal - 2;       % >=0
    penalty = 100*max(0,squareConstraint)^2 + 100*max(0,-lowerConstraint)^2;
    penalisedValue = baseValue + penalty;
end
