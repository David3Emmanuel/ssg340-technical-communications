%% Task 2 & 3: Newton's Method for x^3 + x - 3 = 0
x0 = 1;          % initial guess
tol = 1e-8;
maxIter = 100;

x = x0;
fprintf('--- Newton''s Method ---\n');
for i = 1:maxIter
    fx = f(x);
    fpx = fprime(x);
    xNew = x - fx/fpx;
    err = abs(xNew - x);
    fprintf('Iter %d: x = %.8f, error = %.2e\n', i, xNew, err);
    if err < tol
        x = xNew;
        break;
    end
    x = xNew;
end
fprintf('Root found: x = %.8f after %d iterations\n', x, i);

%% Functions (M-file style, kept local here)
function y = f(x)
    y = x^3 + x - 3;
end

function y = fprime(x)
    y = 3*x^2 + 1;
end