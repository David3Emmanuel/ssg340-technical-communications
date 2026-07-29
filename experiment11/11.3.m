

%% 11.3 Experiment 3: Histogram and Data Visualization
disp('--- 11.3 Experiment 3: Histogram ---');

% Generate random student marks
marks = randi([0, 100], 1, 150);
bins = [10, 20];

figure('Name', '11.3 Histogram and Data Visualization');
for i = 1:length(bins)
    num_bins = bins(i);
    
    % Using hist() to get counts and centers as per manual hints
    [counts, centers] = hist(marks, num_bins);
    
    subplot(2, 1, i);
    bar(centers, counts, 'FaceColor', [0.8 0.4 0.2]);
    title(sprintf('Student Marks Distribution (%d bins)', num_bins));
    xlabel('Mark Ranges');
    ylabel('Frequency');
    grid on;
    
    fprintf('\nFrequency Table for %d bins:\n', num_bins);
    fprintf('Bin Center | Frequency\n');
    fprintf('----------------------\n');
    for j = 1:length(centers)
        fprintf('%10.2f | %9d\n', centers(j), counts(j));
    end
end

