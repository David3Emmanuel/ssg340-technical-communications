% 1. Define Arrays
degrees = linspace(0, 360, 50);

% 2. Convert to Radians
radians = (pi / 180) .* degrees;

% 3. Plot the Sine and Cosine Functions
sine_values = sin(radians);
cosine_values = cos(radians);

figure;
plot(radians, sine_values, 'LineWidth', 1.5);
hold on;
plot(radians, cosine_values, 'LineWidth', 1.5);
hold off;

xlabel('Angle in radians');
ylabel('Value of sine and cosine');

% 4. Enhance the Plot
legend('Sine', 'Cosine');
title('Sine and Cosine Functions');
grid on;

% 5. Display Results in Table Format
results_table = [degrees', sine_values', cosine_values'];
disp('Angle (degrees) | Sine Value | Cosine Value');
disp(results_table);