%% 15.1 Experiment 1: Simulating a Coin Toss
fprintf('--- 15.1 Experiment 1: Coin Toss ---\n');

% 1. Generate a vector of 50 random numbers
num_tosses = 50;
r_coin = rand(1, num_tosses);

% 2. Logical conditions for Heads (H) and Tails (T)
heads = r_coin < 0.5;
tails = r_coin >= 0.5;

% 3. Display sequence as a string of characters
sequence = char(zeros(1, num_tosses));
sequence(heads) = 'H';
sequence(tails) = 'T';
fprintf('Sequence of 50 tosses: %s\n', sequence);

% 4. Plot the frequency of heads and tails
figure('Name', '15.1 Coin Toss Frequency');
bar([sum(heads), sum(tails)], 'FaceColor', [0.2 0.6 0.8]);
set(gca, 'XTickLabel', {'Heads', 'Tails'});
ylabel('Frequency');
title('Frequency of Heads and Tails in 50 Tosses');
grid on;

% 5. Compare theoretical vs simulated probability
sim_prob_H = sum(heads) / num_tosses;
fprintf('Theoretical Probability of Heads: 0.50\n');
fprintf('Simulated Probability of Heads: %.2f\n\n', sim_prob_H);
