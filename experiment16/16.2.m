
%% 16.2 Experiment 2: Simulating a Markov Chain
fprintf('\n--- 16.2 Experiment 2: Simulating a Markov Chain ---\n');

% Task 1: Define the 6x6 transition matrix P (Columns must sum to 1)
P = [0.2 0.1 0.1 0.2 0.1 0.1;
     0.3 0.4 0.1 0.1 0.2 0.1;
     0.1 0.1 0.5 0.1 0.1 0.2;
     0.2 0.2 0.1 0.3 0.1 0.1;
     0.1 0.1 0.1 0.2 0.4 0.1;
     0.1 0.1 0.1 0.1 0.1 0.4];

% Task 2: Initialize state vector (Start at intersection 1)
X_state = [1; 0; 0; 0; 0; 0];
steps = 50;

% Array to store probabilities of ending up at the cafe (assuming cafe is state 6)
cafe_prob = zeros(1, steps + 1);
cafe_prob(1) = X_state(6);

% Task 3: Compute future states
for t = 1:steps
    X_state = P * X_state;
    cafe_prob(t+1) = X_state(6);
end

% Task 5 & 6: Display limiting probabilities and plot
fprintf('Limiting Probability Distribution after 50 steps:\n');
disp(X_state);

figure('Name', '16.2 Markov Chain');
plot(0:steps, cafe_prob, 'r-', 'LineWidth', 2);
title('Probability of Student Being at the Cafe (State 6)');
xlabel('Steps');
ylabel('Probability');
grid on;
