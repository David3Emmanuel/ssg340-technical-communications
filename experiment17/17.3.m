fprintf('\n--- 17.3: Trapezoidal Rule ---\n');
f = @(x) x.^2;
a = 0; b = 4; h = 1;
x = a:h:b;
y = f(x);

integral_approx = h * (0.5*y(1) + sum(y(2:end-1)) + 0.5*y(end));
integral_exact = (b^3 - a^3)/3;

fprintf('Trapezoidal approximation: %.6f\n', integral_approx);
fprintf('Exact solution: %.6f\n', integral_exact);
fprintf('Error: %.6f\n', abs(integral_exact - integral_approx));