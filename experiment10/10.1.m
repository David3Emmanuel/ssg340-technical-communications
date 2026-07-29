%% Task 1 & 2: Define and Plot Harmonic Oscillator
t = 0:pi/40:6*pi;
h = @(t) cos(8*t) + cos(9*t);

figure;
plot(t, h(t), 'b');
xlabel('t'); ylabel('h(t)');
title('Coupled Harmonic Oscillator: h(t) = cos(8t) + cos(9t)');
grid on;

%% Task 3: Add Two More Coupled Oscillators
h2 = @(t) cos(8*t) + cos(9*t) + cos(10*t) + cos(11*t);

figure;
plot(t, h2(t), 'r');
xlabel('t'); ylabel('h(t)');
title('Extended System: 4 Coupled Oscillators');
grid on;

figure;
plot(t, h(t), 'b'); hold on;
plot(t, h2(t), 'r--');
legend('Original (2 oscillators)', 'Extended (4 oscillators)', 'Location', 'best');
xlabel('t'); ylabel('h(t)');
title('Impact of Adding More Oscillators');
grid on;
hold off;