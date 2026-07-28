x_func = -4*pi:pi/20:4*pi;
y_func = sin(x_func);
y_func(y_func <= 0) = 0;

figure;
plot(x_func, y_func, 'LineWidth', 1.5);
title('Discontinuous Function y(x)');
xlabel('x');
ylabel('y(x)');
grid on;