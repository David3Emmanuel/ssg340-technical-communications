fprintf('\n--- 17.5: Bacteria Growth (Euler) ---\n');
r = 0.8; N0 = 1000; tEnd = 5;
hValues = [1, 0.5, 0.1];

figure; hold on;
for h = hValues
    t = 0:h:tEnd;
    N = zeros(size(t));
    N(1) = N0;
    for i = 1:length(t)-1
        N(i+1) = N(i) + h * r * N(i);
    end
    plot(t, N, '-o', 'DisplayName', ['h = ', num2str(h)]);
end

tExact = 0:0.01:tEnd;
Nexact = N0 * exp(r*tExact);
plot(tExact, Nexact, 'k--', 'DisplayName', 'Exact solution');

xlabel('Time'); ylabel('N(t)');
title('Bacteria Growth: Euler vs Exact');
legend('show', 'Location', 'best'); 
grid on; 
hold off;