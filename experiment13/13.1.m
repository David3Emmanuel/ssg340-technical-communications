function experiment13_1()
    % Create the main figure window
    mainFig = figure('Name', '13.1 Simple Time Display', 'Position', [400, 400, 300, 150]);

    % Add the pushbutton labeled "Time"
    timeButton = uicontrol('Style', 'pushbutton', 'String', 'Time', ...
                    'Position', [50, 50, 200, 50], ...
                    'FontSize', 14, ...
                    'Callback', @updateTimeCallback);

    % Callback function that triggers when the button is pressed
    function updateTimeCallback(srcButton, ~)
        nowParts = clock; % Fetch current time
        % Format the time as HH:MM:SS
        timeString = sprintf('%02d:%02d:%02d', nowParts(4), nowParts(5), round(nowParts(6)));
        % Update the button's string
        srcButton.String = timeString;
    end
end
