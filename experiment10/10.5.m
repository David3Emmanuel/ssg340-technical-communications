%% Task 1-3: Generalized Newton's Method (newtgen) with function handles
fprintf('--- Generalized Newton (newtgen) ---\n');

f1  = @(x) x^3 + x - 3;
f1p = @(x) 3*x^2 + 1;
root1 = newtgen(f1, f1p, 1, 1e-8, 100);
fprintf('Root of x^3+x-3: x = %.8f\n', root1);

f2  = @(x) x^2 - 2;
f2p = @(x) 2*x;
root2 = newtgen(f2, f2p, 1, 1e-8, 100);
fprintf('Root of x^2-2 (sqrt(2)): x = %.8f\n', root2);

%% Function (generalized Newton's method)
function x = newtgen(f, fp, x0, tol, maxIter)
    x = x0;
    for i = 1:maxIter
        xNew = x - f(x)/fp(x);
        if abs(xNew - x) < tol
            x = xNew;
            return;
        end
        x = xNew;
    end
end