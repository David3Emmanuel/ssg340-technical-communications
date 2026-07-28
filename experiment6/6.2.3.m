fprintf('\n--- Task 3: Monte Carlo Pi Estimation ---\n');
n = 1000;
x = rand(1, n);
y = rand(1, n);

inside = (x.^2 + y.^2) <= 1;   % logical vector: points inside unit circle
piEstimate = 4 * sum(inside) / n;
fprintf('Estimated value of pi using %d points: %.4f\n', n, piEstimate);
