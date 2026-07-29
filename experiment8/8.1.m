%% Task 1: Binomial Coefficient Calculation (For Loop)
fprintf('--- Task 1: Binomial Coefficient ---\n');
n = input('Enter value of n (0 to 170): ');
r = input('Enter value of r (0 to n): ');

C = 1;
for k = 0:(r-1)
    C = C * (n - k);
end
C = C / factorial(r);

fprintf('C(%d, %d) = %d\n', n, r, C);

%% Task 2: Modeling Temperature Change (While Loop)
fprintf('\n--- Task 2: Temperature Change Simulation ---\n');
T = input('Enter initial temperature T (C, e.g. 0 to 100): ');
F = input('Enter ambient temperature F (C, e.g. 0 to 100): ');
K = input('Enter cooling rate constant K (0 to 1, e.g. 0.05): ');
dt = input('Enter time step dt in minutes (must be > 0, e.g. 1): ');
t = 0;

while abs(T - F) > 0.5
    T = T - K * (T - F) * dt;
    t = t + dt;
    fprintf('t = %.1f min, T = %.2f C\n', t, T);
end
fprintf('Temperature reached ambient after %.1f minutes\n', t);

%% Task 3: Projectile Motion Simulation (While Loop)
fprintf('\n--- Task 3: Projectile Motion ---\n');
u = input('Enter initial velocity u in m/s (must be > 0, e.g. 60): ');
angleDeg = input('Enter launch angle in degrees (0 to 90): ');
theta = deg2rad(angleDeg);
g = 9.8;

vx = u * cos(theta);
vy = u * sin(theta);

t = 0;
dt = 0.1;
x = 0;
y = 0;

while y >= 0
    t = t + dt;
    x = vx * t;
    y = vy * t - 0.5 * g * t^2;
end

fprintf('Projectile hit the ground at t = %.2f s, x = %.2f m\n', t, x);

%% Task 4: Numerical Approximation of Pi Using a Series (For Loop)
fprintf('\n--- Task 4: Pi Approximation via Series ---\n');
n_terms = input('Enter number of terms n (must be > 0, e.g. 10000): ');

piSum = 0;
for k = 0:(n_terms-1)
    piSum = piSum + ((-1)^k) / (2*k + 1);
end
piApprox = 4 * piSum;

fprintf('Approximated pi with %d terms: %.6f\n', n_terms, piApprox);
fprintf('MATLAB built-in pi: %.6f\n', pi);
fprintf('Difference: %.6f\n', abs(pi - piApprox));

%% Task 5: Determining Doubling Time for an Investment (While Loop)
fprintf('\n--- Task 5: Investment Doubling Time ---\n');
initial = input('Enter initial investment amount (must be > 0, e.g. 1000): ');
rate = input('Enter annual interest rate as decimal (0 to 1, e.g. 0.05): ');
target = 2 * initial;
balance = initial;
years = 0;

while balance < target
    balance = balance * (1 + rate);
    years = years + 1;
end

fprintf('Investment doubled after %d years (balance = %.2f)\n', years, balance);