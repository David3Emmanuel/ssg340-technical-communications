function experiment13_2()
    % Create main figure
    fig = figure('Name', '13.2 Newton''s Method', 'Position', [400, 300, 400, 350]);
    
    % Input components
    uicontrol('Style', 'text', 'String', 'Enter a number:', 'Position', [20, 300, 100, 20], 'HorizontalAlignment', 'left');
    editBox = uicontrol('Style', 'edit', 'Position', [130, 300, 100, 25]);
    
    % Add the "Start" pushbutton
    uicontrol('Style', 'pushbutton', 'String', 'Start', 'Position', [250, 300, 80, 25], 'Callback', @startNewtonMethod);
    
    % Static text box for output display
    outputBox = uicontrol('Style', 'text', 'Position', [20, 20, 360, 260], ...
                          'HorizontalAlignment', 'left', 'Max', 10, 'BackgroundColor', 'w');
                      
    % Callback function for Newton's Method
    function startNewtonMethod(~, ~)
        S = str2double(editBox.String); % Extract user input
        if isnan(S) || S < 0
            outputBox.String = 'Please enter a valid positive number.';
            return;
        end
        
        x = S / 2; % Initial guess
        resultsStr = sprintf('Calculating square root of %.2f:\n\n', S);
        
        % Run 8 iterations using a for loop
        for i = 1:8
            x = 0.5 * (x + S / x); % Newton's equation
            resultsStr = sprintf('%sIteration %d: \t%f\n', resultsStr, i, x);
        end
        
        outputBox.String = resultsStr; % Display in text box
    end
end