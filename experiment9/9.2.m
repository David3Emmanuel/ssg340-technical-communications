%% Task 1: Rounding Error in Newton Quotient
fprintf('--- Task 1: Newton Quotient with Rounding Errors ---\n');
x = 2;
f = @(x) x^2;
h = 1;

for i = 1:10
    derivative = (f(x + h) - f(x)) / h;
    disp(['h = ', num2str(h), ', Derivative = ', num2str(derivative)]);
    h = h / 10;   % reduce h by a factor of 10 each iteration
end

%% Task 2: Solving Simultaneous Equations with Rounding Errors
fprintf('\n--- Task 2: Simultaneous Equations with Rounding Errors ---\n');
a = 0.2038;
b = 0.1218;
c = 0.2014;
d = 0.4071;
e = 0.2436;
f_val = 0.4038;

% Solving using Cramer's rule (matches system: a*x + b*y = c; d*x + e*y = f_val)
x = (c*e - b*f_val) / (a*e - b*d);
y = (a*f_val - c*d) / (a*e - b*d);

disp(['x = ', num2str(x)]);
disp(['y = ', num2str(y)]);