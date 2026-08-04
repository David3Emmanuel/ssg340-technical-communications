% 1. Define Arrays
angleDeg = linspace(0, 360, 50);

% 2. Convert to Radians
angleRad = (pi / 180) .* angleDeg;

% 3. Plot the Sine and Cosine Functions
sineValues = sin(angleRad);
cosineValues = cos(angleRad);

figure;
plot(angleRad, sineValues, 'LineWidth', 1.5);
hold on;
plot(angleRad, cosineValues, 'LineWidth', 1.5);
hold off;

xlabel('Angle in radians');
ylabel('Value of sine and cosine');

% 4. Enhance the Plot
legend('Sine', 'Cosine');
title('Sine and Cosine Functions');
grid on;

% 5. Display Results in Table Format
resultsTable = [angleDeg', sineValues', cosineValues'];
disp('Angle (degrees) | Sine Value | Cosine Value');
disp(resultsTable);
