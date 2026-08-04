%% 15.4 Experiment 4: Simulating Traffic Flow
fprintf('--- 15.4 Experiment 4: Traffic Flow ---\n');

% 1. Initialize variables
totalIntervals = 6; % Simulating 60 seconds (six 10-second intervals)
queueLength = 0;
arrivalProb = 0.4; % 40% probability of a car arriving per second

fprintf('Time(s)\tLight\tArrivals\tQueue Size\n');
fprintf('-------------------------------------------\n');

for intervalIdx = 1:totalIntervals
    clockSeconds = intervalIdx * 10;

    % 3 & 5. Handle change of lights (e.g., 30s Red, 30s Green cycle)
    if mod(clockSeconds - 1, 60) < 30
        lightState = 'Red';
    else
        lightState = 'Green';
    end

    % 2. Simulate arrival of cars using rand(1, 10) as specified by the hint
    arrivalCount = sum(rand(1, 10) < arrivalProb);
    queueLength = queueLength + arrivalCount;

    if strcmp(lightState, 'Green')
        % Cars leave the intersection if the light is green
        departureCount = min(queueLength, 4); % Assume up to 4 cars can pass in 10s
        queueLength = queueLength - departureCount;
    end

    % 4. Display the queue every 10 seconds
    fprintf('%d\t\t%s\t\t%d\t\t\t%d\n', clockSeconds, lightState, arrivalCount, queueLength);
end
fprintf('\n');

