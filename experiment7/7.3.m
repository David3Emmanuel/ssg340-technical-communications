fprintf('--- 7.3 Experiment 3: 3-D Plotting and Complex Function Visualization ---\n');

%% Task 1: Plot a Complex 3-D Mathematical Function
fprintf('Task 1: Generating the complex 3-D mathematical function for x, y in [-5, 5]...\n');
% Create the grid for x and y. Using a density of 50 for a smooth surface.
[x, y] = meshgrid(linspace(-5, 5, 50)); 

% Complex function utilizing strict element-wise operations (.*, ./, .^)
term1 = sin(x.^2 + y.^2) .* exp(-(x.^2 + y.^2));
term2 = tan(x .* y) ./ (x.^2 + y.^2 + 1);
term3 = log(x.^2 + y.^2 + 1) ./ (x.^2 + 2.*y.^2 + 3);
f = term1 + term2 + term3;

% Calculate the gradient for the vector field (needed for Task 3)
% Using fewer points for the quiver plot so the arrows don't overcrowd the graph
[x_quiv, y_quiv] = meshgrid(linspace(-5, 5, 20));
term1_q = sin(x_quiv.^2 + y_quiv.^2) .* exp(-(x_quiv.^2 + y_quiv.^2));
term2_q = tan(x_quiv .* y_quiv) ./ (x_quiv.^2 + y_quiv.^2 + 1);
term3_q = log(x_quiv.^2 + y_quiv.^2 + 1) ./ (x_quiv.^2 + 2.*y_quiv.^2 + 3);
f_quiv = term1_q + term2_q + term3_q;
[px, py] = gradient(f_quiv);

%% Task 4: Multiple 3-D Subplots (Setup)
fprintf('Task 4: Initializing figure with two subplots...\n');
fig = figure('Name', 'Experiment 3: 3-D Plotting', 'Position', [100, 100, 1200, 500]);

%% Task 2: 3-D Surface Plot
fprintf('Task 2: Generating 3-D Surface Plot...\n');
subplot(1, 2, 1);
surf(x, y, f);
title('3-D Surface Plot of f(x, y)');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('f(x, y)');
colorbar;
shading interp; % Smooths the color gradient across the surface

%% Task 3: Contour Plot and Vector Field
fprintf('Task 3: Generating Contour Plot and Vector Field overlay...\n');
subplot(1, 2, 2);
contour(x, y, f, 20, 'LineWidth', 1.2); % 20 contour levels
hold on;
% Overlay vector field using the lower-density grid
quiver(x_quiv, y_quiv, px, py, 'r', 'LineWidth', 1); 
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
for az = 0:5:360
    view(az, 30); % Azimuth changes, elevation locked at 30 degrees
    drawnow;      % Force MATLAB to draw the update
    pause(0.05);  % Control animation speed
end

%% Task 6: Save the 3-D Graphs
fprintf('Task 6: Saving the final figure as a high-resolution image...\n');
% Save the entire figure containing both subplots
saveas(gcf, 'experiment3_complex_3d_plot.png');
fprintf('Success! Graph saved in your current directory as "experiment3_complex_3d_plot.png".\n\n');