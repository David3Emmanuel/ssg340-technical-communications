

%% 11.3 Experiment 3: Histogram and Data Visualization
disp('--- 11.3 Experiment 3: Histogram ---');

% Generate random student marks
studentMarks = randi([0, 100], 1, 150);
binCounts = [10, 20];

figure('Name', '11.3 Histogram and Data Visualization');
for binSetIdx = 1:length(binCounts)
    numBins = binCounts(binSetIdx);

    % Using hist() to get counts and centers as per manual hints
    [binFrequencies, binCenters] = hist(studentMarks, numBins);

    subplot(2, 1, binSetIdx);
    bar(binCenters, binFrequencies, 'FaceColor', [0.8 0.4 0.2]);
    title(sprintf('Student Marks Distribution (%d bins)', numBins));
    xlabel('Mark Ranges');
    ylabel('Frequency');
    grid on;

    fprintf('\nFrequency Table for %d bins:\n', numBins);
    fprintf('Bin Center | Frequency\n');
    fprintf('----------------------\n');
    for rowIdx = 1:length(binCenters)
        fprintf('%10.2f | %9d\n', binCenters(rowIdx), binFrequencies(rowIdx));
    end
end

