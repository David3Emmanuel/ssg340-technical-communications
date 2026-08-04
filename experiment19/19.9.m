%% ABC for f(x) = x^2 + 10sin(x)
numBees = 30; maxIter = 100; lowerBound = -0.5; upperBound = 2; abandonLimit = 20;

positions = lowerBound + rand(numBees,1)*(upperBound-lowerBound);
trialCounts = zeros(numBees,1);
history = zeros(maxIter,1);

for iterIdx = 1:maxIter
    % Employed bees
    for beeIdx = 1:numBees
        partnerIdx = randi(numBees);
        while partnerIdx == beeIdx, partnerIdx = randi(numBees); end
        stepScale = 2*rand - 1;
        candidatePos = positions(beeIdx) + stepScale*(positions(beeIdx) - positions(partnerIdx));
        candidatePos = max(min(candidatePos, upperBound), lowerBound);
        if abcObjective(candidatePos) < abcObjective(positions(beeIdx))
            positions(beeIdx) = candidatePos; trialCounts(beeIdx) = 0;
        else
            trialCounts(beeIdx) = trialCounts(beeIdx) + 1;
        end
    end
    % Scout bees
    for beeIdx = 1:numBees
        if trialCounts(beeIdx) > abandonLimit
            positions(beeIdx) = lowerBound + rand*(upperBound-lowerBound);
            trialCounts(beeIdx) = 0;
        end
    end
    history(iterIdx) = min(arrayfun(@abcObjective, positions));
end

[bestValue, bestIdx] = min(arrayfun(@abcObjective, positions));
fprintf('ABC best: x=%.4f, f=%.4f\n', positions(bestIdx), bestValue);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('ABC Convergence'); grid on;

function penalisedValue = abcObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    lowerConstraint = xVal - 1.5;    % >=0
    upperConstraint = 2 - xVal;      % >=0
    penalty = 100*max(0,-lowerConstraint)^2 + 100*max(0,-upperConstraint)^2;
    penalisedValue = baseValue + penalty;
end
