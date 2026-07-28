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



