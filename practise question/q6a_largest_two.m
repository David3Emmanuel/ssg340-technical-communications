arr = input('Enter numerical array: ');
n = length(arr);
largest = -Inf;
second = -Inf;
for i = 1:n
    if arr(i) > largest
        second = largest;
        largest = arr(i);
    elseif arr(i) < largest && arr(i) > second
        second = arr(i);
    end
end
if second == -Inf
    disp('Array does not contain at least two distinct elements.');
else
    fprintf('Largest: %g\n', largest);
    fprintf('Second Largest: %g\n', second);
end
