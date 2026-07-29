
%% 11.2 Experiment 2: Random Walk Simulation
disp('--- 11.2 Experiment 2: Random Walk ---');

steps_array = [500, 1000];

figure('Name', '11.2 Random Walk Distributions');
for i = 1:length(steps_array)
    num_steps = steps_array(i);
    positions = zeros(1, num_steps + 1);
    positions(1) = 40; % Starting position
    
    for s = 1:num_steps
        if rand() < 0.5
            positions(s+1) = positions(s) - 1; % Left
        else
            positions(s+1) = positions(s) + 1; % Right
        end
    end
    
    % Frequency distribution
    min_pos = min(positions);
    max_pos = max(positions);
    pos_range = min_pos:max_pos;
    freq = zeros(size(pos_range));
    
    for p = 1:length(pos_range)
        freq(p) = sum(positions == pos_range(p));
    end
    
    subplot(2, 1, i);
    bar(pos_range, freq, 'FaceColor', [0.2 0.6 0.8]);
    title(sprintf('Ant Position Distribution after %d steps', num_steps));
    xlabel('Position (x)');
    ylabel('Frequency');
    grid on;
end
