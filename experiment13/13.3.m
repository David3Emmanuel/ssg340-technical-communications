function experiment13_3()
    % Create main figure
    fig = figure('Name', '13.3 Plotting Graphs in GUI Axes', 'Position', [400, 200, 500, 400]);
    
    % Create Axes for plotting
    ax = axes('Parent', fig, 'Position', [0.1, 0.3, 0.8, 0.6]);
    
    % "Plot" Button
    uicontrol('Style', 'pushbutton', 'String', 'Plot', 'Position', [50, 30, 100, 40], ...
              'Callback', @plotSine);
          
    % "Toggle Grid" Button
    uicontrol('Style', 'pushbutton', 'String', 'Toggle Grid', 'Position', [200, 30, 100, 40], ...
              'Callback', @toggleGrid);
          
    % "Clear" Button
    uicontrol('Style', 'pushbutton', 'String', 'Clear', 'Position', [350, 30, 100, 40], ...
              'Callback', @clearPlot);

    % Callbacks
    function plotSine(~, ~)
        x = linspace(0, 2*pi, 100);
        plot(ax, x, sin(x), 'LineWidth', 2);
    end

    function toggleGrid(~, ~)
        if strcmp(ax.XGrid, 'on')
            grid(ax, 'off');
        else
            grid(ax, 'on');
        end
    end

    function clearPlot(~, ~)
        cla(ax); % Clear the axes
    end
end