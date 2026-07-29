%% Task 1: Plot the Complex Mathematical Function
x = linspace(-10, 10, 1000);   % fine resolution for smooth curve

f = exp(sin(x.^2)) ./ (1 + cos(x.^3)) + log(x.^2 + 1) .* sin(x/2) + 3 ./ (x.^2 + 4);

figure;
plot(x, f, 'r--');

%% Task 2: Customize the Graph
title('Composite Function f(x)');
xlabel('x');
ylabel('f(x)');
grid on;

%% Task 3: Plot the Individual Components
term1 = exp(sin(x.^2)) ./ (1 + cos(x.^3));
term2 = log(x.^2 + 1) .* sin(x/2);
term3 = 3 ./ (x.^2 + 4);

hold on;
plot(x, term1, 'b-');
plot(x, term2, 'g-');
plot(x, term3, 'm-');
legend('f(x)', 'Term 1: e^{sin(x^2)}/(1+cos(x^3))', 'Term 2: log(x^2+1)sin(x/2)', 'Term 3: 3/(x^2+4)', 'Location', 'best');
hold off;

%% Task 4: Axis Customization
xlim([-10 10]);
ylim([-10 10]);
axis equal;

%% Task 5: Annotations and Custom Labels
[maxVal, maxIdx] = max(f);
text(x(maxIdx), maxVal, ' \leftarrow Max point', 'FontSize', 8);

[minVal, minIdx] = min(f);
text(x(minIdx), minVal, ' \leftarrow Min point', 'FontSize', 8);

%% Task 6: Save the Graph
saveas(gcf, 'composite_function_plot.png');
saveas(gcf, 'composite_function_plot.tiff');