positives = [];
val = input('Enter a value (negative to stop): ');
while val >= 0
    positives(end+1) = val;
    val = input('Enter a value (negative to stop): ');
end
if isempty(positives)
    disp('No positive values entered.');
else
    n = length(positives);
    total = sum(positives);
    meanVal = total/n;
    largest = -Inf;
    smallest = Inf;
    for i = 1:n
        if positives(i) > largest
            largest = positives(i);
        end
        if positives(i) < smallest
            smallest = positives(i);
        end
    end
    stdVal = std(positives);
    fprintf('Number of positive values: %d\n', n);
    fprintf('Mean: %g\n', meanVal);
    fprintf('Largest: %g\n', largest);
    fprintf('Smallest: %g\n', smallest);
    fprintf('Standard Deviation: %g\n', stdVal);
end
