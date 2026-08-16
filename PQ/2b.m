%% ============================================================
%  QUESTION 2(b) TEMPLATE — QUADRATIC PROGRAMMING with quadprog
%
%  quadprog syntax:
%     x = quadprog(H, f, A, b, Aeq, beq, lb, ub)
%  solves:     min  0.5*x'*H*x + f'*x
%              s.t. A*x <= b,  Aeq*x = beq,  lb <= x <= ub
%
%  THE TRICKY PART every time is converting the given f(x) into H and f.
%  General rule for a 2-variable quadratic:
%     f(x) = a*x1^2 + b*x2^2 + c*x1*x2 + d*x1 + e*x2
%  matches  0.5*x'*H*x + f'*x  with:
%     H = [ 2a   c ;
%            c   2b ]
%     f = [ d ; e ]
%  (because 0.5*H11 = a, 0.5*H22 = b, and 0.5*(H12+H21) = 0.5*2*H12 = c)
% ============================================================

%% Example from 2023 paper:
%   f(x) = 0.5x1^2 + x2^2 - 2x1x2 - 2x1 - 6x2
%   => a=0.5, b=1, c=-2, d=-2, e=-6
%   => H = [1 -2; -2 2],  f = [-2; -6]
%
%   s.t. x1 + x2   <= 2
%        -x1 + 2x2 <= 2
%        2x1 + x2  <= 3
%        0 <= x1,  0 <= x2   (lower bounds only, no explicit upper bound)

% >>> EDIT H, f, A, b, lb, ub TO MATCH THE ACTUAL QUESTION <<<

H = [1 -2;
    -2  2];

f = [-2; -6];

A = [ 1  1;      % x1 +  x2 <= 2
     -1  2;      % -x1 + 2x2 <= 2
      2  1];     % 2x1 +  x2 <= 3
b = [2; 2; 3];

Aeq = [];        % no equality constraint in this example
beq = [];

lb = [0; 0];      % 0 <= x1, 0 <= x2
ub = [];          % no explicit upper bound given -> leave empty

% Solve
options = optimoptions('quadprog','Display','iter');
[x_opt, fval, exitflag, output] = quadprog(H, f, A, b, Aeq, beq, lb, ub, options);

fprintf('Optimal solution:\n');
fprintf('x1 = %.4f\n', x_opt(1));
fprintf('x2 = %.4f\n', x_opt(2));
fprintf('Minimum value of f(x) = %.4f\n', fval);

%% ---- Second worked example (2023-24 paper), for practice ----
% f(x) = (1/3)x1^2 + x2^2 - 4x1x2 - x1 + 7x2
%   a=1/3, b=1, c=-4, d=-1, e=7
%   H = [2/3 -4; -4 2],  f = [-1; 7]
% Constraints:
%   x1 + x2   <= 2
%   -x1 + 3x2 <= 2
%   -3x1 + x2 <= 3
%   0 <= x1, 0 <= x2
%
% H2 = [2/3 -4; -4 2];
% f2 = [-1; 7];
% A2 = [1 1; -1 3; -3 1];
% b2 = [2; 2; 3];
% lb2 = [0; 0];
% x_opt2 = quadprog(H2, f2, A2, b2, [], [], lb2, []);