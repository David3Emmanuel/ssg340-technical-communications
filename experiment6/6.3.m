%% Task 1: Replacing if-elseif with Logical Vectors
fprintf('--- Task 1: Tax Bands using Logical Vectors ---\n');
incomes = [5000, 15000, 25000, 8000, 18000, 30000]; % Example array of incomes
tax = zeros(size(incomes));                          % pre-allocate the result array

idx1 = incomes <= 10000;                             % band 1: 10% on everything
tax(idx1) = 0.10 .* incomes(idx1);

idx2 = incomes > 10000 & incomes <= 20000;           % band 2: 1000 + 20% above 10000
tax(idx2) = 1000 + 0.20 .* (incomes(idx2) - 10000);

idx3 = incomes > 20000;                              % band 3: 3000 + 50% above 20000
tax(idx3) = 3000 + 0.50 .* (incomes(idx3) - 20000);

disp('Incomes:');
disp(incomes);
disp('Tax payable:');
disp(tax);

%% Task 2: Vectorized Calculation of Loan Repayments
fprintf('\n--- Task 2: Loan Repayments ---\n');
A = 100000; % Example loan amount
n = 12;     % Monthly payments

% Define arrays for interest rates (r) and loan terms in years (k)
r_vals = [0.03, 0.05, 0.07]; % Example rates: 3%, 5%, 7%
k_vals = [10; 20; 30];       % Example terms: 10, 20, 30 years

[r, k] = meshgrid(r_vals, k_vals);   % build a grid so every rate meets every term

numerator = r .* A .* (1 + r./n).^(n.*k);
denominator = n .* ((1 + r./n).^(n.*k) - 1);
P = numerator ./ denominator;        % element-wise: one repayment per (r, k) pair

disp('Task 2: Loan Repayments (Rows = k terms, Columns = r rates)');
disp(P);

%% Task 3: Simulating Random Numbers for Statistical Analysis
fprintf('\n--- Task 3: Random Number Statistics ---\n');
r_rand = rand(1, 10000);                      % 10000 uniform random numbers in [0,1)

count_less_half = sum(r_rand < 0.5);          % sum of logicals = number of trues
proportion = count_less_half / length(r_rand);
expected_value = 0.5;                          % theoretical proportion below 0.5

fprintf('Task 3: Count less than 0.5 = %d\n', count_less_half);
fprintf('Proportion = %.4f (Expected = %.1f)\n', proportion, expected_value);

%% Task 4: Efficient Filtering with Logical Indexing
fprintf('\n--- Task 4: Efficient Filtering ---\n');
M = rand(10, 10);                 % 10x10 matrix of random values

lowCount  = sum(M(:) < 0.2);      % how many values will be pulled down to 0
highCount = sum(M(:) > 0.8);      % how many values will be pushed up to 1

M(M < 0.2) = 0;                   % clip small values to 0
M(M > 0.8) = 1;                   % clip large values to 1

fprintf('Values set to 0 (were < 0.2): %d\n', lowCount);
fprintf('Values set to 1 (were > 0.8): %d\n', highCount);
disp('Filtered matrix M:');
disp(M);
