%% ============================================================
%  QUESTION 1 TEMPLATE — PLOTTING (MATLAB)
%  Covers the three sub-question types that keep repeating:
%   (a) plot a single function y = f(x) over an interval
%   (b) plot a parametric curve x(t), y(t) with equal axis scaling
%   (c) plot two functions on the SAME axes for comparison
%
%  HOW TO REUSE ON EXAM DAY:
%   - Only the formula, interval, and titles/labels change.
%   - Copy the relevant section below, edit the highlighted lines,
%     and run each section (they are independent — use Run Section).
% ============================================================

%% ---------- (a) Single function plot ----------
% EXAMPLE (2023 paper):  y = 2x*exp(-x^2/4) / (1+x^2)   on [-10,10]
% EXAMPLE (2023-24 paper): y = 2x*exp(-x^4) / (1+x^3)   on [-5,5]
%
% >>> EDIT THESE THREE LINES ONLY <<<
x = linspace(-10, 10, 1000);           % interval [a,b] -> change a,b
y = (2*x.*exp(-x.^2/4)) ./ (1 + x.^2); % formula -> change to match question
titleStr = 'Plot of y = 2xe^{-x^2/4} / (1+x^2)';

figure;
plot(x, y, 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title(titleStr);


%% ---------- (b) Parametric curve with EQUAL axis scaling ----------
% EXAMPLE (2023 paper):    x = cos(t)cos(2t), y = sin(t)cos(2t), t in [-pi,pi]
% EXAMPLE (2023-24 paper): x = cos(t)cos(3t), y = sin(t)cos(3t), t in [-pi,pi]
%
% >>> EDIT THESE LINES ONLY <<<
t = linspace(-pi, pi, 1000);   % interval for t -> change bounds if needed
x = cos(t).*cos(2*t);          % x(t) formula -> change coefficient (2t, 3t, ...)
y = sin(t).*cos(2*t);          % y(t) formula -> change coefficient to match

figure;
plot(x, y, 'LineWidth', 1.5);
axis equal;                    % <-- this is the "equal scaling" requirement
grid on;
xlabel('x(t) = cos(t)cos(2t)');
ylabel('y(t) = sin(t)cos(2t)');
title('Parametric Curve: x = cos(t)cos(2t), y = sin(t)cos(2t)');


%% ---------- (c) Two functions on the SAME set of axes ----------
% EXAMPLE (2023 paper):    y = 2^x  and  y = x^4   on [-1, 20]
% EXAMPLE (2023-24 paper): y = 4^x  and  y = x^6   on [-1, 20]
%
% >>> EDIT THESE LINES ONLY <<<
x = linspace(-1, 20, 1000);   % interval -> change a,b
y1 = 2.^x;                    % first function -> change base (2, 4, ...)
y2 = x.^4;                    % second function -> change power (4, 6, ...)

figure;
hold on;
plot(x, y1, 'b-', 'LineWidth', 1.5, 'DisplayName', 'y = 2^x');
plot(x, y2, 'r--', 'LineWidth', 1.5, 'DisplayName', 'y = x^4');
hold off;
grid on;
xlabel('x');
ylabel('y');
title('Comparison of y = 2^x and y = x^4 on [-1, 20]');
legend('show', 'Location', 'best');

% NOTE: if one curve dwarfs the other on this interval, the examiner
% usually still just wants both on one axes (as asked). If they ever
% ask for a "log scale" version, swap plot() for semilogy().