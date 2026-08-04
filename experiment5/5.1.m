inputRange = -1:0.1:1;

try
    if any(inputRange < -1 | inputRange > 1)
        error('Input contains values outside the valid range [-1, 1] for inverse trigonometric functions.');
    end
    xValues = inputRange;
catch err
    disp(err.message);
    xValues = inputRange(inputRange >= -1 & inputRange <= 1);
end

absValues  = abs(xValues);
acosValues = acos(xValues);
asinValues = asin(xValues);
atanValues = atan(xValues);

figure;
subplot(2, 2, 1);
plot(xValues, absValues, 'k', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('abs(x)', 'Location', 'best');
grid on;
text(0, 0, ' \leftarrow Minimum (0,0)');

subplot(2, 2, 2);
plot(xValues, acosValues, 'r', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('acos(x)', 'Location', 'best');
grid on;
text(1, 0, ' \leftarrow Root (1,0)');

subplot(2, 2, 3);
plot(xValues, asinValues, 'b', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('asin(x)', 'Location', 'best');
grid on;
text(0, 0, ' \leftarrow Origin intersect');

subplot(2, 2, 4);
plot(xValues, atanValues, 'g', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('atan(x)', 'Location', 'best');
grid on;
text(0, 0, ' \leftarrow Origin intersect');

figure;
plot(xValues, acosValues, 'r', 'LineWidth', 1.5); hold on;
plot(xValues, asinValues, 'b', 'LineWidth', 1.5);
plot(xValues, atanValues, 'g', 'LineWidth', 1.5);
xlabel('x'); ylabel('f(x)');
legend('acos(x)', 'asin(x)', 'atan(x)', 'Location', 'best');
title('Comparison of Arc Functions');
grid on;
text(0, 0, ' \leftarrow Intersection of asin(x) and atan(x)');
hold off;

disp('acos(x): Valid domain [-1, 1]. Range plotted is [0, pi]. Monotonically decreasing.');
disp('asin(x): Valid domain [-1, 1]. Range plotted is [-pi/2, pi/2]. Monotonically increasing.');
disp('atan(x): Domain is all real numbers. Range plotted is [-pi/4, pi/4]. Monotonically increasing.');
