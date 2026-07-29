%% Task 1: Create and Save a Figure
x = 0:0.1:2*pi;
y = sin(x);
figure;
plot(x, y);
title('Sine Wave');
savefig('sine_wave.fig');

%% Task 2: Export to Multiple Formats
saveas(gcf, 'sine_wave.png');
saveas(gcf, 'sine_wave.jpg');
saveas(gcf, 'sine_wave.eps');

%% Task 3: Print for High-Quality Output
print(gcf, 'sine_wave_hq.pdf', '-dpdf', '-r300');

%% Task 4: Copy to Clipboard
print(gcf, '-clipboard', '-dbitmap');

%% Task 5: Batch Processing Multiple Figures
numFigs = 3;
for i = 1:numFigs
    figure;
    plot(x, sin(x + i));   % vary phase for each figure
    title(['Batch Figure ', num2str(i)]);
    filename = sprintf('batch_figure_%d.png', i);
    saveas(gcf, filename);
end