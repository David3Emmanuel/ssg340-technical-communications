%% Task 1: Create and Save a Figure
sampleX = 0:0.1:2*pi;
sampleY = sin(sampleX);
figure;
plot(sampleX, sampleY);
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
numFigures = 3;
for figIdx = 1:numFigures
    figure;
    plot(sampleX, sin(sampleX + figIdx));   % vary phase for each figure
    title(['Batch Figure ', num2str(figIdx)]);
    outputName = sprintf('batch_figure_%d.png', figIdx);
    saveas(gcf, outputName);
end
