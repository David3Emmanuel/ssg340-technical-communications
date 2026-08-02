%% 15.3 Experiment 3: Simulating a Random Walk
fprintf('\n--- 15.3 Experiment 3: Random Walk ---\n');

% 1. Initialize variables
num_walks = 1000;
ship_distance = 15; % Steps forward required to reach the ship
jetty_width = 3;    % Safe steps left/right before falling into the water
reached_ship = 0;

figure('Name', '15.3 Random Walk Trajectories');
hold on;

for i = 1:num_walks
    x = 0; % Lateral position (jetty width)
    y = 0; % Forward position (towards ship)
    x_traj = x; y_traj = y;
    
    % Walk until reaching the ship or falling off the jetty
    while y < ship_distance && abs(x) <= jetty_width
        % 2. Simulate movement (Forward, Left, Right)
        step = rand();
        if step < 0.40
            y = y + 1; % 40% chance to move forward
        elseif step < 0.70
            x = x - 1; % 30% chance to move left
        else
            x = x + 1; % 30% chance to move right
        end
        x_traj = [x_traj, x];
        y_traj = [y_traj, y];
    end
    
    if y == ship_distance
        reached_ship = reached_ship + 1;
    end
    
    % 4. Plot the trajectory (Plotting first 50 to avoid clutter)
    if i <= 50
        plot(x_traj, y_traj, 'Color', [0.5 0.5 0.5 0.3]);
    end
end

% Drawing the boundaries and the ship
plot([-jetty_width -jetty_width], [0 ship_distance], 'r--', 'LineWidth', 2);
plot([jetty_width jetty_width], [0 ship_distance], 'r--', 'LineWidth', 2);
plot([-jetty_width jetty_width], [ship_distance ship_distance], 'g-', 'LineWidth', 4);
title('Sailor Random Walk Trajectories (First 50 displayed)');
xlabel('Jetty Width (x)'); ylabel('Distance to Ship (y)');
hold off;

% 3 & 5. Estimate probability of reaching the ship
prob_reach = reached_ship / num_walks;
fprintf('Estimated probability of safely reaching the ship: %.4f\n\n', prob_reach);