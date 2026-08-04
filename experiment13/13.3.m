function experiment13_3()
    % Create main figure
    mainFig = figure('Name', '13.3 Plotting Graphs in GUI Axes', 'Position', [400, 200, 500, 400]);

    % Create Axes for plotting
    plotAxes = axes('Parent', mainFig, 'Position', [0.1, 0.3, 0.8, 0.6]);

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
        sampleX = linspace(0, 2*pi, 100);
        plot(plotAxes, sampleX, sin(sampleX), 'LineWidth', 2);
    end

    function toggleGrid(~, ~)
        if strcmp(plotAxes.XGrid, 'on')
            grid(plotAxes, 'off');
        else
            grid(plotAxes, 'on');
        end
    end

    function clearPlot(~, ~)
        cla(plotAxes); % Clear the axes
    end
end
