
%% 11.4 Experiment 4: Bubble Sort Implementation
disp('--- 11.4 Experiment 4: Bubble Sort ---');

% Small array to visualize sorting process
smallArray = randi([1, 50], 1, 5);
fprintf('Original small array: '); disp(smallArray);

smallLength = length(smallArray);
for passIdx = 1:smallLength-1
    for compareIdx = 1:smallLength-passIdx
        if smallArray(compareIdx) > smallArray(compareIdx+1)
            % Swap
            swapHolder = smallArray(compareIdx);
            smallArray(compareIdx) = smallArray(compareIdx+1);
            smallArray(compareIdx+1) = swapHolder;
        end
    end
    fprintf('After pass %d: ', passIdx); disp(smallArray);
end

% Large dataset comparison
sourceData = rand(1, 1000);
bubbleData = sourceData;
builtinData = sourceData;

% Bubble Sort timing
tic;
bubbleLength = length(bubbleData);
for passIdx = 1:bubbleLength-1
    for compareIdx = 1:bubbleLength-passIdx
        if bubbleData(compareIdx) > bubbleData(compareIdx+1)
            swapHolder = bubbleData(compareIdx);
            bubbleData(compareIdx) = bubbleData(compareIdx+1);
            bubbleData(compareIdx+1) = swapHolder;
        end
    end
end
bubbleElapsed = toc;

% MATLAB built-in sort timing
tic;
builtinSorted = sort(builtinData);
builtinElapsed = toc;

fprintf('\nPerformance Comparison (1000 elements):\n');
fprintf('Bubble Sort Time: %f seconds\n', bubbleElapsed);
fprintf('MATLAB sort() Time: %f seconds\n', builtinElapsed);

