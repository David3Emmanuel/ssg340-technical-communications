%% Task 1: Surface Plot with peaks()
[peaksX, peaksY, peaksZ] = peaks(50);
figure;
surfHandle = surf(peaksX, peaksY, peaksZ);
axis equal;

%% Task 2: Advanced Color Mapping
colormap(jet);
colorbar;

%% Task 3: Lighting
shading interp;
lighting phong;
camlight('headlight');

%% Task 4: Camera View Manipulation
for azimuth = 0:10:360
    view(azimuth, 30);
    pause(0.05);
end

%% Task 5: Colorbar Position
colorbarHandle = colorbar;
set(colorbarHandle, 'Position', [0.92 0.3 0.02 0.4]);

%% Task 6: Save
savefig(gcf, 'surface_plot.fig');
saveas(gcf, 'surface_plot.png');
