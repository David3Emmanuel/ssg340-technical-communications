%% 18.5 Experiment 5: Dynamic Programming (DP) for Shortest Path Problem
fprintf('--- 18.5 Experiment 5: Dynamic Programming Shortest Path ---\n');

% Define the directed graph using Source (s), Target (t), and Edge Weights
sourceNodes = [1, 1, 2, 2, 3, 4];
targetNodes = [2, 3, 3, 4, 5, 5];
edgeWeights = [2, 5, 3, 4, 2, 1];

% Create a directed graph
pathGraph = digraph(sourceNodes, targetNodes, edgeWeights);

% FIX: shortestpath returns the path array first, then the distance
[optimalPath, pathCost] = shortestpath(pathGraph, 1, 5);

fprintf('Shortest Path from Node 1 to Node 5 has total cost: %.2f\n', pathCost);
fprintf('Optimal Path Nodes: %s\n\n', mat2str(optimalPath));

% Visualize the graph and the optimal path
figure('Name', '18.5 Shortest Path');
graphPlot = plot(pathGraph, 'EdgeLabel', pathGraph.Edges.Weight, 'Layout', 'layered');
title('Directed Graph and Shortest Path');

% Highlight the shortest path in red
highlight(graphPlot, optimalPath, 'EdgeColor', 'r', 'NodeColor', 'r', 'LineWidth', 2);
