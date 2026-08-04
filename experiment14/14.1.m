%% Task 2: Compute Deflection of Cantilever Beam
fprintf('--- Cantilever Beam Deflection ---\n');
uniformLoad = input('Enter uniform load w (N/m, e.g. 1000 to 50000): ');
beamLength = input('Enter beam length L (m, e.g. 1 to 10): ');
elasticModulus = input('Enter modulus of elasticity E (Pa, e.g. 2e11 for steel): ');
momentInertia = input('Enter moment of inertia I (m^4, e.g. 1e-6 to 1e-4): ');

beamPosition = linspace(0, beamLength, 200);
normPosition = beamPosition / beamLength;   % normalized position along beam

deflection = (-uniformLoad * beamLength^4) / (24 * elasticModulus * momentInertia) * (normPosition.^4 - 4*normPosition.^3 + 6*normPosition.^2);

%% Task 3: Plot the Deflection Curve
figure;
plot(beamPosition, deflection, 'b', 'LineWidth', 1.5);
xlabel('Position along beam, x (m)');
ylabel('Deflection, Y (m)');
title('Cantilever Beam Deflection under Uniform Load');
grid on;

%% Task 4: Effect of Varying I on Deflection
fprintf('\n--- Comparing Effect of Moment of Inertia ---\n');
inertiaCases = [momentInertia, momentInertia*2, momentInertia*0.5];   % compare original, stiffer, and more flexible beam
caseLabels = {'Original I', 'Doubled I (stiffer)', 'Halved I (more flexible)'};

figure; hold on;
for caseIdx = 1:length(inertiaCases)
    caseDeflection = (-uniformLoad * beamLength^4) / (24 * elasticModulus * inertiaCases(caseIdx)) * (normPosition.^4 - 4*normPosition.^3 + 6*normPosition.^2);
    plot(beamPosition, caseDeflection, 'LineWidth', 1.5, 'DisplayName', caseLabels{caseIdx});
end
xlabel('Position along beam, x (m)');
ylabel('Deflection, Y (m)');
title('Effect of Moment of Inertia on Beam Deflection');
legend('show', 'Location', 'best');
grid on;
hold off;

fprintf('Note: increasing I (stiffer cross-section) reduces deflection;\n');
fprintf('decreasing I increases deflection, since Y is inversely proportional to I.\n');
