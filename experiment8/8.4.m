%% 8.4 Experiment 4: Projectile Motion and Optimization (Using a While Loop)
fprintf('--- 8.4 Experiment 4: Projectile Motion and Optimization ---\n');

% Task 2: Prompt user for initial velocity and launch angle
u = input('Enter initial velocity (u) in m/s: ');
theta_deg = input('Enter launch angle (theta) in degrees: ');
theta = theta_deg * (pi / 180); % Convert to radians
g = 9.8;

% Task 3 & 4: Simulate flight and output trajectory 
t_proj = 0;
dt_proj = 0.05;
x = 0;
y = 0;

x_traj = x;
y_traj = y;

fprintf('\nTrajectory Data:\n');
fprintf('Time (s) | X Position (m) | Y Position (m)\n');
fprintf('------------------------------------------\n');

% While loop until it hits the ground
while y >= 0
    % Print current step
    fprintf('%8.2f | %14.2f | %14.2f\n', t_proj, x, y);
    
    % Update time and positions based on kinematic equations
    t_proj = t_proj + dt_proj;
    x = u * cos(theta) * t_proj;
    y = u * sin(theta) * t_proj - 0.5 * g * t_proj^2;
    
    % Append to arrays for plotting if above ground
    if y >= 0
        x_traj(end+1) = x;
        y_traj(end+1) = y;
    end
end

figure('Name', 'Experiment 4: Projectile Trajectory');
plot(x_traj, y_traj, 'r-', 'LineWidth', 2);
title(sprintf('Projectile Trajectory (u = %.1f m/s, \\theta = %.1f\\circ)', u, theta_deg));
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
grid on;

%% Optimization: Tasks 5, 6, 7
fprintf('\n--- Optimization Analysis (Tasks 5 & 6) ---\n');
angles_deg = 0:1:90;
ranges = zeros(size(angles_deg));
flight_times = zeros(size(angles_deg));

% Run simulation for various launch angles
for i = 1:length(angles_deg)
    ang_rad = angles_deg(i) * (pi / 180);
    
    % Analytical time of flight (when y = 0)
    t_end = (2 * u * sin(ang_rad)) / g;
    flight_times(i) = t_end;
    
    % Analytical max range
    ranges(i) = u * cos(ang_rad) * t_end;
end

% Task 5c: Identify max range
[max_R, idx_R] = max(ranges);
best_angle_R = angles_deg(idx_R);
fprintf('Max Range is %.2f m, achieved at a launch angle of %d degrees.\n', max_R, best_angle_R);

% Task 6b: Identify max flight time
[max_T, idx_T] = max(flight_times);
best_angle_T = angles_deg(idx_T);
fprintf('Max Flight Time is %.2f s, achieved at a launch angle of %d degrees.\n', max_T, best_angle_T);

% Task 7: Plot Range and Flight Time vs Launch Angle
figure('Name', 'Experiment 4: Range and Time vs Angle');
subplot(2, 1, 1);
plot(angles_deg, ranges, 'k-', 'LineWidth', 2);
title('Horizontal Range vs. Launch Angle');
xlabel('Launch Angle (degrees)');
ylabel('Range (m)');
grid on;

subplot(2, 1, 2);
plot(angles_deg, flight_times, 'm-', 'LineWidth', 2);
title('Time of Flight vs. Launch Angle');
xlabel('Launch Angle (degrees)');
ylabel('Time of Flight (s)');
grid on;

%% Task 8: Discussion of Trends (The Notes You Requested)
fprintf('\n--- Task 8: Discussion & Physics Explanation ---\n');
fprintf('1. Range Trend: The horizontal range increases as the launch angle goes from 0 to 45 degrees, peaks at exactly 45 degrees, and then decreases symmetrically back to zero as the angle approaches 90 degrees. \n');
fprintf('   Physics Reason: Range depends on both the horizontal velocity (which pushes it forward) and the vertical velocity (which keeps it in the air). The optimal balance between moving fast horizontally and staying in the air long enough occurs at 45 degrees, as derived from the formula R = (u^2 * sin(2*theta)) / g, where sin(90) = 1 is the maximum.\n\n');

fprintf('2. Time of Flight Trend: The time of flight increases continuously with the launch angle, reaching its absolute maximum at 90 degrees (shooting straight up).\n');
fprintf('   Physics Reason: Gravity only acts strictly in the vertical direction. Therefore, the time a projectile spends in the air depends entirely and only on its initial vertical velocity component (u * sin(theta)). Since sin(theta) is maximized at 90 degrees, shooting the projectile straight upwards keeps it fighting gravity for the longest possible duration.\n\n');