function experiment13_4()
    % Create main figure
    fig = figure('Name', '13.4 Custom Button Color', 'Position', [400, 400, 300, 200]);
    
    % Create pushbutton with exact size 100x50 pixels
    btn = uicontrol('Style', 'pushbutton', 'String', 'Click Me!', ...
                    'Position', [100, 75, 100, 50], ...
                    'Callback', @randomColorImage);
                
    % Callback to generate and apply random solid color image
    function randomColorImage(src, ~)
        % 1. Generate a single random RGB color (1x1x3 array)
        random_RGB = rand(1, 1, 3);
        
        % 2. Replicate that single color across a 50x100 block to make a solid image
        % (50 rows/height, 100 columns/width)
        solidColorImage = repmat(random_RGB, [50, 100, 1]);
        
        % 3. Set the CData property to our solid image
        src.CData = solidColorImage;
        
        % (Optional) Change the text so it's easier to read against random colors
        src.ForegroundColor = 'k'; % Black text
        src.FontWeight = 'bold';
    end
end