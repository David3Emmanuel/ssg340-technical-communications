%% GWO for f(x) = x^2 + 10sin(x)
numWolves = 30; maxIter = 100; lowerBound = -1.5; upperBound = 1.5;

positions = lowerBound + rand(numWolves,1)*(upperBound-lowerBound);
history = zeros(maxIter,1);

for iterIdx = 1:maxIter
    fitness = arrayfun(@gwoObjective, positions);
    [sortedFitness, rankOrder] = sort(fitness);
    alphaWolf = positions(rankOrder(1)); betaWolf = positions(rankOrder(2)); deltaWolf = positions(rankOrder(3));

    decayFactor = 2 - iterIdx*(2/maxIter);
    for wolfIdx = 1:numWolves
        alphaCoeffA = 2*decayFactor*rand - decayFactor; alphaCoeffC = 2*rand;
        alphaDistance = abs(alphaCoeffC*alphaWolf - positions(wolfIdx));
        alphaCandidate = alphaWolf - alphaCoeffA*alphaDistance;

        betaCoeffA = 2*decayFactor*rand - decayFactor; betaCoeffC = 2*rand;
        betaDistance = abs(betaCoeffC*betaWolf - positions(wolfIdx));
        betaCandidate = betaWolf - betaCoeffA*betaDistance;

        deltaCoeffA = 2*decayFactor*rand - decayFactor; deltaCoeffC = 2*rand;
        deltaDistance = abs(deltaCoeffC*deltaWolf - positions(wolfIdx));
        deltaCandidate = deltaWolf - deltaCoeffA*deltaDistance;

        positions(wolfIdx) = (alphaCandidate+betaCandidate+deltaCandidate)/3;
        positions(wolfIdx) = max(min(positions(wolfIdx), upperBound), lowerBound);
    end
    history(iterIdx) = min(arrayfun(@gwoObjective, positions));
end

[bestValue, bestIdx] = min(arrayfun(@gwoObjective, positions));
fprintf('GWO best: x=%.4f, f=%.4f\n', positions(bestIdx), bestValue);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('GWO Convergence'); grid on;

function penalisedValue = gwoObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    lowerConstraint = xVal - 1.5;        % >=0
    squareConstraint = xVal^2 + 0.5;     % <=0
    penalty = 100*max(0,-lowerConstraint)^2 + 100*max(0,squareConstraint)^2;
    penalisedValue = baseValue + penalty;
end
