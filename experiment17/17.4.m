fprintf('\n--- 17.4: Euler''s Method Population Growth ---\n');
a = 0.5;   % growth rate (not specified exactly, using typical value)
N0 = 1000;
tEnd = 5;
hValues = [2, 1, 0.5];

figure; hold on;
for h = hValues
    t = 0:h:tEnd;
    N = zeros(size(t));
    N(1) = N0;
    for i = 1:length(t)-1
        N(i+1) = N(i) + h * a * N(i);
    end
    plot(t, N, '-o', 'DisplayName', ['h = ', num2str(h)]);
end

tExact = 0:0.01:tEnd;
Nexact = N0 * exp(a*tExact);
plot(tExact, Nexact, 'k--', 'DisplayName', 'Exact solution');

xlabel('Time'); ylabel('Population N(t)');
title('Euler''s Method: Population Growth');
legend('show', 'Location', 'best'); grid on; hold off;