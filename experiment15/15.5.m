%% 15.5 Experiment 5: Simulating Radioactive Decay
fprintf('--- 15.5 Experiment 5: Radioactive Decay ---\n');

% 1. Initialize decay parameters
N0 = 100;                 % 100 atoms
time_mins = 100;          % 100 minutes
decay_rate = 0.0338;      % 3.38% per minute

atoms = ones(1, N0); % State array: 1 = undecayed, 0 = decayed
undecayed_counts = zeros(1, time_mins + 1);
undecayed_counts(1) = N0;

for t = 1:time_mins
    % 2. Generate random numbers to determine if each atom decays
    for i = 1:N0
        if atoms(i) == 1 % Check only if it hasn't decayed yet
            if rand() < decay_rate
                atoms(i) = 0; % The atom decays
            end
        end
    end
    undecayed_counts(t+1) = sum(atoms);
end

% Theoretical model calculation: N(t) = N0 * e^(-lambda * t)
t_arr = 0:time_mins;
theoretical = N0 * exp(-decay_rate * t_arr);

% 3 & 4. Plot and compare the simulated results with theoretical decay
figure('Name', '15.5 Radioactive Decay');
plot(t_arr, undecayed_counts, 'b-', 'LineWidth', 2); hold on;
plot(t_arr, theoretical, 'r--', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Number of Undecayed Atoms');
legend('Simulated Decay', 'Theoretical Model');
title('Radioactive Decay of 100 Atoms over 100 Minutes');
grid on;

% 5. Estimate the probability of an atom decaying in the given time period
sim_prob_decay = (N0 - undecayed_counts(end)) / N0;
theo_prob_decay = 1 - exp(-decay_rate * time_mins);
fprintf('Simulated probability of an atom decaying in 100 mins: %.4f\n', sim_prob_decay);
fprintf('Theoretical probability of decay: %.4f\n', theo_prob_decay);