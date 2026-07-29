fprintf('\n--- 17.2: Bisection Method ---\n');
f = @(x) x.^3 + x - 3;
a = 0; b = 2;   % initial interval where f(a)*f(b) < 0
tol = 0.05;
iterCount = 0;

while (b - a)/2 > tol
    c = (a + b)/2;
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    iterCount = iterCount + 1;
end
root = (a+b)/2;
fprintf('Root = %.6f found in %d bisections\n', root, iterCount);

xv = linspace(-1, 3, 500);
figure; plot(xv, f(xv), 'b'); hold on;
yline(0, 'k--');
plot(root, f(root), 'ro', 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('f(x)'); title('Bisection Method Root'); grid on;