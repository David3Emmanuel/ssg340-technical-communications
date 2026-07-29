%% SA for f(x) = x^2 + 10sin(x)
T0 = 100; Tmin = 1e-3; coolRate = 0.95;
x = 1;   % initial guess within feasible region
T = T0;
history = [];

while T > Tmin
    xNew = x + randn*0.5;
    xNew = max(min(xNew, 2), -2);   % keep in reasonable range

    fOld = sa_obj(x);
    fNew = sa_obj(xNew);
    dE = fNew - fOld;

    if dE < 0 || rand < exp(-dE/T)
        x = xNew;
    end
    history(end+1) = sa_obj(x);
    T = T * coolRate;
end

fprintf('SA best: x=%.4f, f=%.4f\n', x, sa_obj(x));
figure; plot(history); xlabel('Iteration'); ylabel('Objective'); title('SA Convergence'); grid on;

function val = sa_obj(x)
    f = x^2 + 10*sin(x);
    g1 = x - 1;     % >=0
    g2 = 2 - x;     % >=0
    penalty = 100*max(0,-g1)^2 + 100*max(0,-g2)^2;
    val = f + penalty;
end