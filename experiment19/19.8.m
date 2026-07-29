%% GWO for f(x) = x^2 + 10sin(x)
nWolves = 30; maxIter = 100; lb = -1.5; ub = 1.5;

pos = lb + rand(nWolves,1)*(ub-lb);
history = zeros(maxIter,1);

for iter = 1:maxIter
    fitness = arrayfun(@gwo_obj, pos);
    [sortedFit, sortIdx] = sort(fitness);
    alpha = pos(sortIdx(1)); beta = pos(sortIdx(2)); delta = pos(sortIdx(3));

    a = 2 - iter*(2/maxIter);
    for i = 1:nWolves
        A1 = 2*a*rand - a; C1 = 2*rand;
        D_alpha = abs(C1*alpha - pos(i));
        X1 = alpha - A1*D_alpha;

        A2 = 2*a*rand - a; C2 = 2*rand;
        D_beta = abs(C2*beta - pos(i));
        X2 = beta - A2*D_beta;

        A3 = 2*a*rand - a; C3 = 2*rand;
        D_delta = abs(C3*delta - pos(i));
        X3 = delta - A3*D_delta;

        pos(i) = (X1+X2+X3)/3;
        pos(i) = max(min(pos(i), ub), lb);
    end
    history(iter) = min(arrayfun(@gwo_obj, pos));
end

[bestVal, idx] = min(arrayfun(@gwo_obj, pos));
fprintf('GWO best: x=%.4f, f=%.4f\n', pos(idx), bestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('GWO Convergence'); grid on;

function val = gwo_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x - 1.5;        % >=0
    g2 = x^2 + 0.5;      % <=0
    penalty = 100*max(0,-g1)^2 + 100*max(0,g2)^2;
    val = f + penalty;
end