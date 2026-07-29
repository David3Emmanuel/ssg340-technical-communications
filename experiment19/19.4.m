 %% DE for f(x) = x^2 + 10sin(x)
popSize = 30; maxGen = 100; F = 0.8; CR = 0.9;
lb = 0; ub = 3;

pop = lb + rand(popSize,1)*(ub-lb);
history = zeros(maxGen,1);

for gen = 1:maxGen
    for i = 1:popSize
        idxs = randperm(popSize, 3);
        while any(idxs == i)
            idxs = randperm(popSize, 3);
        end
        a = pop(idxs(1)); b = pop(idxs(2)); c = pop(idxs(3));
        mutant = a + F*(b - c);
        mutant = max(min(mutant, ub), lb);

        trial = pop(i);
        if rand < CR
            trial = mutant;
        end

        if de_obj(trial) < de_obj(pop(i))
            pop(i) = trial;
        end
    end
    fitness = arrayfun(@de_obj, pop);
    [bestVal, idx] = min(fitness);
    history(gen) = bestVal;
end

fprintf('DE best: x=%.4f, f=%.4f\n', pop(idx), history(end));
figure; plot(history); xlabel('Generation'); ylabel('Best Fitness'); title('DE Convergence'); grid on;

function val = de_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x^2 - 4;    % <=0
    g2 = x - 2;      % >=0
    penalty = 100*max(0,g1)^2 + 100*max(0,-g2)^2;
    val = f + penalty;
end