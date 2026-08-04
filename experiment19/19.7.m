%% BA for f(x) = x^2 + 10sin(x)
numBats = 30; maxIter = 100; lowerBound = -1; upperBound = 2;
minFreq = 0; maxFreq = 2; loudness = 0.5; pulseRate = 0.5;

positions = lowerBound + rand(numBats,1)*(upperBound-lowerBound);
velocities = zeros(numBats,1);
[bestValue, bestIdx] = min(arrayfun(@baObjective, positions));
bestPosition = positions(bestIdx);
history = zeros(maxIter,1);

for iterIdx = 1:maxIter
    for batIdx = 1:numBats
        frequency = minFreq + (maxFreq-minFreq)*rand;
        velocities(batIdx) = velocities(batIdx) + (positions(batIdx) - bestPosition)*frequency;
        candidatePos = positions(batIdx) + velocities(batIdx);
        candidatePos = max(min(candidatePos, upperBound), lowerBound);

        if rand > pulseRate
            candidatePos = bestPosition + 0.1*randn;
            candidatePos = max(min(candidatePos, upperBound), lowerBound);
        end

        if baObjective(candidatePos) < baObjective(positions(batIdx)) && rand < loudness
            positions(batIdx) = candidatePos;
        end
    end
    [currentBestValue, bestIdx] = min(arrayfun(@baObjective, positions));
    if currentBestValue < bestValue
        bestValue = currentBestValue;
        bestPosition = positions(bestIdx);
    end
    history(iterIdx) = bestValue;
end

fprintf('BA best: x=%.4f, f=%.4f\n', bestPosition, bestValue);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('BA Convergence'); grid on;

function penalisedValue = baObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    upperConstraint = 2 - xVal;         % >=0
    squareConstraint = xVal^2 + 1;      % <=0, note: x^2+1 always >0, so always penalized slightly
    penalty = 100*max(0,-upperConstraint)^2 + 100*max(0,squareConstraint)^2;
    penalisedValue = baseValue + penalty;
end
