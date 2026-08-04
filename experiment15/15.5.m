%% 15.5 Experiment 5: Simulating Radioactive Decay
fprintf('--- 15.5 Experiment 5: Radioactive Decay ---\n');

% 1. Initialize decay parameters
initialAtoms = 100;       % 100 atoms
totalMinutes = 100;       % 100 minutes
decayRate = 0.0338;       % 3.38% per minute

atomStates = ones(1, initialAtoms); % State array: 1 = undecayed, 0 = decayed
survivorCounts = zeros(1, totalMinutes + 1);
survivorCounts(1) = initialAtoms;

for minuteIdx = 1:totalMinutes
    % 2. Generate random numbers to determine if each atom decays
    for atomIdx = 1:initialAtoms
        if atomStates(atomIdx) == 1 % Check only if it hasn't decayed yet
            if rand() < decayRate
                atomStates(atomIdx) = 0; % The atom decays
            end
        end
    end
    survivorCounts(minuteIdx+1) = sum(atomStates);
end

% Theoretical model calculation: N(t) = N0 * e^(-lambda * t)
timeAxis = 0:totalMinutes;
theoreticalCurve = initialAtoms * exp(-decayRate * timeAxis);

% 3 & 4. Plot and compare the simulated results with theoretical decay
figure('Name', '15.5 Radioactive Decay');
plot(timeAxis, survivorCounts, 'b-', 'LineWidth', 2); hold on;
plot(timeAxis, theoreticalCurve, 'r--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Number of Undecayed Atoms');
legend('Simulated Decay', 'Theoretical Model');
title('Radioactive Decay of 100 Atoms over 100 Minutes');
grid on;

% 5. Estimate the probability of an atom decaying in the given time period
simulatedDecayProb = (initialAtoms - survivorCounts(end)) / initialAtoms;
theoreticalDecayProb = 1 - exp(-decayRate * totalMinutes);
fprintf('Simulated probability of an atom decaying in 100 mins: %.4f\n', simulatedDecayProb);
fprintf('Theoretical probability of decay: %.4f\n', theoreticalDecayProb);
