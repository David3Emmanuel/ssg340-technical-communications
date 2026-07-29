%% ACO for f(x) = x^2 + 10sin(x), continuous domain
nAnts = 30; maxIter = 100; lb = 0; ub = 3;
evapRate = 0.1;

archive = lb + rand(nAnts,1)*(ub-lb);
history = zeros(maxIter,1);

for iter = 1:maxIter
    fitness = arrayfun(@aco_obj, archive);
    [sortedFit, sortIdx] = sort(fitness);
    archive = archive(sortIdx);

    newArchive = archive;
    for i = 1:nAnts
        meanPos = archive(randi(nAnts/2));   % sample from better half (pheromone-guided)
        sigma = evapRate * range(archive) + 0.01;
        newArchive(i) = meanPos + randn*sigma;
        newArchive(i) = max(min(newArchive(i), ub), lb);
    end
    archive = newArchive;
    history(iter) = min(arrayfun(@aco_obj, archive));
end

[bestVal, idx] = min(arrayfun(@aco_obj, archive));
fprintf('ACO best: x=%.4f, f=%.4f\n', archive(idx), bestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('ACO Convergence'); grid on;

function val = aco_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x - 1;    % >=0
    g2 = 3 - x;    % >=0
    penalty = 100*max(0,-g1)^2 + 100*max(0,-g2)^2;
    val = f + penalty;
end