x_input = -1:0.1:1;

try
    if any(x_input < -1 | x_input > 1)
        error('Input contains values outside the valid range [-1, 1] for inverse trigonometric functions.');
    end
    x = x_input;
catch ME
    disp(ME.message);
    x = x_input(x_input >= -1 & x_input <= 1);
end

y_abs = abs(x);
y_acos = acos(x);
y_asin = asin(x);
y_atan = atan(x);

figure;
subplot(2, 2, 1);
plot(x, y_abs, 'k', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('abs(x)', 'Location', 'best');
grid on;
text(0, 0, ' \leftarrow Minimum (0,0)');

subplot(2, 2, 2);
plot(x, y_acos, 'r', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('acos(x)', 'Location', 'best');
grid on;
text(1, 0, ' \leftarrow Root (1,0)');

subplot(2, 2, 3);
plot(x, y_asin, 'b', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('asin(x)', 'Location', 'best');
grid on;
text(0, 0, ' \leftarrow Origin intersect');

subplot(2, 2, 4);
plot(x, y_atan, 'g', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('atan(x)', 'Location', 'best');
grid on;
text(0, 0, ' \leftarrow Origin intersect');

figure;
plot(x, y_acos, 'r', 'LineWidth', 1.5); hold on;
plot(x, y_asin, 'b', 'LineWidth', 1.5);
plot(x, y_atan, 'g', 'LineWidth', 1.5);
xlabel('x'); ylabel('f(x)');
legend('acos(x)', 'asin(x)', 'atan(x)', 'Location', 'best');
title('Comparison of Arc Functions');
grid on;
text(0, 0, ' \leftarrow Intersection of asin(x) and atan(x)');
hold off;

disp('acos(x): Valid domain [-1, 1]. Range plotted is [0, pi]. Monotonically decreasing.');
disp('asin(x): Valid domain [-1, 1]. Range plotted is [-pi/2, pi/2]. Monotonically increasing.');
disp('atan(x): Domain is all real numbers. Range plotted is [-pi/4, pi/4]. Monotonically increasing.');