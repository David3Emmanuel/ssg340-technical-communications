%% Task 1: Surface Plot with peaks()
[X, Y, Z] = peaks(50);
figure;
h = surf(X, Y, Z);
axis equal;

%% Task 2: Advanced Color Mapping
colormap(jet);
colorbar;

%% Task 3: Lighting
shading interp;
lighting phong;
camlight('headlight');

%% Task 4: Camera View Manipulation
for az = 0:10:360
    view(az, 30);
    pause(0.05);
end

%% Task 5: Colorbar Position
cb = colorbar;
set(cb, 'Position', [0.92 0.3 0.02 0.4]);

%% Task 6: Save
savefig(gcf, 'surface_plot.fig');
saveas(gcf, 'surface_plot.png');