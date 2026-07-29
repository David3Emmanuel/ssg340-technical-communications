# Experiment 18 — Optimization

Covers linear, integer and quadratic programming, dynamic programming on graphs, LP
duality and sensitivity analysis, branch and bound, optimal control, KKT conditions,
and the assignment problem.

## Files

| File | Topic | Needs |
| --- | --- | --- |
| [18.1.m](18.1.m) | Linear Programming — `linprog` | Optimization Toolbox |
| [18.2.m](18.2.m) | Integer Programming for scheduling — `intlinprog` | Optimization Toolbox |
| [18.3.m](18.3.m) | Convex optimization — `cvx_begin` / `cvx_end` | ⚠️ **CVX** (third-party) |
| [18.4.m](18.4.m) | Quadratic Programming, portfolio — `quadprog` | Optimization Toolbox |
| [18.5.m](18.5.m) | Dynamic Programming, shortest path — `digraph` | ✅ Base MATLAB |
| [18.6.m](18.6.m) | LP duality and sensitivity — `linprog` | Optimization Toolbox |
| [18.7.m](18.7.m) | Branch and bound — `intlinprog` | Optimization Toolbox |
| [18.8.m](18.8.m) | Optimal control (PMP) — `ode45` | ✅ Base MATLAB |
| [18.9.m](18.9.m) | KKT conditions — `fmincon` | Optimization Toolbox |
| [18.10.m](18.10.m) | Assignment problem — `matchpairs` | ✅ Base MATLAB (R2019a+) |

All values are hardcoded. Nothing prompts for input — just press **Run**.

## ⚠ Toolbox requirements

**Six of these scripts need the Optimization Toolbox** (18.1, 18.2, 18.4, 18.6, 18.7,
18.9). If a course mate does not have it they will get an "Undefined function" error
on `linprog`, `intlinprog`, `quadprog` or `fmincon`.

Check what you have with:

```matlab
ver                        % lists every installed toolbox
license('test', 'Optimization_Toolbox')   % 1 = available
```

The three base-MATLAB scripts (18.5, 18.8, 18.10) run on any installation.

**18.3 is different — it needs CVX, which is not a MathWorks product at all.** It is a
free third-party package you download and install yourself. Full instructions below.

---

## 📦 Installing CVX (needed for 18.3 only)

CVX does **not** ship with MATLAB and is **not** in the Add-On Explorer — you have to
download it separately. It is free.

1. Go to the official website: **http://cvxr.com/cvx/download/**
2. Download the `.zip` for your operating system (Windows / Mac / Linux).
3. Extract the `cvx` folder anywhere on your computer — your Documents folder is fine.
4. Open MATLAB.
5. Change your current directory to the extracted `cvx` folder, either with the folder
   browser on the left or by typing:

   ```matlab
   cd '/path/to/your/cvx'
   ```

6. From inside that folder, run:

   ```matlab
   cvx_setup
   ```

MATLAB runs an installation script and adds CVX to your path automatically. Once it
reports **Complete**, `18.3.m` will run without any issues.

### After installing

Check it took:

```matlab
cvx_version     % prints the installed version
```

> ⚠️ **If CVX stops working after you restart MATLAB**, its path was not saved. Run
> `cvx_setup` once more from the `cvx` folder and let it save the path, or add
> `savepath` afterwards. This is the most common complaint and it is not a broken
> install.

Note that `ver` and `license('test', ...)` will **not** list CVX — those only report
MathWorks products. Use `cvx_version` instead.

## Expected results

All ten scripts are deterministic — no `rand` anywhere — so you should get exactly
these numbers every time. Useful for checking your run without re-deriving the maths:

| Script | Expected output |
| --- | --- |
| 18.1 | `x1 = 4`, `x2 = 2`, maximum `26` |
| 18.2 | `x1 = 0`, `x2 = 4`, minimum `8` |
| 18.3 | `x1 = 2`, `x2 = 2`, minimum `8` |
| 18.4 | `w1 = 0.25`, `w2 = 0.75`, objective `0.875` |
| 18.5 | Shortest path cost `7` |
| 18.6 | Objective `26`, shadow prices `1` and `2` |
| 18.7 | `x1 = 0`, `x2 = 0`, cost `0` — see below |
| 18.9 | `x1 = 1`, `x2 = 0`, multipliers `[0; 2]` |
| 18.10 | Total cost `11` (worker 1→task 3, 2→1, 3→2) |

