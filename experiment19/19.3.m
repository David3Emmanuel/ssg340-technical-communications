%% SA for f(x) = x^2 + 10sin(x)
startTemp = 100; minTemp = 1e-3; coolRate = 0.95;
currentPos = 1;   % initial guess within feasible region
temperature = startTemp;
history = [];

while temperature > minTemp
    candidatePos = currentPos + randn*0.5;
    candidatePos = max(min(candidatePos, 2), -2);   % keep in reasonable range

    currentValue = saObjective(currentPos);
    candidateValue = saObjective(candidatePos);
    energyDelta = candidateValue - currentValue;

    if energyDelta < 0 || rand < exp(-energyDelta/temperature)
        currentPos = candidatePos;
    end
    history(end+1) = saObjective(currentPos);
    temperature = temperature * coolRate;
end

fprintf('SA best: x=%.4f, f=%.4f\n', currentPos, saObjective(currentPos));
figure; plot(history); xlabel('Iteration'); ylabel('Objective'); title('SA Convergence'); grid on;

function penalisedValue = saObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    lowerConstraint = xVal - 1;     % >=0
    upperConstraint = 2 - xVal;     % >=0
    penalty = 100*max(0,-lowerConstraint)^2 + 100*max(0,-upperConstraint)^2;
    penalisedValue = baseValue + penalty;
end
