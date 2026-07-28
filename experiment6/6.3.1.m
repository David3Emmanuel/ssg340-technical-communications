fprintf('--- Task 1: Replacing if-elseif with Logical Vectors ---\n');
incomes = [5000, 15000, 25000, 8000, 18000, 30000]; 
tax = zeros(size(incomes));

idx1 = incomes <= 10000;
tax(idx1) = 0.10 .* incomes(idx1);

idx2 = incomes > 10000 & incomes <= 20000;
tax(idx2) = 1000 + 0.20 .* (incomes(idx2) - 10000);

idx3 = incomes > 20000;
tax(idx3) = 3000 + 0.50 .* (incomes(idx3) - 20000);

disp('Income vs Tax:');
for i = 1:length(incomes)
    fprintf('Income: $%5d | Tax: $%.2f\n', incomes(i), tax(i));
end


