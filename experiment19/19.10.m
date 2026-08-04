%% MA for f(x) = x^2 + 10sin(x)
popSize = 30; maxGen = 60; lowerBound = -0.5; upperBound = 1;

population = lowerBound + rand(popSize,1)*(upperBound-lowerBound);
history = zeros(maxGen,1);

for genIdx = 1:maxGen
    fitness = arrayfun(@maObjective, population);
    [sortedFitness, rankOrder] = sort(fitness);
    population = population(rankOrder);

    nextPopulation = population(1:2);
    while length(nextPopulation) < popSize
        parentOne = population(randi(popSize/2));
        parentTwo = population(randi(popSize/2));
        offspring = 0.5*parentOne + 0.5*parentTwo + randn*0.05;
        offspring = max(min(offspring, upperBound), lowerBound);
        nextPopulation = [nextPopulation; offspring];
    end
    population = nextPopulation;

    % Local search: hill climbing on best individual
    bestIndividual = population(1);
    climbStep = 0.05;
    for climbIdx = 1:10
        candidatePos = bestIndividual + climbStep*(2*rand-1);
        candidatePos = max(min(candidatePos, upperBound), lowerBound);
        if maObjective(candidatePos) < maObjective(bestIndividual)
            bestIndividual = candidatePos;
        end
    end
    population(1) = bestIndividual;

    history(genIdx) = maObjective(population(1));
end

fprintf('MA best: x=%.4f, f=%.4f\n', population(1), history(end));
figure; plot(history); xlabel('Generation'); ylabel('Best Fitness'); title('MA Convergence'); grid on;

function penalisedValue = maObjective(xVal)
    baseValue = xVal^2 + 10*sin(xVal);
    lowerConstraint = xVal - 0.5;    % >=0
    upperConstraint = 1 - xVal;      % >=0
    penalty = 100*max(0,-lowerConstraint)^2 + 100*max(0,-upperConstraint)^2;
    penalisedValue = baseValue + penalty;
end
