# Experiment 19 — Metaheuristic Optimization Algorithms

Ten nature-inspired optimization algorithms, each implemented from scratch and each
applied to a constrained minimisation of `f(x) = x² + 10·sin(x)` or a two-variable
relative.

## ✅ No toolboxes required (almost)

Unlike [experiment18](../experiment18/README.md), which leans on the Optimization
Toolbox, **every algorithm here is hand-written in base MATLAB**. No `ga`, no
`particleswarm`, no `simulannealbnd` — the loops, selection, mutation and cooling
schedules are all written out. That means these run on any MATLAB installation.

The one exception is `19.5.m` — see the toolbox note below.

## Files

| File | Algorithm | Search space |
| --- | --- | --- |
| [19.1.m](19.1.m) | Genetic Algorithm (GA) | 2-D, `[-2, 2]²` |
| [19.2.m](19.2.m) | Particle Swarm Optimization (PSO) | 2-D, `[-1.5, 1.5]²` |
| [19.3.m](19.3.m) | Simulated Annealing (SA) | 1-D, `[-2, 2]` |
| [19.4.m](19.4.m) | Differential Evolution (DE) | 1-D, `[0, 3]` |
| [19.5.m](19.5.m) | Ant Colony Optimization (ACO) | 1-D, `[0, 3]` |
| [19.6.m](19.6.m) | Firefly Algorithm (FA) | 1-D, `[0, 2]` |
| [19.7.m](19.7.m) | Bat Algorithm (BA) | 1-D, `[-1, 2]` |
| [19.8.m](19.8.m) | Grey Wolf Optimizer (GWO) | 1-D, `[-1.5, 1.5]` |
| [19.9.m](19.9.m) | Artificial Bee Colony (ABC) | 1-D, `[-0.5, 2]` |
| [19.10.m](19.10.m) | Memetic Algorithm (MA) | 1-D, `[-0.5, 1]` |

All values are hardcoded — population sizes, iteration counts, mutation rates and
bounds sit at the top of each file. Nothing prompts for input.

> **Every script uses `rand`, so your answer changes on every run.** That is inherent
> to metaheuristics, not a fault. Add `rng(0);` at the top if you need the same result
> twice — essential if you are pasting a convergence plot into a report.

## ⚠ How the constraints work — read this before trusting the printed `f`

None of these algorithms handle constraints directly. Each one instead uses a
**penalty method**: the objective function adds a large cost for any violated
constraint, so infeasible points score badly and get selected out.

```matlab
penalty = 100*max(0, g1)^2 + 100*max(0, -g2)^2;
val = f + penalty;      % <-- what gets minimised and printed
```

**The number printed as `f=` is `val`, not the true objective.** If the best point
found is infeasible, the printed value silently includes the penalty and is inflated.
You cannot compare two algorithms by their printed `f` unless both landed on feasible
points.

## ⚠ Five scripts have constraints that cannot be satisfied

This is the important one. The scripts all **run without error**, produce a
convergence plot, and print a result — but in five of them the constraint set is
empty or degenerate, so what the algorithm actually minimises is the penalty, not the
problem.

| File | Constraints as written | Problem |
| --- | --- | --- |
| **19.2** | `x ≥ 1.5`, `y ≥ 1.5`, `x + y ≤ 2` | **Impossible.** The first two force `x + y ≥ 3`, which contradicts the third. |
| **19.4** | `x² ≤ 4` (so `−2 ≤ x ≤ 2`) and `x ≥ 2` | **Degenerate.** Only `x = 2` qualifies — a single point, nothing to search. |
| **19.6** | `x ≥ 1.5` and `x² ≤ 2` (so `x ≤ 1.414`) | **Impossible.** No `x` is both ≥ 1.5 and ≤ 1.414. |
| **19.7** | `x ≤ 2` and `x² + 1 ≤ 0` | **Impossible.** `x² + 1` is at least 1, never ≤ 0. The code comment admits this. |
| **19.8** | `x ≥ 1.5` and `x² + 0.5 ≤ 0` | **Impossible.** Same problem — `x² + 0.5` is never ≤ 0. |

