fprintf('\n--- 17.3: Trapezoidal Rule ---\n');
squareFunc = @(x) x.^2;
lowerLimit = 0; upperLimit = 4; stepSize = 1;
sampleX = lowerLimit:stepSize:upperLimit;
sampleY = squareFunc(sampleX);

trapezoidalResult = stepSize * (0.5*sampleY(1) + sum(sampleY(2:end-1)) + 0.5*sampleY(end));
exactResult = (upperLimit^3 - lowerLimit^3)/3;

fprintf('Trapezoidal approximation: %.6f\n', trapezoidalResult);
fprintf('Exact solution: %.6f\n', exactResult);
fprintf('Error: %.6f\n', abs(exactResult - trapezoidalResult));
