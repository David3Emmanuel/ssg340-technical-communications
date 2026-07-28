fprintf('\n--- Task 4: Logical Vector Subsetting ---\n');
a = [-4 0 5 -3 0 3 7 -1 6];

positives = a(a > 0);
negatives = a(a < 0);
zeros_a   = a(a == 0);

disp('Positive elements:'); disp(positives);
disp('Negative elements:'); disp(negatives);
disp('Zero elements:');     disp(zeros_a);