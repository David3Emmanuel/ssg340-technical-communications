function experiment13_2()
    % Create main figure
    mainFig = figure('Name', '13.2 Newton''s Method', 'Position', [400, 300, 400, 350]);

    % Input components
    uicontrol('Style', 'text', 'String', 'Enter a number:', 'Position', [20, 300, 100, 20], 'HorizontalAlignment', 'left');
    inputField = uicontrol('Style', 'edit', 'Position', [130, 300, 100, 25]);

    % Add the "Start" pushbutton
    uicontrol('Style', 'pushbutton', 'String', 'Start', 'Position', [250, 300, 80, 25], 'Callback', @startNewtonMethod);

    % Static text box for output display
    resultsPanel = uicontrol('Style', 'text', 'Position', [20, 20, 360, 260], ...
                          'HorizontalAlignment', 'left', 'Max', 10, 'BackgroundColor', 'w');

    % Callback function for Newton's Method
    function startNewtonMethod(~, ~)
        targetValue = str2double(inputField.String); % Extract user input
        if isnan(targetValue) || targetValue < 0
            resultsPanel.String = 'Please enter a valid positive number.';
            return;
        end

        estimate = targetValue / 2; % Initial guess
        reportText = sprintf('Calculating square root of %.2f:\n\n', targetValue);

        % Run 8 iterations using a for loop
        for iterCount = 1:8
            estimate = 0.5 * (estimate + targetValue / estimate); % Newton's equation
            reportText = sprintf('%sIteration %d: \t%f\n', reportText, iterCount, estimate);
        end

        resultsPanel.String = reportText; % Display in text box
    end
end
