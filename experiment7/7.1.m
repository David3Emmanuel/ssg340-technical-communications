fprintf('--- 7.1 Experiment 1: Advanced 2-D Plotting and Customization ---\n');

%% Task 1: Plot a Complex Mathematical Function
fprintf('Task 1: Generating the complex mathematical function over the range x = -10 to 10...\n');
% Use linspace to generate the x vector. 
% We use a high-density vector for the lines and a low-density vector for the markers 
% so the markers don't overlap into a solid block.
x_line = linspace(-10, 10, 1000);
x_mark = linspace(-10, 10, 30); 

% Calculating components for the main line
% VERY IMPORTANT: using element-wise operations (.*, ./, .^) to avoid matrix errors
comp1_line = exp(sin(x_line)) .* cos(x_line);
comp2_line = 1 ./ (1 + x_line.^2);
comp3_line = (2 / pi) .* atan(x_line);
f_x_line = comp1_line + comp2_line + comp3_line;

%% Task 2 & 3: Customize the Graph Appearance & Multiple Plots
fprintf('Task 2 & 3: Plotting main function (red dashes) and individual components...\n');
figure('Name', 'Advanced 2-D Plotting', 'Position', [100, 100, 900, 600]);

% Main function plotted as dashed red line ('r--')
plot(x_line, f_x_line, 'r--', 'LineWidth', 2, 'DisplayName', 'Total f(x)');
hold on;

% Calculating components for the marker plots
comp1_mark = exp(sin(x_mark)) .* cos(x_mark);
comp3_mark = (2 / pi) .* atan(x_mark);

% Component 1: blue circles ('bo')
plot(x_mark, comp1_mark, 'bo', 'MarkerSize', 6, 'DisplayName', 'e^{sin(x)} \cdot cos(x)');

% Component 2: green dashes ('g--')
plot(x_line, comp2_line, 'g--', 'LineWidth', 1.5, 'DisplayName', '1 / (1 + x^2)');

% Component 3: purple squares (Custom RGB color with square 's' marker)
plot(x_mark, comp3_mark, 's', 'MarkerEdgeColor', [0.5 0 0.5], 'MarkerFaceColor', 'none', ...
    'MarkerSize', 6, 'DisplayName', '(2/\pi) \cdot tan^{-1}(x)');

% Task 2 specific titles and labels
title('Plot of f(x) = e^{sin(x)}\cdotcos(x) + 1/(1+x^2) + 2/\pi\cdot tan^{-1}(x)');
xlabel('x values');
ylabel('f(x) values');

%% Task 4: Annotations and Custom Gridlines
fprintf('Task 4: Adding annotations and custom gridlines...\n');
grid on;
grid minor; % Using minor gridlines for better visibility 

% Finding a local maximum programmatically to annotate
[max_val, max_idx] = max(f_x_line);
max_x = x_line(max_idx);
text(max_x, max_val + 0.1, '\leftarrow Maxima', 'FontSize', 10, 'FontWeight', 'bold');

% Finding a local minimum programmatically to annotate
[min_val, min_idx] = min(f_x_line);
min_x = x_line(min_idx);
text(min_x, min_val - 0.2, '\leftarrow Minima', 'FontSize', 10, 'FontWeight', 'bold');

%% Task 5: Modify Axis Limits and Aspect Ratio
fprintf('Task 5: Modifying axis limits and aspect ratio...\n');
% Setting the strict limits required by the manual
axis([-10 10 -1.5 2.5]);

% Setting equal aspect ratio. 
% Note: Since the X span (20) is much larger than the Y span (4), this will visually squash the graph vertically.
axis equal; 

% Force limits again just in case 'axis equal' automatically overrides them
xlim([-10, 10]);
ylim([-1.5, 2.5]);

% Display legend distinctively 
legend('Location', 'northeastoutside');
hold off;

%% Task 6: Save the Graph
fprintf('Task 6: Saving the graph as a high-resolution PNG...\n');
saveas(gcf, 'advanced_plot_experiment1.png');
fprintf('Success! Graph saved in your current directory as "advanced_plot_experiment1.png".\n\n');