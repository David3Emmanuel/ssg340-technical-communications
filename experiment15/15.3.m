%% 15.3 Experiment 3: Simulating a Random Walk
fprintf('\n--- 15.3 Experiment 3: Random Walk ---\n');

% 1. Initialize variables
numWalks = 1000;
shipDistance = 15; % Steps forward required to reach the ship
jettyWidth = 3;    % Safe steps left/right before falling into the water
successCount = 0;

figure('Name', '15.3 Random Walk Trajectories');
hold on;

for walkIdx = 1:numWalks
    lateralPos = 0; % Lateral position (jetty width)
    forwardPos = 0; % Forward position (towards ship)
    lateralPath = lateralPos; forwardPath = forwardPos;

    % Walk until reaching the ship or falling off the jetty
    while forwardPos < shipDistance && abs(lateralPos) <= jettyWidth
        % 2. Simulate movement (Forward, Left, Right)
        stepDraw = rand();
        if stepDraw < 0.40
            forwardPos = forwardPos + 1; % 40% chance to move forward
        elseif stepDraw < 0.70
            lateralPos = lateralPos - 1; % 30% chance to move left
        else
            lateralPos = lateralPos + 1; % 30% chance to move right
        end
        lateralPath = [lateralPath, lateralPos];
        forwardPath = [forwardPath, forwardPos];
    end

    if forwardPos == shipDistance
        successCount = successCount + 1;
    end

    % 4. Plot the trajectory (Plotting first 50 to avoid clutter)
    if walkIdx <= 50
        plot(lateralPath, forwardPath, 'Color', [0.5 0.5 0.5 0.3]);
    end
end

% Drawing the boundaries and the ship
plot([-jettyWidth -jettyWidth], [0 shipDistance], 'r--', 'LineWidth', 2);
plot([jettyWidth jettyWidth], [0 shipDistance], 'r--', 'LineWidth', 2);
plot([-jettyWidth jettyWidth], [shipDistance shipDistance], 'g-', 'LineWidth', 4);
title('Sailor Random Walk Trajectories (First 50 displayed)');
xlabel('Jetty Width (x)'); ylabel('Distance to Ship (y)');
hold off;

% 3 & 5. Estimate probability of reaching the ship
successProbability = successCount / numWalks;
fprintf('Estimated probability of safely reaching the ship: %.4f\n\n', successProbability);
