

gravity = 9.8; % Gravity (m/s^2)

% Initialize Figure with 4 Subplots for comprehensive testing
figure('Name', 'Experiment 1: Comprehensive Projectile Motion Analysis', 'Position', [100, 100, 1000, 800]);

% =========================================================================
% 1. Standard Trajectory vs. Air Resistance Enhancement (Steps 2, 3, 5)
% =========================================================================
baseVelocity = 50;
baseAngleDeg = 45;
baseAngleRad = (pi / 180) * baseAngleDeg;

flightTimeBase = (2 * baseVelocity * sin(baseAngleRad)) / gravity;
timeBase = linspace(0, flightTimeBase, 200);

xBase = baseVelocity .* cos(baseAngleRad) .* timeBase;
yBase = baseVelocity .* sin(baseAngleRad) .* timeBase - 0.5 .* gravity .* timeBase.^2;

% Air Resistance (Euler Method)
mass = 1.0;
dragCoeff = 0.25;
timeStep = timeBase(2) - timeBase(1);

xDrag = zeros(1, length(timeBase));
yDrag = zeros(1, length(timeBase));
velX = baseVelocity * cos(baseAngleRad);
velY = baseVelocity * sin(baseAngleRad);

for stepIdx = 2:length(timeBase)
    accelX = -(dragCoeff/mass) * velX;
    accelY = -gravity - (dragCoeff/mass) * velY;

    velX = velX + accelX * timeStep;
    velY = velY + accelY * timeStep;

    xDrag(stepIdx) = xDrag(stepIdx-1) + velX * timeStep;
    yDrag(stepIdx) = yDrag(stepIdx-1) + velY * timeStep;

    if yDrag(stepIdx) < 0
        xDrag = xDrag(1:stepIdx);
        yDrag = yDrag(1:stepIdx);
        break;
    end
end

subplot(2, 2, 1);
plot(xBase, yBase, 'b-', 'LineWidth', 1.5);
hold on;
plot(xDrag, yDrag, 'r--', 'LineWidth', 1.5);
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
fixedVelocity = 50;
angleSweepDeg = [30, 45, 60, 75];

for sweepIdx = 1:length(angleSweepDeg)
    sweepAngleRad = (pi / 180) * angleSweepDeg(sweepIdx);
    sweepFlightTime = (2 * fixedVelocity * sin(sweepAngleRad)) / gravity;
    sweepTime = linspace(0, sweepFlightTime, 200);
    sweepX = fixedVelocity .* cos(sweepAngleRad) .* sweepTime;
    sweepY = fixedVelocity .* sin(sweepAngleRad) .* sweepTime - 0.5 .* gravity .* sweepTime.^2;
    plot(sweepX, sweepY, 'LineWidth', 1.5, 'DisplayName', sprintf('%d°', angleSweepDeg(sweepIdx)));
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
fixedAngleDeg = 45;
fixedAngleRad = (pi / 180) * fixedAngleDeg;
velocitySweep = [20, 30, 40, 50];

for velIdx = 1:length(velocitySweep)
    currentVelocity = velocitySweep(velIdx);
    velFlightTime = (2 * currentVelocity * sin(fixedAngleRad)) / gravity;
    velTime = linspace(0, velFlightTime, 200);
    velTrajX = currentVelocity .* cos(fixedAngleRad) .* velTime;
    velTrajY = currentVelocity .* sin(fixedAngleRad) .* velTime - 0.5 .* gravity .* velTime.^2;
    plot(velTrajX, velTrajY, 'LineWidth', 1.5, 'DisplayName', sprintf('%d m/s', currentVelocity));
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
edgeCases = {
    50, 90, '90° (Straight Up)';
    50, 0,  '0° (Horizontal)';
    0,  45, 'v_0 = 0 m/s'
};

for edgeIdx = 1:size(edgeCases, 1)
    edgeVelocity = edgeCases{edgeIdx, 1};
    edgeAngleRad = (pi / 180) * edgeCases{edgeIdx, 2};
    edgeLabel = edgeCases{edgeIdx, 3};

    % Adjust max time for visualization if it doesn't leave the ground
    if edgeVelocity == 0 || edgeAngleRad == 0
        edgeFlightTime = 2;
    else
        edgeFlightTime = (2 * edgeVelocity * sin(edgeAngleRad)) / gravity;
    end

    edgeTime = linspace(0, edgeFlightTime, 200);
    edgeHeights = edgeVelocity .* sin(edgeAngleRad) .* edgeTime - 0.5 .* gravity .* edgeTime.^2;

    % Filter to only show trajectory above or equal to ground level
    aboveGround = edgeHeights >= 0;
    edgeX = edgeVelocity .* cos(edgeAngleRad) .* edgeTime(aboveGround);
    edgeY = edgeHeights(aboveGround);

    % If object never moves, plot a point at origin
    if isempty(edgeX)
        edgeX = 0; edgeY = 0;
    end

    plot(edgeX, edgeY, 'LineWidth', 1.5, 'DisplayName', edgeLabel);
end

title('Edge Cases');
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
legend('show', 'Location', 'best');
grid on;
hold off;
