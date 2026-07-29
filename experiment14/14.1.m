%% Task 2: Compute Deflection of Cantilever Beam
fprintf('--- Cantilever Beam Deflection ---\n');
w = input('Enter uniform load w (N/m, e.g. 1000 to 50000): ');
L = input('Enter beam length L (m, e.g. 1 to 10): ');
E = input('Enter modulus of elasticity E (Pa, e.g. 2e11 for steel): ');
I = input('Enter moment of inertia I (m^4, e.g. 1e-6 to 1e-4): ');

x = linspace(0, L, 200);
X = x / L;   % normalized position along beam

Y = (-w * L^4) / (24 * E * I) * (X.^4 - 4*X.^3 + 6*X.^2);

%% Task 3: Plot the Deflection Curve
figure;
plot(x, Y, 'b', 'LineWidth', 1.5);
xlabel('Position along beam, x (m)');
ylabel('Deflection, Y (m)');
title('Cantilever Beam Deflection under Uniform Load');
grid on;

%% Task 4: Effect of Varying I on Deflection
fprintf('\n--- Comparing Effect of Moment of Inertia ---\n');
I_values = [I, I*2, I*0.5];   % compare original, stiffer, and more flexible beam
labels = {'Original I', 'Doubled I (stiffer)', 'Halved I (more flexible)'};

figure; hold on;
for k = 1:length(I_values)
    Yk = (-w * L^4) / (24 * E * I_values(k)) * (X.^4 - 4*X.^3 + 6*X.^2);
    plot(x, Yk, 'LineWidth', 1.5, 'DisplayName', labels{k});
end
xlabel('Position along beam, x (m)');
ylabel('Deflection, Y (m)');
title('Effect of Moment of Inertia on Beam Deflection');
legend('show', 'Location', 'best');
grid on;
hold off;

fprintf('Note: increasing I (stiffer cross-section) reduces deflection;\n');
fprintf('decreasing I increases deflection, since Y is inversely proportional to I.\n');