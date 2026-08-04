
%% 11.2 Experiment 2: Random Walk Simulation
disp('--- 11.2 Experiment 2: Random Walk ---');

stepCounts = [500, 1000];

figure('Name', '11.2 Random Walk Distributions');
for runIdx = 1:length(stepCounts)
    numSteps = stepCounts(runIdx);
    positions = zeros(1, numSteps + 1);
    positions(1) = 40; % Starting position

    for stepIdx = 1:numSteps
        if rand() < 0.5
            positions(stepIdx+1) = positions(stepIdx) - 1; % Left
        else
            positions(stepIdx+1) = positions(stepIdx) + 1; % Right
        end
    end

    % Frequency distribution
    minPosition = min(positions);
    maxPosition = max(positions);
    positionRange = minPosition:maxPosition;
    frequencies = zeros(size(positionRange));

    for binIdx = 1:length(positionRange)
        frequencies(binIdx) = sum(positions == positionRange(binIdx));
    end

    subplot(2, 1, runIdx);
    bar(positionRange, frequencies, 'FaceColor', [0.2 0.6 0.8]);
    title(sprintf('Ant Position Distribution after %d steps', numSteps));
    xlabel('Position (x)');
    ylabel('Frequency');
    grid on;
end
