%% Task 1: Advanced Logical Function Application
fprintf('--- Task 1: Logical Functions ---\n');
sampleVector = rand(1, 15);
disp('Vector sampleVector:');
disp(sampleVector);

if any(sampleVector < 0.3)
    disp('At least one element in sampleVector is less than 0.3');
else
    disp('No element in sampleVector is less than 0.3');
end

if all(sampleVector > 0.5)
    disp('All elements in sampleVector are greater than 0.5');
else
    disp('Not all elements in sampleVector are greater than 0.5');
end

%% Task 2: Simulating Dice Rolls
fprintf('\n--- Task 2: Dice Roll Simulation ---\n');
diceRolls = floor(6 * rand(1, 1000)) + 1;   % simulate 1000 rolls of a 6-sided die
sixCount = sum(diceRolls == 6);             % count how many times a six was rolled
fprintf('Number of sixes rolled: %d out of 1000\n', sixCount);

%% Task 3: Monte Carlo Simulation for Estimating Pi
fprintf('\n--- Task 3: Monte Carlo Pi Estimation ---\n');
numPoints = 1000;
pointsX = rand(1, numPoints);
pointsY = rand(1, numPoints);

insideCircle = (pointsX.^2 + pointsY.^2) <= 1;   % logical vector: points inside unit circle
piEstimate = 4 * sum(insideCircle) / numPoints;
fprintf('Estimated value of pi using %d points: %.4f\n', numPoints, piEstimate);

%% Task 4: Logical Vector Subsetting
fprintf('\n--- Task 4: Logical Vector Subsetting ---\n');
mixedSigns = [-4 0 5 -3 0 3 7 -1 6];

positiveElements = mixedSigns(mixedSigns > 0);
negativeElements = mixedSigns(mixedSigns < 0);
zeroElements     = mixedSigns(mixedSigns == 0);

disp('Positive elements:'); disp(positiveElements);
disp('Negative elements:'); disp(negativeElements);
disp('Zero elements:');     disp(zeroElements);
