%% GA for f(x,y) = x^2 + 10sin(x) + y^3, subject to g1,g2,g3
popSize = 50; maxGen = 100; mutRate = 0.1; crossRate = 0.8;
lb = [-2 -2]; ub = [2 2];

pop = lb + rand(popSize,2).*(ub-lb);
bestHistory = zeros(maxGen,1);

for gen = 1:maxGen
    fitness = zeros(popSize,1);
    for i = 1:popSize
        fitness(i) = penaltyObjective(pop(i,:));
    end
    [~, sortIdx] = sort(fitness);
    pop = pop(sortIdx,:);
    bestHistory(gen) = fitness(sortIdx(1));

    newPop = pop(1:2,:);   % elitism
    while size(newPop,1) < popSize
        p1 = pop(randi(popSize/2),:);
        p2 = pop(randi(popSize/2),:);
        if rand < crossRate
            alpha = rand;
            child = alpha*p1 + (1-alpha)*p2;
        else
            child = p1;
        end
        if rand < mutRate
            child = child + randn(1,2)*0.1;
        end
        child = max(min(child, ub), lb);
        newPop = [newPop; child];
    end
    pop = newPop;
end

fprintf('GA best solution: x=%.4f, y=%.4f, f=%.4f\n', pop(1,1), pop(1,2), penaltyObjective(pop(1,:)));
figure; plot(bestHistory); xlabel('Generation'); ylabel('Best Fitness'); title('GA Convergence'); grid on;

function val = penaltyObjective(v)
    x = v(1); y = v(2);
    f = x^2 + 10*sin(x) + y^3;
    g1 = x^2 + y^2 - 1;        % <=0
    g2 = x - 0.5;               % >=0 -> penalize if <0
    g3 = y - 0.5;               % >=0 -> penalize if <0
    penalty = 100*max(0,g1)^2 + 100*max(0,-g2)^2 + 100*max(0,-g3)^2;
    val = f + penalty;
end