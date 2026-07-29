%% 18.5 Experiment 5: Dynamic Programming (DP) for Shortest Path Problem
fprintf('--- 18.5 Experiment 5: Dynamic Programming Shortest Path ---\n');

% Define the directed graph using Source (s), Target (t), and Edge Weights
s = [1, 1, 2, 2, 3, 4];
t = [2, 3, 3, 4, 5, 5];
weights = [2, 5, 3, 4, 2, 1];

% Create a directed graph
G = digraph(s, t, weights);

% FIX: shortestpath returns the path array first, then the distance
[opt_path, dist] = shortestpath(G, 1, 5);

fprintf('Shortest Path from Node 1 to Node 5 has total cost: %.2f\n', dist);
fprintf('Optimal Path Nodes: %s\n\n', mat2str(opt_path));

% Visualize the graph and the optimal path
figure('Name', '18.5 Shortest Path');
p = plot(G, 'EdgeLabel', G.Edges.Weight, 'Layout', 'layered');
title('Directed Graph and Shortest Path');

% Highlight the shortest path in red
highlight(p, opt_path, 'EdgeColor', 'r', 'NodeColor', 'r', 'LineWidth', 2);