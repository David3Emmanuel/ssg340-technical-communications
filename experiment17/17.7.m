fprintf('\n--- 17.7: Heat Conduction (Crank-Nicolson) ---\n');
rodLength = 1; endTime = 0.5;
numSpaceSteps = 20; numTimeSteps = 100;
spaceStep = rodLength/numSpaceSteps; timeStep = endTime/numTimeSteps;
diffusionRatio = timeStep/(2*spaceStep^2);   % assuming diffusivity = 1

spaceGrid = linspace(0, rodLength, numSpaceSteps+1);
temperature = zeros(numTimeSteps+1, numSpaceSteps+1);

% Initial condition
for nodeIdx = 1:numSpaceSteps+1
    if spaceGrid(nodeIdx) <= 0.5
        temperature(1,nodeIdx) = 2*spaceGrid(nodeIdx);
    else
        temperature(1,nodeIdx) = 2*(1 - spaceGrid(nodeIdx));
    end
end

implicitMatrix = diag(1+2*diffusionRatio*ones(numSpaceSteps-1,1)) + diag(-diffusionRatio*ones(numSpaceSteps-2,1),1) + diag(-diffusionRatio*ones(numSpaceSteps-2,1),-1);
explicitMatrix = diag(1-2*diffusionRatio*ones(numSpaceSteps-1,1)) + diag(diffusionRatio*ones(numSpaceSteps-2,1),1) + diag(diffusionRatio*ones(numSpaceSteps-2,1),-1);

for timeIdx = 1:numTimeSteps
    rightHandSide = explicitMatrix * temperature(timeIdx, 2:numSpaceSteps)';
    temperature(timeIdx+1, 2:numSpaceSteps) = (implicitMatrix \ rightHandSide)';
    temperature(timeIdx+1, 1) = 0;    % boundary u(0,t) = 0
    temperature(timeIdx+1, end) = 0;  % boundary u(1,t) = 0
end

figure;
surf(spaceGrid, linspace(0,endTime,numTimeSteps+1), temperature);
xlabel('x'); ylabel('t'); zlabel('u(x,t)');
title('Heat Conduction: Crank-Nicolson Method');
shading interp;
