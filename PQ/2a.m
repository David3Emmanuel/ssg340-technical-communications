%% ============================================================
%  QUESTION 2(a) TEMPLATE — LINEAR PROGRAMMING with linprog
%  Pattern seen in BOTH past papers:
%     min  f(x) = c1*x1 + c2*x2 + c3*x3
%     s.t. two "<=" inequality rows, ONE "=" equality row,
%          and box bounds 0<=x1<=.., 0<=x2<=.., 0<=x3<=..
%
%  linprog syntax:
%     x = linprog(f, A, b, Aeq, beq, lb, ub)
%  where the problem is ALWAYS phrased as a MINIMISATION and
%  inequalities must be in the form  A*x <= b.
%
%  ONLY the numbers below change on exam day — the structure
%  (2 inequalities + 1 equality + bounds) has repeated both times.
% ============================================================

%% Example from 2023-24 paper:
%   min f(x) = 2x1 - 5x2 + x3
%   s.t. 2x1 - 3x2 + x3   <= 10
%        2x1 +  x2 + 3x3  <= 20
%        2x1 -  x2        = 30
%        0 <= x1 <= 15
%        0 <= x2 <= 10
%        0 <= x3 <= 5

% >>> EDIT THE COEFFICIENTS BELOW TO MATCH THE ACTUAL QUESTION <<<

% Objective function coefficients (row vector, since linprog minimises c'x)
f = [2; -5; 1];              % coefficients of x1, x2, x3 in f(x)

% Inequality constraints A*x <= b
A = [2 -3  1;                % 2x1 - 3x2 +  x3 <= 10
     2  1  3];                % 2x1 +  x2 + 3x3 <= 20
b = [10; 20];

% Equality constraint Aeq*x = beq
Aeq = [2 -1 0];               % 2x1 - x2 = 30
beq = 30;

% Bounds: lb <= x <= ub
lb = [0; 0; 0];
ub = [15; 10; 5];

% Solve
options = optimoptions('linprog','Display','iter'); % 'iter' shows steps; use 'off' to silence
[x_opt, fval, exitflag, output] = linprog(f, A, b, Aeq, beq, lb, ub, options);

% Display results
fprintf('Optimal solution:\n');
fprintf('x1 = %.4f\n', x_opt(1));
fprintf('x2 = %.4f\n', x_opt(2));
fprintf('x3 = %.4f\n', x_opt(3));
fprintf('Minimum value of f(x) = %.4f\n', fval);

% NOTE: In a Live Script, you'd typically split this into separate
% Live Script sections: (1) define f,A,b,Aeq,beq,lb,ub  (2) call linprog
% (3) display x_opt and fval with fprintf or disp.