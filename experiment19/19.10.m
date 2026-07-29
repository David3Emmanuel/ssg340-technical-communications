%% MA for f(x) = x^2 + 10sin(x)
popSize = 30; maxGen = 60; lb = -0.5; ub = 1;

pop = lb + rand(popSize,1)*(ub-lb);
history = zeros(maxGen,1);

for gen = 1:maxGen
    fitness = arrayfun(@ma_obj, pop);
    [sortedFit, sortIdx] = sort(fitness);
    pop = pop(sortIdx);

    newPop = pop(1:2);
    while length(newPop) < popSize
        p1 = pop(randi(popSize/2));
        p2 = pop(randi(popSize/2));
        child = 0.5*p1 + 0.5*p2 + randn*0.05;
        child = max(min(child, ub), lb);
        newPop = [newPop; child];
    end
    pop = newPop;

    % Local search: hill climbing on best individual
    best = pop(1);
    step = 0.05;
    for k = 1:10
        cand = best + step*(2*rand-1);
        cand = max(min(cand, ub), lb);
        if ma_obj(cand) < ma_obj(best)
            best = cand;
        end
    end
    pop(1) = best;

    history(gen) = ma_obj(pop(1));
end

fprintf('MA best: x=%.4f, f=%.4f\n', pop(1), history(end));
figure; plot(history); xlabel('Generation'); ylabel('Best Fitness'); title('MA Convergence'); grid on;

function val = ma_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x - 0.5;    % >=0
    g2 = 1 - x;      % >=0
    penalty = 100*max(0,-g1)^2 + 100*max(0,-g2)^2;
    val = f + penalty;
end