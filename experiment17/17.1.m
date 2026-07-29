fprintf('--- 17.1: Newton''s Method ---\n');
f = @(x) x.^3 + x - 3;
fp = @(x) 3*x^2 + 1;
startPoints = [0, 1, 2, -1];   % different starting points

for x0 = startPoints
    x = x0;
    for i = 1:50
        xNew = x - f(x)/fp(x);
        if abs(xNew - x) < 1e-8
            x = xNew; break;
        end
        x = xNew;
    end
    fprintf('x0 = %.1f -> root = %.6f\n', x0, x);
end

xv = linspace(-3, 3, 500);
figure; plot(xv, f(xv), 'b'); hold on;
yline(0, 'k--');
plot(x, f(x), 'ro', 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('f(x)'); title('Newton''s Method Root'); grid on;