## ⚠ Two things to check before you submit

### 18.7 — the answer is trivially zero

The problem is stated as **minimise** `2x₁ + 3x₂` subject to `x₁ + 2x₂ ≤ 6`,
`3x₁ + x₂ ≤ 7`, with `x ≥ 0`. Both costs are positive, both constraints are upper
bounds, and there is nothing forcing the variables above zero — so the optimum is
`x = (0, 0)` at a cost of `0`. The solver is right, but the problem demonstrates
nothing about branch and bound, because no branching is needed.

Compare 18.2, which uses a `≥` constraint (`x₁ + x₂ ≥ 4`) and therefore has a
non-trivial answer.

Almost certainly the manual intends either a **maximisation** or `≥` constraints.
As a maximisation the same data gives `x = (0, 3)` with objective `9`, which actually
exercises the method. Check your sheet — if it is a maximisation, negate the
objective:

```matlab
f_bb = [-2; -3];   % maximise 2*x1 + 3*x2
```

and report `-f_bb_val` as the optimal value.

### 18.8 — the simulated trajectory is identically zero

The comment describes minimising `J = ∫(x² + u²)dt` subject to `ẋ = u`, `x(0) = 0`,
`x(T) = 1`. What the code actually runs is:

```matlab
[t_ctrl, x_ctrl] = ode45(@(t, x) -x, t_span, 0);
```

With `x(0) = 0` and `ẋ = −x`, the state never leaves zero — `x_ctrl` is all zeros for
the whole run. The terminal condition `x(T) = 1` is never applied, and the script
prints only how many time steps it took, so the empty result is easy to miss.

The analytical solution to the stated problem is `x(t) = sinh(t)/sinh(T)`, which rises
from `0` to `1` across the interval. If you need this task to actually demonstrate
something, that closed form can be plotted against the numerical trajectory. As it
stands the script runs without error but does not solve the problem in its comment.

## Notes on the rest

### 18.5 — three different "shortest paths", all correct

The graph has a genuine three-way tie. Every route from node 1 to node 5 costs
exactly `7`:

| Path | Cost |
| --- | --- |
| 1 → 2 → 3 → 5 | 2 + 3 + 2 = 7 |
| 1 → 2 → 4 → 5 | 2 + 4 + 1 = 7 |
| 1 → 3 → 5 | 5 + 2 = 7 |

`shortestpath` returns one of them and highlights it in red. If you and a course mate
get different highlighted paths, **neither of you is wrong** — the cost is what
matters, and it is `7` either way. Worth saying in your report; it is a good example
of an optimum that is not unique.

### 18.6 — reading the shadow prices

Same LP as 18.1, but this run also captures `lambda`. Both constraints are binding at
the optimum, and the two dual values printed are `1` and `2`.

They mean: one extra unit of the first resource is worth `1` more unit of objective,
and one extra unit of the second is worth `2`. The second constraint is the more
valuable one to relax. Note the objective was negated to turn the maximisation into
the minimisation `linprog` expects, so mind the sign convention if you quote these
numbers directly.

### 18.3 — why the answer is what it is

Minimises `x₁² + x₂²` subject to `x₁ + x₂ = 4` and both variables non-negative. The
answer splits the total evenly: `x₁ = x₂ = 2`, objective `8`.

That is the whole point of a convex problem — squaring penalises imbalance, so an
uneven split like `(4, 0)` costs `16`, double the optimum. There is exactly one
minimum and no local traps, which is what makes CVX able to solve it directly rather
than searching like the metaheuristics in
[experiment19](../experiment19/README.md).

`cvx_begin quiet` suppresses the solver's progress output. Drop `quiet` if you want to
see which solver ran and how it converged — useful material for a report.

### 18.10 — `matchpairs` needs R2019a or newer

The Hungarian method is called through `matchpairs`, which is base MATLAB but only
from R2019a. The second argument (`1000`) is the cost of leaving a row unmatched —
set high so the solver always prefers a complete assignment.
