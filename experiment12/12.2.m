%% Task 1: Lorenz System Definition + Task 2-5: Animate
sigma = 10; rho = 28; beta = 8/3;
dt = 0.01;
steps = 5000;

x = zeros(1, steps); y = zeros(1, steps); z = zeros(1, steps);
x(1) = 1; y(1) = 1; z(1) = 1;   % initial conditions [1,1,1]

for i = 1:steps-1
    dx = sigma * (y(i) - x(i));
    dy = x(i) * (rho - z(i)) - y(i);
    dz = x(i)*y(i) - beta*z(i);

    x(i+1) = x(i) + dx*dt;
    y(i+1) = y(i) + dy*dt;
    z(i+1) = z(i) + dz*dt;
end

figure;
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
title('Lorenz Attractor Animation');
grid on; hold on;
view(3);

h = plot3(x(1), y(1), z(1), 'b', 'LineWidth', 1);

for i = 1:500:steps   % update every 500 points as instructed
    randColor = rand(1,3);
    set(h, 'XData', x(1:i), 'YData', y(1:i), 'ZData', z(1:i), 'Color', randColor);
    drawnow;
end

%% Task 6: Save the Animation
savefig(gcf, 'lorenz_attractor.fig');
print(gcf, 'lorenz_final.jpg', '-djpeg');