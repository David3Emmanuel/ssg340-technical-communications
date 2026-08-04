%% Task 1: Binomial Coefficient Calculation (For Loop)
fprintf('--- Task 1: Binomial Coefficient ---\n');
topValue = input('Enter value of n (0 to 170): ');
chooseValue = input('Enter value of r (0 to n): ');

binomCoeff = 1;
for termIdx = 0:(chooseValue-1)
    binomCoeff = binomCoeff * (topValue - termIdx);
end
binomCoeff = binomCoeff / factorial(chooseValue);

fprintf('C(%d, %d) = %d\n', topValue, chooseValue, binomCoeff);

%% Task 2: Modeling Temperature Change (While Loop)
fprintf('\n--- Task 2: Temperature Change Simulation ---\n');
currentTemp = input('Enter initial temperature T (C, e.g. 0 to 100): ');
ambientTemp = input('Enter ambient temperature F (C, e.g. 0 to 100): ');
coolingConst = input('Enter cooling rate constant K (0 to 1, e.g. 0.05): ');
coolStep = input('Enter time step dt in minutes (must be > 0, e.g. 1): ');
elapsedMinutes = 0;

while abs(currentTemp - ambientTemp) > 0.5
    currentTemp = currentTemp - coolingConst * (currentTemp - ambientTemp) * coolStep;
    elapsedMinutes = elapsedMinutes + coolStep;
    fprintf('t = %.1f min, T = %.2f C\n', elapsedMinutes, currentTemp);
end
fprintf('Temperature reached ambient after %.1f minutes\n', elapsedMinutes);

%% Task 3: Projectile Motion Simulation (While Loop)
fprintf('\n--- Task 3: Projectile Motion ---\n');
launchSpeed = input('Enter initial velocity u in m/s (must be > 0, e.g. 60): ');
launchAngleDeg = input('Enter launch angle in degrees (0 to 90): ');
launchAngleRad = deg2rad(launchAngleDeg);
gravity = 9.8;

velocityX = launchSpeed * cos(launchAngleRad);
velocityY = launchSpeed * sin(launchAngleRad);

flightTime = 0;
flightStep = 0.1;
posX = 0;
posY = 0;

while posY >= 0
    flightTime = flightTime + flightStep;
    posX = velocityX * flightTime;
    posY = velocityY * flightTime - 0.5 * gravity * flightTime^2;
end

fprintf('Projectile hit the ground at t = %.2f s, x = %.2f m\n', flightTime, posX);

%% Task 4: Numerical Approximation of Pi Using a Series (For Loop)
fprintf('\n--- Task 4: Pi Approximation via Series ---\n');
numTerms = input('Enter number of terms n (must be > 0, e.g. 10000): ');

seriesSum = 0;
for termIdx = 0:(numTerms-1)
    seriesSum = seriesSum + ((-1)^termIdx) / (2*termIdx + 1);
end
piApprox = 4 * seriesSum;

fprintf('Approximated pi with %d terms: %.6f\n', numTerms, piApprox);
fprintf('MATLAB built-in pi: %.6f\n', pi);
fprintf('Difference: %.6f\n', abs(pi - piApprox));

%% Task 5: Determining Doubling Time for an Investment (While Loop)
fprintf('\n--- Task 5: Investment Doubling Time ---\n');
startingAmount = input('Enter initial investment amount (must be > 0, e.g. 1000): ');
interestRate = input('Enter annual interest rate as decimal (0 to 1, e.g. 0.05): ');
targetAmount = 2 * startingAmount;
runningBalance = startingAmount;
yearCount = 0;

while runningBalance < targetAmount
    runningBalance = runningBalance * (1 + interestRate);
    yearCount = yearCount + 1;
end

fprintf('Investment doubled after %d years (balance = %.2f)\n', yearCount, runningBalance);
