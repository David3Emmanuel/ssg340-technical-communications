%% Task 1: Logical Indexing of a Vector
fprintf('--- Task 1: Logical Indexing ---\n');
a = [1, 4, 7, 10, 12];
disp('Vector a:');
disp(a);

elements_greater_than_5 = a(a > 5);          % keep only elements larger than 5
elements_divisible_by_2 = a(mod(a, 2) == 0); % keep only even elements
count_greater_or_equal_to_5 = sum(a >= 5);   % sum of a logical vector = count of trues

disp('Elements greater than 5:');
disp(elements_greater_than_5);
disp('Elements divisible by 2:');
disp(elements_divisible_by_2);
fprintf('Count of elements >= 5: %d\n', count_greater_or_equal_to_5);

%% Task 2: Avoiding Division by Zero with Logical Indexing
fprintf('\n--- Task 2: Sinc Function without Division by Zero ---\n');
x = -4*pi:pi/20:4*pi;
x(x == 0) = eps;    % replace exact zeros with eps so sin(x)./x stays finite
y = sin(x) ./ x;    % element-wise division

fprintf('Number of sample points: %d\n', length(x));
fprintf('Maximum value of y: %.4f\n', max(y));
fprintf('Minimum value of y: %.4f\n', min(y));

%% Task 3: Plotting a Discontinuous Function
fprintf('\n--- Task 3: Discontinuous Function ---\n');
x_func = -4*pi:pi/20:4*pi;
y_func = sin(x_func);
y_func(y_func <= 0) = 0;   % clip all negative values to zero (half-wave rectifier)

figure;
plot(x_func, y_func, 'LineWidth', 1.5);
title('Discontinuous Function y(x)');
xlabel('x');
ylabel('y(x)');
grid on;

fprintf('Number of clipped (zero) points: %d\n', sum(y_func == 0));

%% Task 4: Counting Random Numbers in Ranges
fprintf('\n--- Task 4: Counting Random Numbers ---\n');
r = rand(1, 1000);
count_less_0_3 = sum(r < 0.3);              % values below 0.3
count_greater_equal_0_5 = sum(r >= 0.5);    % values at or above 0.5

count_mid = sum(r >= 0.3 & r < 0.5);        % values in the middle band [0.3, 0.5)
% the three ranges are mutually exclusive, so their counts must total 1000
total_sum_check = (count_less_0_3 + count_mid + count_greater_equal_0_5) == length(r);

fprintf('Count of r < 0.3        : %d\n', count_less_0_3);
fprintf('Count of 0.3 <= r < 0.5 : %d\n', count_mid);
fprintf('Count of r >= 0.5       : %d\n', count_greater_equal_0_5);
fprintf('All counts add up to %d: %d (1 = true)\n', length(r), total_sum_check);
