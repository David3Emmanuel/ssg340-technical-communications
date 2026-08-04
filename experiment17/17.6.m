fprintf('\n--- 17.6: System of ODEs (ode23) ---\n');
lorenzOde = @(t, state) [10*(state(2) - state(1));
                         -state(1)*state(3) + 28*state(1) - state(2);
                          state(1)*state(2) - (8/3)*state(3)];

timeSpan = [0 20];
initialState = [1; 1; 1];   % initial condition not specified, using standard Lorenz-like start

[timePoints, stateHistory] = ode23(lorenzOde, timeSpan, initialState);

figure;
subplot(3,1,1); plot(timePoints, stateHistory(:,1)); ylabel('x(t)'); grid on;
subplot(3,1,2); plot(timePoints, stateHistory(:,2)); ylabel('y(t)'); grid on;
subplot(3,1,3); plot(timePoints, stateHistory(:,3)); ylabel('z(t)'); xlabel('t'); grid on;
sgtitle('System of ODEs Solution');
