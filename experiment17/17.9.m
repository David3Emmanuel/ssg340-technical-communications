fprintf('\n--- 17.9: Radioactive Decay System ---\n');
epsilonValues = [0.5, 1, 2];   % different epsilon values to compare stability

figure; hold on;
for epsilonVal = epsilonValues
    vanDerPolOde = @(t, state) [state(2);
                                epsilonVal*(1 - state(1)^2)*state(2) - state(1)];
    timeSpan = [0 30];
    initialState = [2; 0];
    [timePoints, stateHistory] = ode45(vanDerPolOde, timeSpan, initialState);
    plot(stateHistory(:,1), stateHistory(:,2), 'DisplayName', ['\epsilon = ', num2str(epsilonVal)]);
end
xlabel('x_1'); ylabel('x_2');
title('Phase Trajectories for Different \epsilon (Van der Pol-type System)');
legend('show', 'Location', 'best'); grid on; hold off;
