fprintf('\n--- Task 2: Vectorized Calculation of Loan Repayments ---\n');
A = 100000; 
n = 12;     

r_vals = [0.03, 0.05, 0.07]; 
k_vals = [10; 20; 30];       

[r, k] = meshgrid(r_vals, k_vals);

numerator = r .* A .* (1 + r./n).^(n.*k);
denominator = n .* ((1 + r./n).^(n.*k) - 1);
P = numerator ./ denominator;

disp('Loan Repayments Matrix:');
disp('          3% Rate       5% Rate       7% Rate');
fprintf('10 Yrs: %10.2f %13.2f %13.2f\n', P(1,1), P(1,2), P(1,3));
fprintf('20 Yrs: %10.2f %13.2f %13.2f\n', P(2,1), P(2,2), P(2,3));
fprintf('30 Yrs: %10.2f %13.2f %13.2f\n', P(3,1), P(3,2), P(3,3));


