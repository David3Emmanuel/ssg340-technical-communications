%% PSO for f(x,y) = x^2 + y^2 + 10sin(x) + 10sin(y)
nParticles = 30; maxIter = 100;
lb = [-1.5 -1.5]; ub = [1.5 1.5];
w = 0.7; c1 = 1.5; c2 = 1.5;

pos = lb + rand(nParticles,2).*(ub-lb);
vel = zeros(nParticles,2);
pbest = pos;
pbestVal = arrayfun(@(i) pso_obj(pos(i,:)), 1:nParticles)';
[gbestVal, idx] = min(pbestVal);
gbest = pos(idx,:);

history = zeros(maxIter,1);
for iter = 1:maxIter
    for i = 1:nParticles
        vel(i,:) = w*vel(i,:) + c1*rand*(pbest(i,:)-pos(i,:)) + c2*rand*(gbest-pos(i,:));
        pos(i,:) = pos(i,:) + vel(i,:);
        pos(i,:) = max(min(pos(i,:), ub), lb);

        val = pso_obj(pos(i,:));
        if val < pbestVal(i)
            pbestVal(i) = val;
            pbest(i,:) = pos(i,:);
        end
    end
    [minVal, idx] = min(pbestVal);
    if minVal < gbestVal
        gbestVal = minVal;
        gbest = pbest(idx,:);
    end
    history(iter) = gbestVal;
end

fprintf('PSO best: x=%.4f, y=%.4f, f=%.4f\n', gbest(1), gbest(2), gbestVal);
figure; plot(history); xlabel('Iteration'); ylabel('Best Fitness'); title('PSO Convergence'); grid on;

function val = pso_obj(v)
    x = v(1); y = v(2);
    f = x^2 + y^2 + 10*sin(x) + 10*sin(y);
    g1 = x + y - 2;    % <=0
    g2 = x - 1.5;       % >=0
    g3 = y - 1.5;       % >=0
    penalty = 100*max(0,g1)^2 + 100*max(0,-g2)^2 + 100*max(0,-g3)^2;
    val = f + penalty;
end