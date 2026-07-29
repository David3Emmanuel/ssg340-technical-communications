%% Task 1: Define Complex Function and Grid
reRange = -2*pi:0.1:2*pi;
imRange = -2*pi:0.1:2*pi;
[ReZ, ImZ] = meshgrid(reRange, imRange);
Z = ReZ + 1i*ImZ;

F = (exp(1i*Z) - 1) ./ Z;   % f(z) = (e^{iz}-1)/z
F(Z == 0) = 1;               % handle singularity at z=0 (limit = i, but keep finite for plotting; adjust if needed)

%% Task 2: Real and Imaginary Parts
figure;
surf(ReZ, ImZ, real(F));
title('Real part of f(z)');
xlabel('Re(z)'); ylabel('Im(z)'); zlabel('Re(f(z))');

figure;
surf(ReZ, ImZ, imag(F));
title('Imaginary part of f(z)');
xlabel('Re(z)'); ylabel('Im(z)'); zlabel('Im(f(z))');

%% Task 3: Modulus and Argument
figure;
contourf(ReZ, ImZ, abs(F), 20);
colormap(hot);
colorbar;
title('Modulus |f(z)|');

figure;
contourf(ReZ, ImZ, angle(F), 20);
colormap(jet);
colorbar;
title('Argument arg(f(z))');

%% Task 4: Customize Plots
figure;
surf(ReZ, ImZ, abs(F), 'EdgeColor', 'none');
colormap(cool);
colorbar;
title('Customized |f(z)| Surface');

%% Task 5: Animate as z varies along a path
figure;
theta = linspace(0, 2*pi, 200);
pathZ = 3 * exp(1i*theta);   % circular path of radius 3

reVals = real(pathZ);
imVals = imag(pathZ);

hold on;
axis([-4 4 -4 4]);
xlabel('Re(z)'); ylabel('Im(z)');
title('Animation: z traveling along a path');
h = plot(reVals(1), imVals(1), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

for i = 1:length(theta)
    set(h, 'XData', reVals(i), 'YData', imVals(i));
    drawnow;
    pause(0.02);
end
hold off;