# Experiment 4 — Projectile Motion, Quadratic Roots and Simultaneous Equations

Covers user-defined functions with multiple inputs and outputs, numerical integration
with the Euler method, branching on the discriminant of a quadratic, and solving
linear systems with the backslash operator.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [4.1.m](4.1.m) | Projectile motion, air resistance, varying angles and velocities | ✏️ **Change this** |
| [4.2.m](4.2.m) | `solve_quadratic` — roots of a quadratic equation | ✏️ **Change this** |
| [4.3.m](4.3.m) | `solve_linear_system` — simultaneous equations | ✏️ **Change this** |

**All three files in this experiment use values chosen by us, not by the lecturer.**
The functions themselves are correct and general — it is only the *test inputs* at
the bottom of each script that you need to swap out.

## ✏️ What to change in 4.1.m — Projectile motion

The lab sheet did not give us a launch velocity or angle, so these were picked:

```matlab
v0_std = 50;          % <-- your own initial velocity (m/s)
theta_std_deg = 45;   % <-- your own launch angle (degrees)
```

Further down, three more sets of values drive the other subplots:

```matlab
m = 1.0;   b = 0.25;              % <-- air-resistance mass and drag coefficient
test_angles = [30, 45, 60, 75];   % <-- angles for the "varying angles" subplot
test_velocities = [20, 30, 40, 50]; % <-- velocities for the "varying velocity" subplot
```

`g = 9.8` at the top is standard gravity and does not need changing unless your sheet
asks for `9.81`.

## ✏️ What to change in 4.2.m — Quadratic solver

`solve_quadratic(a, b, c)` handles every case correctly on its own — real distinct
roots, a repeated root, complex roots, and the degenerate cases where `a = 0`. **Do
not change the function.**

What you *do* change is the four test calls underneath it. Right now they are:

```matlab
[r1, r2] = solve_quadratic(1, -5, 6);   % real distinct roots  -> x = 3, 2
[r1, r2] = solve_quadratic(1, -4, 4);   % repeated root        -> x = 2
[r1, r2] = solve_quadratic(1,  2, 5);   % complex roots        -> -1 ± 2i
[r1, ~]  = solve_quadratic(0,  2, -4);  % edge case, a = 0     -> x = 2
```

Substitute the coefficients your lab sheet gives you. Keep one call per case if your
sheet asks you to demonstrate all the root types — if you replace all four with
equations that happen to have real roots, you will not have shown that the complex
and edge-case branches work.

## ✏️ What to change in 4.3.m — Simultaneous equations

Same idea: `solve_linear_system(A, B)` is general and should be left alone. It
compares `rank(A)` with `rank([A B])` to decide between a unique solution, infinite
solutions, and no solution.

The three test cases below it are ours:

```matlab
A1 = [1, 1; 1, -1];  B1 = [5; 1];    % x + y = 5,  x - y = 1   -> unique solution
A2 = [1, 1; 2, 2];   B2 = [5; 10];   % x + y = 5,  2x + 2y = 10 -> infinite solutions
A3 = [1, 1; 1, 1];   B3 = [5; 3];    % x + y = 5,  x + y = 3    -> no solution
```

Replace them with your own systems. If you do, **also update the comment lines above
each one**, since they spell out the equations being solved and would otherwise be
wrong. As with the quadratic, keep one system per outcome so all three branches of
the function are demonstrated.
