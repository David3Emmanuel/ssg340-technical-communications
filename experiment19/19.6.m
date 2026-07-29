%% FA for f(x) = x^2 + 10sin(x)
nFireflies = 30; maxIter = 100; lb = 0; ub = 2;
alpha = 0.2; beta0 = 1; gamma = 1;

pos = lb + rand(nFireflies,1)*(ub-lb);
history = zeros(maxIter,1);

for iter = 1:maxIter
    fitness = arrayfun(@fa_obj, pos);
    for i = 1:nFireflies
        for j = 1:nFireflies
            if fitness(j) < fitness(i)
                r = abs(pos(i) - pos(j));
                beta = beta0 * exp(-gamma * r^2);
                pos(i) = pos(i) + beta*(pos(j) - pos(i)) + alpha*(rand-0.5);
                pos(i) = max(min(pos(i), ub), lb);
                fitness(i) = fa_obj(pos(i));
            end
        end
    end
    history(iter) = min(fitness);
end

[bestVal, idx] = min(arrayfun(@fa_obj, pos));
fprintf('FA best: x=%.4f, f=%.4f\n', pos(idx), bestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('FA Convergence'); grid on;

function val = fa_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x - 1.5;      % >=0
    g2 = x^2 - 2;      % <=0
    penalty = 100*max(0,-g1)^2 + 100*max(0,g2)^2;
    val = f + penalty;
end