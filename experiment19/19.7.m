%% BA for f(x) = x^2 + 10sin(x)
nBats = 30; maxIter = 100; lb = -1; ub = 2;
fmin = 0; fmax = 2; A = 0.5; r0 = 0.5;

pos = lb + rand(nBats,1)*(ub-lb);
vel = zeros(nBats,1);
[bestVal, idx] = min(arrayfun(@ba_obj, pos));
best = pos(idx);
history = zeros(maxIter,1);

for iter = 1:maxIter
    for i = 1:nBats
        freq = fmin + (fmax-fmin)*rand;
        vel(i) = vel(i) + (pos(i) - best)*freq;
        newPos = pos(i) + vel(i);
        newPos = max(min(newPos, ub), lb);

        if rand > r0
            newPos = best + 0.1*randn;
            newPos = max(min(newPos, ub), lb);
        end

        if ba_obj(newPos) < ba_obj(pos(i)) && rand < A
            pos(i) = newPos;
        end
    end
    [minVal, idx] = min(arrayfun(@ba_obj, pos));
    if minVal < bestVal
        bestVal = minVal;
        best = pos(idx);
    end
    history(iter) = bestVal;
end

fprintf('BA best: x=%.4f, f=%.4f\n', best, bestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('BA Convergence'); grid on;

function val = ba_obj(x)
    f = x^2 + 10*sin(x);
    g1 = 2 - x;         % >=0
    g2 = x^2 + 1;       % <=0, note: x^2+1 always >0, so always penalized slightly
    penalty = 100*max(0,-g1)^2 + 100*max(0,g2)^2;
    val = f + penalty;
end