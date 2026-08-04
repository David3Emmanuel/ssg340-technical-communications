% 1. Define Initial Conditions
initialHeight = 100;
initialVelocity = 0;
gravity = 9.8;
timeStep = 0.1;
maxTime = 50;

% Execute the function
[timeData, heightData, velocityData] = freeFall(initialHeight, initialVelocity, gravity, timeStep, maxTime);

% 4. Plot the Results
figure;
plot(timeData, heightData, 'LineWidth', 1.5);
title('Free Fall Motion: Height vs Time');
xlabel('Time (s)');
ylabel('Height (m)');
grid on;

% 3. Create a Function for Free Fall Motion
function [timeArray, heightArray, velocityArray] = freeFall(startHeight, startVelocity, gravity, timeStep, maxTime)
    % Initialize time array
    timeArray = 0:timeStep:maxTime;
    numSteps = length(timeArray);

    heightArray = zeros(1, numSteps);
    velocityArray = zeros(1, numSteps);

    % 2. Create a Loop to Simulate Motion
    for stepIdx = 1:numSteps
        currentTime = timeArray(stepIdx);

        % Kinematic equations
        heightArray(stepIdx) = startHeight + startVelocity*currentTime - 0.5*gravity*currentTime^2;
        velocityArray(stepIdx) = startVelocity - gravity*currentTime;

        % Display the results at each time step
        fprintf('Time: %.1f s | Height: %.2f m | Velocity: %.2f m/s\n', currentTime, heightArray(stepIdx), velocityArray(stepIdx));

        % 5. Determine When the Object Hits the Ground
        if heightArray(stepIdx) <= 0
            % Truncate the arrays to remove unused preallocated space
            timeArray = timeArray(1:stepIdx);
            heightArray = heightArray(1:stepIdx);
            velocityArray = velocityArray(1:stepIdx);
            break;
        end
    end
end
