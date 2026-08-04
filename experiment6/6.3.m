%% Task 1: Replacing if-elseif with Logical Vectors
fprintf('--- Task 1: Tax Bands using Logical Vectors ---\n');
incomes = [5000, 15000, 25000, 8000, 18000, 30000]; % Example array of incomes
taxDue = zeros(size(incomes));                       % pre-allocate the result array

bandOne = incomes <= 10000;                          % band 1: 10% on everything
taxDue(bandOne) = 0.10 .* incomes(bandOne);

bandTwo = incomes > 10000 & incomes <= 20000;        % band 2: 1000 + 20% above 10000
taxDue(bandTwo) = 1000 + 0.20 .* (incomes(bandTwo) - 10000);

bandThree = incomes > 20000;                         % band 3: 3000 + 50% above 20000
taxDue(bandThree) = 3000 + 0.50 .* (incomes(bandThree) - 20000);

disp('Incomes:');
disp(incomes);
disp('Tax payable:');
disp(taxDue);

%% Task 2: Vectorized Calculation of Loan Repayments
fprintf('\n--- Task 2: Loan Repayments ---\n');
loanAmount = 100000; % Example loan amount
paymentsPerYear = 12;     % Monthly payments

% Define arrays for interest rates (r) and loan terms in years (k)
rateList = [0.03, 0.05, 0.07]; % Example rates: 3%, 5%, 7%
termList = [10; 20; 30];       % Example terms: 10, 20, 30 years

[rateGrid, termGrid] = meshgrid(rateList, termList);   % build a grid so every rate meets every term

repayNumerator = rateGrid .* loanAmount .* (1 + rateGrid./paymentsPerYear).^(paymentsPerYear.*termGrid);
repayDenominator = paymentsPerYear .* ((1 + rateGrid./paymentsPerYear).^(paymentsPerYear.*termGrid) - 1);
monthlyRepayment = repayNumerator ./ repayDenominator;        % element-wise: one repayment per (r, k) pair

disp('Task 2: Loan Repayments (Rows = k terms, Columns = r rates)');
disp(monthlyRepayment);

%% Task 3: Simulating Random Numbers for Statistical Analysis
fprintf('\n--- Task 3: Random Number Statistics ---\n');
randomSamples = rand(1, 10000);                      % 10000 uniform random numbers in [0,1)

countBelowHalf = sum(randomSamples < 0.5);           % sum of logicals = number of trues
observedShare = countBelowHalf / length(randomSamples);
expectedShare = 0.5;                                 % theoretical proportion below 0.5

fprintf('Task 3: Count less than 0.5 = %d\n', countBelowHalf);
fprintf('Proportion = %.4f (Expected = %.1f)\n', observedShare, expectedShare);

%% Task 4: Efficient Filtering with Logical Indexing
fprintf('\n--- Task 4: Efficient Filtering ---\n');
randomMatrix = rand(10, 10);                 % 10x10 matrix of random values

lowCount  = sum(randomMatrix(:) < 0.2);      % how many values will be pulled down to 0
highCount = sum(randomMatrix(:) > 0.8);      % how many values will be pushed up to 1

randomMatrix(randomMatrix < 0.2) = 0;        % clip small values to 0
randomMatrix(randomMatrix > 0.8) = 1;        % clip large values to 1

fprintf('Values set to 0 (were < 0.2): %d\n', lowCount);
fprintf('Values set to 1 (were > 0.8): %d\n', highCount);
disp('Filtered matrix randomMatrix:');
disp(randomMatrix);
