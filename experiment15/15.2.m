%% 15.2 Experiment 2: Simulating a Dice Roll
fprintf('--- 15.2 Experiment 2: Dice Roll ---\n');

% 1 & 2. Generate 100 random integers mapped to [1, 6]
num_rolls = 100;
rolls = floor(6 * rand(1, num_rolls) + 1);

% 3. Display the results
fprintf('Results of first 20 dice rolls for brevity:\n');
disp(rolls(1:20));

% 4. Estimate mean and standard deviation
fprintf('Estimated Mean: %.2f (Theoretical: 3.50)\n', mean(rolls));
fprintf('Estimated Std Dev: %.2f\n', std(rolls));

% 5. Plot the frequency of each number rolled
figure('Name', '15.2 Dice Roll Frequency');
histogram(rolls, 'BinEdges', 0.5:1:6.5, 'FaceColor', [0.8 0.4 0.2]);
xlabel('Dice Value');
ylabel('Frequency');
title('Frequency of 100 Dice Rolls');
xticks(1:6);
grid on;
