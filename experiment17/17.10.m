fprintf('\n--- 17.10: Cubic Polynomial Fit ---\n');
figure;
axis([0 10 0 10]);
title('Click points on the graph, press Enter when done');
grid on;

[xData, yData] = ginput;   % interactive point selection

p = polyfit(xData, yData, 3);   % cubic fit
xFit = linspace(min(xData), max(xData), 200);
yFit = polyval(p, xFit);

figure;
plot(xData, yData, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(xFit, yFit, 'b-', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
title('Cubic Polynomial Fit to Data Points');
legend('Data Points', 'Cubic Fit', 'Location', 'best');
grid on; hold off;

yPred = polyval(p, xData);
SSres = sum((yData - yPred).^2);
SStot = sum((yData - mean(yData)).^2);
Rsquared = 1 - SSres/SStot;
fprintf('R-squared (goodness of fit): %.4f\n', Rsquared);