arr = input('Enter numerical array: ');
n = length(arr);
largestMag = -1;
pos = 0;
for i = 1:n
    if arr(i) < 0
        magnitude = -arr(i);
    else
        magnitude = arr(i);
    end
    if magnitude > largestMag
        largestMag = magnitude;
        pos = i;
    end
end
fprintf('Element with largest magnitude: %g\n', arr(pos));
fprintf('Position: %d\n', pos);
