%% Task 1: Custom Lissajous Function
A = 3; B = 2; a = 4; b = 5; delta = pi/2;   % change these to explore different curves
t = linspace(0, 2*pi, 1000);

x = A*sin(a*t + delta);
y = B*sin(b*t);

figure;
h1 = plot(x, y, 'b', 'LineWidth', 1.5);
title('Lissajous Curve');

%% Task 2: Multiple Curves with Varying Parameters
figure; hold on;
params = [3 2 4 5 pi/2; 2 3 3 4 0; 4 1 5 6 pi/4];   % rows: A B a b delta
handles = gobjects(size(params,1),1);

for i = 1:size(params,1)
    Ai=params(i,1); Bi=params(i,2); ai=params(i,3); bi=params(i,4); di=params(i,5);
    xi = Ai*sin(ai*t + di);
    yi = Bi*sin(bi*t);
    handles(i) = plot(xi, yi, 'LineWidth', 1.5);
end
xlabel('x(t)'); ylabel('y(t)');

%% Task 3: Manipulate Plot Properties Dynamically
set(handles(1), 'LineStyle', '--', 'Color', 'r', 'LineWidth', 2);
set(handles(2), 'LineStyle', ':', 'Color', 'g', 'LineWidth', 1);
set(handles(3), 'LineStyle', '-.', 'Color', 'm', 'LineWidth', 1.5);

%% Task 4: Annotations
title('Lissajous Curves with Custom Styling');
axHandle = gca;
xlabel(axHandle, '$x(t)$', 'Interpreter', 'latex', 'FontSize', 12);
ylabel(axHandle, '$y(t)$', 'Interpreter', 'latex', 'FontSize', 12);
text(0, 0, ' \leftarrow Origin', 'FontSize', 10);
hold off;

%% Task 5: Sine wave + decaying sine, vector of handles
figure;
t2 = linspace(0, 10, 1000);
y1 = sin(t2);
y2 = exp(-0.3*t2) .* sin(2*pi*t2);

lineHandles = gobjects(2,1);
hold on;
lineHandles(1) = plot(t2, y1);
lineHandles(2) = plot(t2, y2);
hold off;

set(lineHandles(1), 'Color', 'b', 'LineStyle', '-');
set(lineHandles(2), 'Color', 'r', 'LineStyle', '--', 'Marker', 'o', 'MarkerSize', 3);

%% Task 6: Handle Axes and Figure Properties
axis([0 10 -1.5 1.5]);
figHandle = gcf;
set(figHandle, 'Position', [100 100 700 500]);

%% Task 7: Save the Figure
savefig(figHandle, 'lissajous_figure.fig');
print(figHandle, 'lissajous_figure.png', '-dpng');