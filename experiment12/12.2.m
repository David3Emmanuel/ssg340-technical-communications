%% Task 1: Lorenz System Definition + Task 2-5: Animate
sigmaParam = 10; rhoParam = 28; betaParam = 8/3;
timeStep = 0.01;
numSteps = 5000;

lorenzX = zeros(1, numSteps); lorenzY = zeros(1, numSteps); lorenzZ = zeros(1, numSteps);
lorenzX(1) = 1; lorenzY(1) = 1; lorenzZ(1) = 1;   % initial conditions [1,1,1]

for stepIdx = 1:numSteps-1
    deltaX = sigmaParam * (lorenzY(stepIdx) - lorenzX(stepIdx));
    deltaY = lorenzX(stepIdx) * (rhoParam - lorenzZ(stepIdx)) - lorenzY(stepIdx);
    deltaZ = lorenzX(stepIdx)*lorenzY(stepIdx) - betaParam*lorenzZ(stepIdx);

    lorenzX(stepIdx+1) = lorenzX(stepIdx) + deltaX*timeStep;
    lorenzY(stepIdx+1) = lorenzY(stepIdx) + deltaY*timeStep;
    lorenzZ(stepIdx+1) = lorenzZ(stepIdx) + deltaZ*timeStep;
end

figure;
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
title('Lorenz Attractor Animation');
grid on; hold on;
view(3);

traceHandle = plot3(lorenzX(1), lorenzY(1), lorenzZ(1), 'b', 'LineWidth', 1);

for frameIdx = 1:500:numSteps   % update every 500 points as instructed
    randColor = rand(1,3);
    set(traceHandle, 'XData', lorenzX(1:frameIdx), 'YData', lorenzY(1:frameIdx), 'ZData', lorenzZ(1:frameIdx), 'Color', randColor);
    drawnow;
end

%% Task 6: Save the Animation
savefig(gcf, 'lorenz_attractor.fig');
print(gcf, 'lorenz_final.jpg', '-djpeg');
