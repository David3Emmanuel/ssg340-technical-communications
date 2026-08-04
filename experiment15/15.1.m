%% 15.1 Experiment 1: Simulating a Coin Toss
fprintf('--- 15.1 Experiment 1: Coin Toss ---\n');

% 1. Generate a vector of 50 random numbers
numTosses = 50;
tossValues = rand(1, numTosses);

% 2. Logical conditions for Heads (H) and Tails (T)
headsMask = tossValues < 0.5;
tailsMask = tossValues >= 0.5;

% 3. Display sequence as a string of characters
tossSequence = char(zeros(1, numTosses));
tossSequence(headsMask) = 'H';
tossSequence(tailsMask) = 'T';
fprintf('Sequence of 50 tosses: %s\n', tossSequence);

% 4. Plot the frequency of heads and tails
figure('Name', '15.1 Coin Toss Frequency');
bar([sum(headsMask), sum(tailsMask)], 'FaceColor', [0.2 0.6 0.8]);
set(gca, 'XTickLabel', {'Heads', 'Tails'});
ylabel('Frequency');
title('Frequency of Heads and Tails in 50 Tosses');
grid on;

% 5. Compare theoretical vs simulated probability
simulatedHeadsProb = sum(headsMask) / numTosses;
fprintf('Theoretical Probability of Heads: 0.50\n');
fprintf('Simulated Probability of Heads: %.2f\n\n', simulatedHeadsProb);
