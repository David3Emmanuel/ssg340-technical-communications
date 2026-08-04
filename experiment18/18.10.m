
%% 18.10 Experiment 10: Optimal Assignment Problem Using Hungarian Method
fprintf('--- 18.10 Experiment 10: Hungarian Method Assignment ---\n');
% Cost Matrix C from manual setup
costMatrix = [4, 2, 5;
              3, 7, 6;
              8, 3, 9];

% MATLAB's built-in munkres/assignment implementation via matchpairs or linprog
% Transforming assignment into binary linear program
[assignmentPairs, totalCost] = matchpairs(costMatrix, 1000); % Minimizes total assignment cost

fprintf('Optimal Worker-to-Task Assignments (Worker -> Task):\n');
disp(assignmentPairs);
fprintf('Total Minimum Assignment Cost: %d\n', totalCost);
