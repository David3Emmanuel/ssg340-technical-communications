%% 15.4 Experiment 4: Simulating Traffic Flow
fprintf('--- 15.4 Experiment 4: Traffic Flow ---\n');

% 1. Initialize variables
total_intervals = 6; % Simulating 60 seconds (six 10-second intervals)
queue_size = 0;
prob_arrival = 0.4; % 40% probability of a car arriving per second

fprintf('Time(s)\tLight\tArrivals\tQueue Size\n');
fprintf('-------------------------------------------\n');

for t = 1:total_intervals
    time_sec = t * 10;
    
    % 3 & 5. Handle change of lights (e.g., 30s Red, 30s Green cycle)
    if mod(time_sec - 1, 60) < 30
        light = 'Red';
    else
        light = 'Green';
    end
    
    % 2. Simulate arrival of cars using rand(1, 10) as specified by the hint
    arrivals = sum(rand(1, 10) < prob_arrival); 
    queue_size = queue_size + arrivals;
    
    if strcmp(light, 'Green')
        % Cars leave the intersection if the light is green
        departures = min(queue_size, 4); % Assume up to 4 cars can pass in 10s
        queue_size = queue_size - departures;
    end
    
    % 4. Display the queue every 10 seconds
    fprintf('%d\t\t%s\t\t%d\t\t\t%d\n', time_sec, light, arrivals, queue_size);
end
fprintf('\n');

