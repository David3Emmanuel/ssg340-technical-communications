fprintf('\n--- Task 2: Dice Roll Simulation ---\n');
d = floor(6 * rand(1, 1000)) + 1;   % simulate 1000 rolls of a 6-sided die
sixCount = sum(d == 6);             % count how many times a six was rolled
fprintf('Number of sixes rolled: %d out of 1000\n', sixCount);
