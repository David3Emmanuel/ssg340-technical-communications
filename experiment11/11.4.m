
%% 11.4 Experiment 4: Bubble Sort Implementation
disp('--- 11.4 Experiment 4: Bubble Sort ---');

% Small array to visualize sorting process
small_data = randi([1, 50], 1, 5);
fprintf('Original small array: '); disp(small_data);

n = length(small_data);
for i = 1:n-1
    for j = 1:n-i
        if small_data(j) > small_data(j+1)
            % Swap
            temp = small_data(j);
            small_data(j) = small_data(j+1);
            small_data(j+1) = temp;
        end
    end
    fprintf('After pass %d: ', i); disp(small_data);
end

% Large dataset comparison
large_data = rand(1, 1000);
data_for_bubble = large_data;
data_for_matlab = large_data;

% Bubble Sort timing
tic;
N = length(data_for_bubble);
for i = 1:N-1
    for j = 1:N-i
        if data_for_bubble(j) > data_for_bubble(j+1)
            temp = data_for_bubble(j);
            data_for_bubble(j) = data_for_bubble(j+1);
            data_for_bubble(j+1) = temp;
        end
    end
end
bubble_time = toc;

% MATLAB built-in sort timing
tic;
sorted_matlab = sort(data_for_matlab);
matlab_time = toc;

fprintf('\nPerformance Comparison (1000 elements):\n');
fprintf('Bubble Sort Time: %f seconds\n', bubble_time);
fprintf('MATLAB sort() Time: %f seconds\n', matlab_time);

