%% Task 1: Define Complex Function and Grid
realAxis = -2*pi:0.1:2*pi;
imagAxis = -2*pi:0.1:2*pi;
[realGrid, imagGrid] = meshgrid(realAxis, imagAxis);
complexGrid = realGrid + 1i*imagGrid;

funcValues = (exp(1i*complexGrid) - 1) ./ complexGrid;   % f(z) = (e^{iz}-1)/z
funcValues(complexGrid == 0) = 1;   % handle singularity at z=0 (limit = i, but keep finite for plotting; adjust if needed)

%% Task 2: Real and Imaginary Parts
figure;
surf(realGrid, imagGrid, real(funcValues));
title('Real part of f(z)');
xlabel('Re(z)'); ylabel('Im(z)'); zlabel('Re(f(z))');

figure;
surf(realGrid, imagGrid, imag(funcValues));
title('Imaginary part of f(z)');
xlabel('Re(z)'); ylabel('Im(z)'); zlabel('Im(f(z))');

%% Task 3: Modulus and Argument
figure;
contourf(realGrid, imagGrid, abs(funcValues), 20);
colormap(hot);
colorbar;
title('Modulus |f(z)|');

figure;
contourf(realGrid, imagGrid, angle(funcValues), 20);
colormap(jet);
colorbar;
title('Argument arg(f(z))');

%% Task 4: Customize Plots
figure;
surf(realGrid, imagGrid, abs(funcValues), 'EdgeColor', 'none');
colormap(cool);
colorbar;
title('Customized |f(z)| Surface');

%% Task 5: Animate as z varies along a path
figure;
pathAngles = linspace(0, 2*pi, 200);
pathPoints = 3 * exp(1i*pathAngles);   % circular path of radius 3

pathReal = real(pathPoints);
pathImag = imag(pathPoints);

hold on;
axis([-4 4 -4 4]);
xlabel('Re(z)'); ylabel('Im(z)');
title('Animation: z traveling along a path');
markerHandle = plot(pathReal(1), pathImag(1), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

for frameIdx = 1:length(pathAngles)
    set(markerHandle, 'XData', pathReal(frameIdx), 'YData', pathImag(frameIdx));
    drawnow;
    pause(0.02);
end
hold off;
