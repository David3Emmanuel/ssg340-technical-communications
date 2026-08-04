%% GA for f(x,y) = x^2 + 10sin(x) + y^3, subject to g1,g2,g3
popSize = 50; maxGen = 100; mutRate = 0.1; crossRate = 0.8;
lowerBounds = [-2 -2]; upperBounds = [2 2];

population = lowerBounds + rand(popSize,2).*(upperBounds-lowerBounds);
bestHistory = zeros(maxGen,1);

for genIdx = 1:maxGen
    fitness = zeros(popSize,1);
    for memberIdx = 1:popSize
        fitness(memberIdx) = gaPenaltyObjective(population(memberIdx,:));
    end
    [~, rankOrder] = sort(fitness);
    population = population(rankOrder,:);
    bestHistory(genIdx) = fitness(rankOrder(1));

    nextPopulation = population(1:2,:);   % elitism
    while size(nextPopulation,1) < popSize
        parentOne = population(randi(popSize/2),:);
        parentTwo = population(randi(popSize/2),:);
        if rand < crossRate
            blendWeight = rand;
            offspring = blendWeight*parentOne + (1-blendWeight)*parentTwo;
        else
            offspring = parentOne;
        end
        if rand < mutRate
            offspring = offspring + randn(1,2)*0.1;
        end
        offspring = max(min(offspring, upperBounds), lowerBounds);
        nextPopulation = [nextPopulation; offspring];
    end
    population = nextPopulation;
end

fprintf('GA best solution: x=%.4f, y=%.4f, f=%.4f\n', population(1,1), population(1,2), gaPenaltyObjective(population(1,:)));
figure; plot(bestHistory); xlabel('Generation'); ylabel('Best Fitness'); title('GA Convergence'); grid on;

function penalisedValue = gaPenaltyObjective(candidate)
    xVal = candidate(1); yVal = candidate(2);
    baseValue = xVal^2 + 10*sin(xVal) + yVal^3;
    circleConstraint = xVal^2 + yVal^2 - 1;   % <=0
    xConstraint = xVal - 0.5;                  % >=0 -> penalize if <0
    yConstraint = yVal - 0.5;                  % >=0 -> penalize if <0
    penalty = 100*max(0,circleConstraint)^2 + 100*max(0,-xConstraint)^2 + 100*max(0,-yConstraint)^2;
    penalisedValue = baseValue + penalty;
end
