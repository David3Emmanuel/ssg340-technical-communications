% 1. Define Initial Conditions
h0 = 100;
v0 = 0;
g = 9.8;
dt = 0.1;
t_max = 50; 

% Execute the function
[time_out, height_out, velocity_out] = free_fall(h0, v0, g, dt, t_max);

% 4. Plot the Results
figure;
plot(time_out, height_out, 'LineWidth', 1.5);
title('Free Fall Motion: Height vs Time');
xlabel('Time (s)');
ylabel('Height (m)');
grid on;

% 3. Create a Function for Free Fall Motion
function [time, height, velocity] = free_fall(h0, v0, g, dt, t_max)
    % Initialize time array
    time = 0:dt:t_max;
    n = length(time);
    
    height = zeros(1, n);
    velocity = zeros(1, n);
    
    % 2. Create a Loop to Simulate Motion
    for i = 1:n
        t = time(i);
        
        % Kinematic equations
        height(i) = h0 + v0*t - 0.5*g*t^2;
        velocity(i) = v0 - g*t;
        
        % Display the results at each time step
        fprintf('Time: %.1f s | Height: %.2f m | Velocity: %.2f m/s\n', t, height(i), velocity(i));
        
        % 5. Determine When the Object Hits the Ground
        if height(i) <= 0
            % Truncate the arrays to remove unused preallocated space
            time = time(1:i);
            height = height(1:i);
            velocity = velocity(1:i);
            break;
        end
    end
end