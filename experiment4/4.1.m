

g = 9.8; % Gravity (m/s^2)

% Initialize Figure with 4 Subplots for comprehensive testing
figure('Name', 'Experiment 1: Comprehensive Projectile Motion Analysis', 'Position', [100, 100, 1000, 800]);

% =========================================================================
% 1. Standard Trajectory vs. Air Resistance Enhancement (Steps 2, 3, 5)
% =========================================================================
v0_std = 50;
theta_std_deg = 45;
theta_std = (pi / 180) * theta_std_deg;

t_max_std = (2 * v0_std * sin(theta_std)) / g;
t_std = linspace(0, t_max_std, 200);

x_std = v0_std .* cos(theta_std) .* t_std;
y_std = v0_std .* sin(theta_std) .* t_std - 0.5 .* g .* t_std.^2;

% Air Resistance (Euler Method)
m = 1.0;
b = 0.25;
dt = t_std(2) - t_std(1);

x_air = zeros(1, length(t_std));
y_air = zeros(1, length(t_std));
vx = v0_std * cos(theta_std);
vy = v0_std * sin(theta_std);

for i = 2:length(t_std)
    ax = -(b/m) * vx;
    ay = -g - (b/m) * vy;
    
    vx = vx + ax * dt;
    vy = vy + ay * dt;
    
    x_air(i) = x_air(i-1) + vx * dt;
    y_air(i) = y_air(i-1) + vy * dt;
    
    if y_air(i) < 0
        x_air = x_air(1:i);
        y_air = y_air(1:i);
        break;
    end
end

subplot(2, 2, 1);
plot(x_std, y_std, 'b-', 'LineWidth', 1.5);
hold on;
plot(x_air, y_air, 'r--', 'LineWidth', 1.5);
title('Standard vs Air Resistance (v_0=50, \theta=45°)');
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
legend('Standard', 'Air Resistance', 'Location', 'best');
grid on;
hold off;

% =========================================================================
% 2. Testing Varying Launch Angles (Step 4)
% =========================================================================
subplot(2, 2, 2);
hold on;
v0_constant = 50;
test_angles = [30, 45, 60, 75];

for i = 1:length(test_angles)
    theta = (pi / 180) * test_angles(i);
    t_max = (2 * v0_constant * sin(theta)) / g;
    t = linspace(0, t_max, 200);
    x = v0_constant .* cos(theta) .* t;
    y = v0_constant .* sin(theta) .* t - 0.5 .* g .* t.^2;
    plot(x, y, 'LineWidth', 1.5, 'DisplayName', sprintf('%d°', test_angles(i)));
end

title('Varying Launch Angles (v_0 = 50 m/s)');
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
legend('show', 'Location', 'best');
grid on;
hold off;

% =========================================================================
% 3. Testing Varying Initial Velocities (Step 4)
% =========================================================================
subplot(2, 2, 3);
hold on;
theta_constant_deg = 45;
theta_constant = (pi / 180) * theta_constant_deg;
test_velocities = [20, 30, 40, 50];

for i = 1:length(test_velocities)
    v0 = test_velocities(i);
    t_max = (2 * v0 * sin(theta_constant)) / g;
    t = linspace(0, t_max, 200);
    x = v0 .* cos(theta_constant) .* t;
    y = v0 .* sin(theta_constant) .* t - 0.5 .* g .* t.^2;
    plot(x, y, 'LineWidth', 1.5, 'DisplayName', sprintf('%d m/s', v0));
end

title('Varying Initial Velocities (\theta = 45°)');
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
legend('show', 'Location', 'best');
grid on;
hold off;

% =========================================================================
% 4. Testing Edge Cases
% =========================================================================
subplot(2, 2, 4);
hold on;

% Edge cases array setup: [Velocity, Angle_in_Degrees, Description]
edge_cases = {
    50, 90, '90° (Straight Up)';
    50, 0,  '0° (Horizontal)';
    0,  45, 'v_0 = 0 m/s'
};

for i = 1:size(edge_cases, 1)
    v0_edge = edge_cases{i, 1};
    theta_edge = (pi / 180) * edge_cases{i, 2};
    label = edge_cases{i, 3};
    
    % Adjust max time for visualization if it doesn't leave the ground
    if v0_edge == 0 || theta_edge == 0
        t_max_edge = 2; 
    else
        t_max_edge = (2 * v0_edge * sin(theta_edge)) / g;
    end
    
    t_edge = linspace(0, t_max_edge, 200);
    y_vals = v0_edge .* sin(theta_edge) .* t_edge - 0.5 .* g .* t_edge.^2;
    
    % Filter to only show trajectory above or equal to ground level
    valid_idx = y_vals >= 0;
    x = v0_edge .* cos(theta_edge) .* t_edge(valid_idx);
    y = y_vals(valid_idx);
    
    % If object never moves, plot a point at origin
    if isempty(x)
        x = 0; y = 0; 
    end
    
    plot(x, y, 'LineWidth', 1.5, 'DisplayName', label);
end

title('Edge Cases');
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
legend('show', 'Location', 'best');
grid on;
hold off;