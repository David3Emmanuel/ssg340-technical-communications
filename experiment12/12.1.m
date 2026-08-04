%% Task 1: Custom Lissajous Function
ampX = 3; ampY = 2; freqX = 4; freqY = 5; phaseShift = pi/2;   % change these to explore different curves
paramT = linspace(0, 2*pi, 1000);

curveX = ampX*sin(freqX*paramT + phaseShift);
curveY = ampY*sin(freqY*paramT);

figure;
mainCurve = plot(curveX, curveY, 'b', 'LineWidth', 1.5);
title('Lissajous Curve');

%% Task 2: Multiple Curves with Varying Parameters
figure; hold on;
curveParams = [3 2 4 5 pi/2; 2 3 3 4 0; 4 1 5 6 pi/4];   % rows: A B a b delta
curveHandles = gobjects(size(curveParams,1),1);

for curveIdx = 1:size(curveParams,1)
    rowAmpX = curveParams(curveIdx,1); rowAmpY = curveParams(curveIdx,2);
    rowFreqX = curveParams(curveIdx,3); rowFreqY = curveParams(curveIdx,4);
    rowPhase = curveParams(curveIdx,5);
    rowX = rowAmpX*sin(rowFreqX*paramT + rowPhase);
    rowY = rowAmpY*sin(rowFreqY*paramT);
    curveHandles(curveIdx) = plot(rowX, rowY, 'LineWidth', 1.5);
end
xlabel('x(t)'); ylabel('y(t)');

%% Task 3: Manipulate Plot Properties Dynamically
set(curveHandles(1), 'LineStyle', '--', 'Color', 'r', 'LineWidth', 2);
set(curveHandles(2), 'LineStyle', ':', 'Color', 'g', 'LineWidth', 1);
set(curveHandles(3), 'LineStyle', '-.', 'Color', 'm', 'LineWidth', 1.5);

%% Task 4: Annotations
title('Lissajous Curves with Custom Styling');
axesHandle = gca;
xlabel(axesHandle, '$x(t)$', 'Interpreter', 'latex', 'FontSize', 12);
ylabel(axesHandle, '$y(t)$', 'Interpreter', 'latex', 'FontSize', 12);
text(0, 0, ' \leftarrow Origin', 'FontSize', 10);
hold off;

%% Task 5: Sine wave + decaying sine, vector of handles
figure;
waveTime = linspace(0, 10, 1000);
plainSine = sin(waveTime);
decayingSine = exp(-0.3*waveTime) .* sin(2*pi*waveTime);

waveHandles = gobjects(2,1);
hold on;
waveHandles(1) = plot(waveTime, plainSine);
waveHandles(2) = plot(waveTime, decayingSine);
hold off;

set(waveHandles(1), 'Color', 'b', 'LineStyle', '-');
set(waveHandles(2), 'Color', 'r', 'LineStyle', '--', 'Marker', 'o', 'MarkerSize', 3);

%% Task 6: Handle Axes and Figure Properties
axis([0 10 -1.5 1.5]);
figHandle = gcf;
set(figHandle, 'Position', [100 100 700 500]);

%% Task 7: Save the Figure
savefig(figHandle, 'lissajous_figure.fig');
print(figHandle, 'lissajous_figure.png', '-dpng');
