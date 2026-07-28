fprintf('\n--- Task 4: Efficient Filtering with Logical Indexing ---\n');
M = rand(10, 10);
disp('Original Matrix M (First 3x3 block):');
disp(M(1:3, 1:3));

M(M < 0.2) = 0;
M(M > 0.8) = 1;

disp('Modified Matrix M (Full 10x10):');
disp(M);