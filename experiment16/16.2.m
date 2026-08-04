
%% 16.2 Experiment 2: Simulating a Markov Chain
fprintf('\n--- 16.2 Experiment 2: Simulating a Markov Chain ---\n');

% Task 1: Define the 6x6 transition matrix P (Columns must sum to 1)
transitionMatrix = [0.2 0.1 0.1 0.2 0.1 0.1;
                    0.3 0.4 0.1 0.1 0.2 0.1;
                    0.1 0.1 0.5 0.1 0.1 0.2;
                    0.2 0.2 0.1 0.3 0.1 0.1;
                    0.1 0.1 0.1 0.2 0.4 0.1;
                    0.1 0.1 0.1 0.1 0.1 0.4];

% Task 2: Initialize state vector (Start at intersection 1)
stateVector = [1; 0; 0; 0; 0; 0];
numSteps = 50;

% Array to store probabilities of ending up at the cafe (assuming cafe is state 6)
cafeProbability = zeros(1, numSteps + 1);
cafeProbability(1) = stateVector(6);

% Task 3: Compute future states
for stepIdx = 1:numSteps
    stateVector = transitionMatrix * stateVector;
    cafeProbability(stepIdx+1) = stateVector(6);
end

% Task 5 & 6: Display limiting probabilities and plot
fprintf('Limiting Probability Distribution after 50 steps:\n');
disp(stateVector);

figure('Name', '16.2 Markov Chain');
plot(0:numSteps, cafeProbability, 'r-', 'LineWidth', 2);
title('Probability of Student Being at the Cafe (State 6)');
xlabel('Steps');
ylabel('Probability');
grid on;
