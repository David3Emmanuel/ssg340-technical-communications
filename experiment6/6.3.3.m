fprintf('\n--- Task 3: Simulating Random Numbers for Statistical Analysis ---\n');
r_rand = rand(1, 10000);

count_less_half = sum(r_rand < 0.5);
proportion = count_less_half / length(r_rand);
expected_value = 0.5;

fprintf('Count of numbers less than 0.5: %d\n', count_less_half);
fprintf('Proportion: %.4f (Expected theoretical value: %.1f)\n', proportion, expected_value);
