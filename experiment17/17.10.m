fprintf('\n--- 17.10: Cubic Polynomial Fit ---\n');
figure;
axis([0 10 0 10]);
title('Click points on the graph, press Enter when done');
grid on;

[clickedX, clickedY] = ginput;   % interactive point selection

cubicCoeffs = polyfit(clickedX, clickedY, 3);   % cubic fit
fitGrid = linspace(min(clickedX), max(clickedX), 200);
fitCurve = polyval(cubicCoeffs, fitGrid);

figure;
plot(clickedX, clickedY, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(fitGrid, fitCurve, 'b-', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
title('Cubic Polynomial Fit to Data Points');
legend('Data Points', 'Cubic Fit', 'Location', 'best');
grid on; hold off;

predictedY = polyval(cubicCoeffs, clickedX);
residualSumSq = sum((clickedY - predictedY).^2);
totalSumSq = sum((clickedY - mean(clickedY)).^2);
rSquared = 1 - residualSumSq/totalSumSq;
fprintf('R-squared (goodness of fit): %.4f\n', rSquared);
