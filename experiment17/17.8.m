fprintf('\n--- 17.8: System of ODEs (Runge-Kutta / ode45) ---\n');
lorenzOde = @(t, state) [10*(state(2) - state(1));
                         -state(1)*state(3) + 28*state(1) - state(2);
                          state(1)*state(2) - (8/3)*state(3)];

timeSpan = [0 20];
initialState = [1; 1; 1];

[timePoints, stateHistory] = ode45(lorenzOde, timeSpan, initialState);

figure;
plot3(stateHistory(:,1), stateHistory(:,2), stateHistory(:,3));
xlabel('x'); ylabel('y'); zlabel('z');
title('System of ODEs: Runge-Kutta (ode45)');
grid on;
