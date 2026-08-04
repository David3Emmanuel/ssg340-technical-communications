%% Task 1: Logical Indexing of a Vector
fprintf('--- Task 1: Logical Indexing ---\n');
dataVector = [1, 4, 7, 10, 12];
disp('Vector dataVector:');
disp(dataVector);

aboveFive     = dataVector(dataVector > 5);              % keep only elements larger than 5
evenElements  = dataVector(mod(dataVector, 2) == 0);     % keep only even elements
countAtLeast5 = sum(dataVector >= 5);                    % sum of a logical vector = count of trues

disp('Elements greater than 5:');
disp(aboveFive);
disp('Elements divisible by 2:');
disp(evenElements);
fprintf('Count of elements >= 5: %d\n', countAtLeast5);

%% Task 2: Avoiding Division by Zero with Logical Indexing
fprintf('\n--- Task 2: Sinc Function without Division by Zero ---\n');
sincInput = -4*pi:pi/20:4*pi;
sincInput(sincInput == 0) = eps;    % replace exact zeros with eps so sin(x)./x stays finite
sincOutput = sin(sincInput) ./ sincInput;    % element-wise division

fprintf('Number of sample points: %d\n', length(sincInput));
fprintf('Maximum value of y: %.4f\n', max(sincOutput));
fprintf('Minimum value of y: %.4f\n', min(sincOutput));

%% Task 3: Plotting a Discontinuous Function
fprintf('\n--- Task 3: Discontinuous Function ---\n');
clipInput = -4*pi:pi/20:4*pi;
clipOutput = sin(clipInput);
clipOutput(clipOutput <= 0) = 0;   % clip all negative values to zero (half-wave rectifier)

figure;
plot(clipInput, clipOutput, 'LineWidth', 1.5);
title('Discontinuous Function y(x)');
xlabel('x');
ylabel('y(x)');
grid on;

fprintf('Number of clipped (zero) points: %d\n', sum(clipOutput == 0));

%% Task 4: Counting Random Numbers in Ranges
fprintf('\n--- Task 4: Counting Random Numbers ---\n');
randomSamples = rand(1, 1000);
countLowBand  = sum(randomSamples < 0.3);              % values below 0.3
countHighBand = sum(randomSamples >= 0.5);             % values at or above 0.5

countMidBand = sum(randomSamples >= 0.3 & randomSamples < 0.5);   % values in the middle band [0.3, 0.5)
% the three ranges are mutually exclusive, so their counts must total 1000
totalsMatch = (countLowBand + countMidBand + countHighBand) == length(randomSamples);

fprintf('Count of r < 0.3        : %d\n', countLowBand);
fprintf('Count of 0.3 <= r < 0.5 : %d\n', countMidBand);
fprintf('Count of r >= 0.5       : %d\n', countHighBand);
fprintf('All counts add up to %d: %d (1 = true)\n', length(randomSamples), totalsMatch);
