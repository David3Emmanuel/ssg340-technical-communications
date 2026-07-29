fprintf('\n--- 17.9: Radioactive Decay System ---\n');
epsilonValues = [0.5, 1, 2];   % different epsilon values to compare stability

figure; hold on;
for eps_val = epsilonValues
    odefun = @(t, x) [x(2);
                       eps_val*(1 - x(1)^2)*x(2) - x(1)];
    tspan = [0 30];
    x0 = [2; 0];
    [t, x] = ode45(odefun, tspan, x0);
    plot(x(:,1), x(:,2), 'DisplayName', ['\epsilon = ', num2str(eps_val)]);
end
xlabel('x_1'); ylabel('x_2');
title('Phase Trajectories for Different \epsilon (Van der Pol-type System)');
legend('show', 'Location', 'best'); grid on; hold off;