The last two look like typos with an obvious fix: `x² + 1 ≤ 0` was probably meant to
be `x² − 1 ≤ 0`, and `x² + 0.5 ≤ 0` to be `x² − 0.5 ≤ 0`. Both become sensible box
constraints that way. For 19.4, changing `g2` from `x ≥ 2` to `x ≤ 2` would give a
real interval to search.

**Check these against your manual before submitting.** If the manual really does
specify these constraints, say so in your report — "the feasible region is empty, so
the algorithm minimises constraint violation instead" is a perfectly good observation
and shows you understood what the penalty method is doing.

## ✅ The five that are correctly posed

These have a genuine feasible region, so their answers are meaningful. Known optima,
for checking your output:

| File | Feasible region | Expected best | `f` there |
| --- | --- | --- | --- |
| 19.1 | `x, y ≥ 0.5`, `x² + y² ≤ 1` | `x ≈ 0.5`, `y ≈ 0.5` | `≈ 5.17` |
| 19.3 | `1 ≤ x ≤ 2` | `x ≈ 1` | `≈ 9.41` |
| 19.5 | `1 ≤ x ≤ 3` | `x ≈ 1` | `≈ 9.41` |
| 19.9 | `1.5 ≤ x ≤ 2` | `x ≈ 1.5` | `≈ 12.22` |
| 19.10 | `0.5 ≤ x ≤ 1` | `x ≈ 0.5` | `≈ 5.04` |

In every one of these the optimum sits on the **boundary** of the feasible region,
because `x² + 10·sin(x)` is increasing across all these intervals. A good algorithm
should press right up against the lower bound. If yours settles well inside the
interval, it has converged early — increase the iteration count or the mutation size.

## ⚠ 19.5 uses `range`, which needs the Statistics Toolbox

[19.5.m:16](19.5.m#L16) calls `range(archive)`. Despite how ordinary it looks, `range`
is **not** base MATLAB — it comes from the Statistics and Machine Learning Toolbox. If
you get an "Undefined function" error there, substitute the base-MATLAB equivalent:

```matlab
sigma = evapRate * (max(archive) - min(archive)) + 0.01;
```

That is exactly what `range` computes, so the behaviour is unchanged. Every other
script in this folder is pure base MATLAB.

## Notes on individual algorithms

**19.1 GA** — Real-valued encoding with whole-arithmetic crossover
(`alpha*p1 + (1-alpha)*p2`) rather than bit-string crossover, Gaussian mutation, and
elitism keeping the best two individuals each generation. Parents are drawn from the
better half of the sorted population, which is the selection pressure.

**19.2 PSO** — Standard inertia-weight formulation with `w = 0.7`, `c1 = c2 = 1.5`.
Velocity is never clamped, only position, so particles can overshoot and get pinned to
a bound for a few iterations. Normal for a basic PSO.

**19.3 SA** — Geometric cooling at `0.95` from `T = 100` down to `1e-3`, which works
out to about 225 iterations. The acceptance test `rand < exp(-dE/T)` is what lets it
take uphill steps early and stop doing so as `T` falls. Its convergence plot is the
noisiest of the ten — that is the algorithm working, not misbehaving.

**19.4 DE** — `DE/rand/1` mutation with `F = 0.8`, `CR = 0.9`. Note the crossover
applies to the whole (single) variable at once, since the problem is 1-D.

**19.5 ACO** — A continuous adaptation, sampling new solutions around members of the
better half of an archive, with the spread shrinking as the archive converges. Classic
ACO is for discrete graphs; this is the standard continuous variant.

**19.6 FA** — Full `O(n²)` pairwise comparison each iteration, with attractiveness
decaying as `exp(-gamma*r²)`. The slowest of the ten by some margin.

**19.7 BA** — Frequency-driven velocity updates plus a local random walk around the
current best when `rand > r0`.

**19.8 GWO** — Position updates averaged from the three best wolves (alpha, beta,
delta). The coefficient `a` decays linearly from 2 to 0 across the run, shifting the
search from exploration to exploitation.

**19.9 ABC** — Implements the employed-bee and scout-bee phases; the onlooker-bee
phase of the textbook algorithm is not included. Worth mentioning if you are asked to
describe the algorithm in full.

**19.10 MA** — A genetic algorithm with a hill-climbing local search applied to the
best individual each generation. That hybrid of global and local search is what makes
it "memetic", and it is why this one converges in 60 generations where the others take
100.
