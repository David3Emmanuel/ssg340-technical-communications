%% Task 1: Rounding Error in Newton Quotient
fprintf('--- Task 1: Newton Quotient with Rounding Errors ---\n');
evalPoint = 2;
squareFunc = @(x) x^2;
stepSize = 1;

for iterCount = 1:10
    derivative = (squareFunc(evalPoint + stepSize) - squareFunc(evalPoint)) / stepSize;
    disp(['h = ', num2str(stepSize), ', Derivative = ', num2str(derivative)]);
    stepSize = stepSize / 10;   % reduce h by a factor of 10 each iteration
end

%% Task 2: Solving Simultaneous Equations with Rounding Errors
fprintf('\n--- Task 2: Simultaneous Equations with Rounding Errors ---\n');
coeffA = 0.2038;
coeffB = 0.1218;
constC = 0.2014;
coeffD = 0.4071;
coeffE = 0.2436;
constF = 0.4038;

% Solving using Cramer's rule (matches system: a*x + b*y = c; d*x + e*y = f_val)
solutionX = (constC*coeffE - coeffB*constF) / (coeffA*coeffE - coeffB*coeffD);
solutionY = (coeffA*constF - constC*coeffD) / (coeffA*coeffE - coeffB*coeffD);

disp(['x = ', num2str(solutionX)]);
disp(['y = ', num2str(solutionY)]);
