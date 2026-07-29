%% ABC for f(x) = x^2 + 10sin(x)
nBees = 30; maxIter = 100; lb = -0.5; ub = 2; limit = 20;

pos = lb + rand(nBees,1)*(ub-lb);
trials = zeros(nBees,1);
history = zeros(maxIter,1);

for iter = 1:maxIter
    % Employed bees
    for i = 1:nBees
        k = randi(nBees);
        while k == i, k = randi(nBees); end
        phi = 2*rand - 1;
        newPos = pos(i) + phi*(pos(i) - pos(k));
        newPos = max(min(newPos, ub), lb);
        if abc_obj(newPos) < abc_obj(pos(i))
            pos(i) = newPos; trials(i) = 0;
        else
            trials(i) = trials(i) + 1;
        end
    end
    % Scout bees
    for i = 1:nBees
        if trials(i) > limit
            pos(i) = lb + rand*(ub-lb);
            trials(i) = 0;
        end
    end
    history(iter) = min(arrayfun(@abc_obj, pos));
end

[bestVal, idx] = min(arrayfun(@abc_obj, pos));
fprintf('ABC best: x=%.4f, f=%.4f\n', pos(idx), bestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('ABC Convergence'); grid on;

function val = abc_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x - 1.5;    % >=0
    g2 = 2 - x;      % >=0
    penalty = 100*max(0,-g1)^2 + 100*max(0,-g2)^2;
    val = f + penalty;
end