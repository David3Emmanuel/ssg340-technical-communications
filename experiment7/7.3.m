fprintf('--- 7.3 Experiment 3: 3-D Plotting and Complex Function Visualization ---\n');

%% Task 1: Plot a Complex 3-D Mathematical Function
fprintf('Task 1: Generating the complex 3-D mathematical function for x, y in [-5, 5]...\n');
% Create the grid for x and y. Using a density of 50 for a smooth surface.
[surfX, surfY] = meshgrid(linspace(-5, 5, 50));

% Complex function utilizing strict element-wise operations (.*, ./, .^)
surfTerm1 = sin(surfX.^2 + surfY.^2) .* exp(-(surfX.^2 + surfY.^2));
surfTerm2 = tan(surfX .* surfY) ./ (surfX.^2 + surfY.^2 + 1);
surfTerm3 = log(surfX.^2 + surfY.^2 + 1) ./ (surfX.^2 + 2.*surfY.^2 + 3);
surfValues = surfTerm1 + surfTerm2 + surfTerm3;

% Calculate the gradient for the vector field (needed for Task 3)
% Using fewer points for the quiver plot so the arrows don't overcrowd the graph
[arrowX, arrowY] = meshgrid(linspace(-5, 5, 20));
arrowTerm1 = sin(arrowX.^2 + arrowY.^2) .* exp(-(arrowX.^2 + arrowY.^2));
arrowTerm2 = tan(arrowX .* arrowY) ./ (arrowX.^2 + arrowY.^2 + 1);
arrowTerm3 = log(arrowX.^2 + arrowY.^2 + 1) ./ (arrowX.^2 + 2.*arrowY.^2 + 3);
arrowValues = arrowTerm1 + arrowTerm2 + arrowTerm3;
[gradX, gradY] = gradient(arrowValues);

%% Task 4: Multiple 3-D Subplots (Setup)
fprintf('Task 4: Initializing figure with two subplots...\n');
figHandle = figure('Name', 'Experiment 3: 3-D Plotting', 'Position', [100, 100, 1200, 500]);

%% Task 2: 3-D Surface Plot
fprintf('Task 2: Generating 3-D Surface Plot...\n');
subplot(1, 2, 1);
surf(surfX, surfY, surfValues);
title('3-D Surface Plot of f(x, y)');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('f(x, y)');
colorbar;
shading interp; % Smooths the color gradient across the surface

%% Task 3: Contour Plot and Vector Field
fprintf('Task 3: Generating Contour Plot and Vector Field overlay...\n');
subplot(1, 2, 2);
contour(surfX, surfY, surfValues, 20, 'LineWidth', 1.2); % 20 contour levels
hold on;
% Overlay vector field using the lower-density grid
quiver(arrowX, arrowY, gradX, gradY, 'r', 'LineWidth', 1);
hold off;
title('2-D Contour Plot with Vector Field');
xlabel('X-axis');
ylabel('Y-axis');
axis equal; % Ensures the spatial proportions are correct
grid on;

%% Task 5: Animate the 3-D Surface Plot
fprintf('Task 5: Animating the 3-D surface plot through rotation...\n');
subplot(1, 2, 1); % Bring focus back to the surface plot subplot
% Rotate the azimuth angle from 0 to 360 degrees
for azimuth = 0:5:360
    view(azimuth, 30); % Azimuth changes, elevation locked at 30 degrees
    drawnow;           % Force MATLAB to draw the update
    pause(0.05);       % Control animation speed
end

%% Task 6: Save the 3-D Graphs
fprintf('Task 6: Saving the final figure as a high-resolution image...\n');
% Save the entire figure containing both subplots
saveas(gcf, 'experiment3_complex_3d_plot.png');
fprintf('Success! Graph saved in your current directory as "experiment3_complex_3d_plot.png".\n\n');
