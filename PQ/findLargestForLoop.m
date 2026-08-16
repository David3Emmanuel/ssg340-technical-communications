%% Q3(a) [2023-24 paper]: Find the largest element in an array using a "for" loop
% This can be written either as a script or wrapped in a function
% (shown both ways — use whichever the question asks for).

%% ---- As a script ----
arr = [4, 17, 2, 89, 23, 56, 8];   % example array — replace with given/input data

largest = arr(1);           % assume first element is largest initially
for i = 2:length(arr)
    if arr(i) > largest
        largest = arr(i);
    end
end

fprintf('The largest element is: %d\n', largest);

%% ---- As a function (equivalent logic) ----
function largest = findLargestForLoop(arr)
% FINDLARGESTFORLOOP  Find largest element in a vector using a for loop.
    largest = arr(1);
    for i = 2:length(arr)
        if arr(i) > largest
            largest = arr(i);
        end
    end
end

% Test:
% findLargestForLoop([4, 17, 2, 89, 23, 56, 8])   % expect 89
