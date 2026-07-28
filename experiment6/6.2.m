%% Task 1: Advanced Logical Function Application
fprintf('--- Task 1: Logical Functions ---\n');
b = rand(1, 15);
disp('Vector b:');
disp(b);

if any(b < 0.3)
    disp('At least one element in b is less than 0.3');
else
    disp('No element in b is less than 0.3');
end

if all(b > 0.5)
    disp('All elements in b are greater than 0.5');
else
    disp('Not all elements in b are greater than 0.5');
end

%% Task 2: Simulating Dice Rolls
fprintf('\n--- Task 2: Dice Roll Simulation ---\n');
d = floor(6 * rand(1, 1000)) + 1;   % simulate 1000 rolls of a 6-sided die
sixCount = sum(d == 6);             % count how many times a six was rolled
fprintf('Number of sixes rolled: %d out of 1000\n', sixCount);

%% Task 3: Monte Carlo Simulation for Estimating Pi
fprintf('\n--- Task 3: Monte Carlo Pi Estimation ---\n');
n = 1000;
x = rand(1, n);
y = rand(1, n);

inside = (x.^2 + y.^2) <= 1;   % logical vector: points inside unit circle
piEstimate = 4 * sum(inside) / n;
fprintf('Estimated value of pi using %d points: %.4f\n', n, piEstimate);

%% Task 4: Logical Vector Subsetting
fprintf('\n--- Task 4: Logical Vector Subsetting ---\n');
a = [-4 0 5 -3 0 3 7 -1 6];

positives = a(a > 0);
negatives = a(a < 0);
zeros_a   = a(a == 0);

disp('Positive elements:'); disp(positives);
disp('Negative elements:'); disp(negatives);
disp('Zero elements:');     disp(zeros_a);