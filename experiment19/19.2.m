%% PSO for f(x,y) = x^2 + y^2 + 10sin(x) + 10sin(y)
numParticles = 30; maxIter = 100;
lowerBounds = [-1.5 -1.5]; upperBounds = [1.5 1.5];
inertiaWeight = 0.7; cognitiveWeight = 1.5; socialWeight = 1.5;

positions = lowerBounds + rand(numParticles,2).*(upperBounds-lowerBounds);
velocities = zeros(numParticles,2);
personalBest = positions;
personalBestVal = arrayfun(@(idx) psoObjective(positions(idx,:)), 1:numParticles)';
[globalBestVal, bestIdx] = min(personalBestVal);
globalBest = positions(bestIdx,:);

history = zeros(maxIter,1);
for iterIdx = 1:maxIter
    for particleIdx = 1:numParticles
        velocities(particleIdx,:) = inertiaWeight*velocities(particleIdx,:) + cognitiveWeight*rand*(personalBest(particleIdx,:)-positions(particleIdx,:)) + socialWeight*rand*(globalBest-positions(particleIdx,:));
        positions(particleIdx,:) = positions(particleIdx,:) + velocities(particleIdx,:);
        positions(particleIdx,:) = max(min(positions(particleIdx,:), upperBounds), lowerBounds);

        candidateVal = psoObjective(positions(particleIdx,:));
        if candidateVal < personalBestVal(particleIdx)
            personalBestVal(particleIdx) = candidateVal;
            personalBest(particleIdx,:) = positions(particleIdx,:);
        end
    end
    [currentBestVal, bestIdx] = min(personalBestVal);
    if currentBestVal < globalBestVal
        globalBestVal = currentBestVal;
        globalBest = personalBest(bestIdx,:);
    end
    history(iterIdx) = globalBestVal;
end

fprintf('PSO best: x=%.4f, y=%.4f, f=%.4f\n', globalBest(1), globalBest(2), globalBestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('PSO Convergence'); grid on;

function penalisedValue = psoObjective(candidate)
    xVal = candidate(1); yVal = candidate(2);
    baseValue = xVal^2 + yVal^2 + 10*sin(xVal) + 10*sin(yVal);
    sumConstraint = xVal + yVal - 2;    % <=0
    xConstraint = xVal - 1.5;            % >=0
    yConstraint = yVal - 1.5;            % >=0
    penalty = 100*max(0,sumConstraint)^2 + 100*max(0,-xConstraint)^2 + 100*max(0,-yConstraint)^2;
    penalisedValue = baseValue + penalty;
end
