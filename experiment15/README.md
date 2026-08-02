# Experiment 15 — Random Number Simulation

Covers Monte Carlo simulation with `rand`: coin tosses, dice rolls, a constrained
random walk, a traffic queue, and radioactive decay — each compared against its
theoretical result.

## Files

| File | Topic | Values |
| --- | --- | --- |
| [15.1.m](15.1.m) | Coin toss — 50 tosses, frequency bar chart | 🔧 Hardcoded |
| [15.2.m](15.2.m) | Dice roll — 100 rolls, mean and standard deviation | 🔧 Hardcoded |
| [15.3.m](15.3.m) | Random walk — sailor crossing a jetty, 1000 trials | 🔧 Hardcoded |
| [15.4.m](15.4.m) | Traffic flow — queue at a signalled intersection | 🔧 Hardcoded |
| [15.5.m](15.5.m) | Radioactive decay — 100 atoms over 100 minutes | 🔧 Hardcoded |

**Nothing prompts for input.** Every value sits at the top of its script, so you just
press **Run**. If your lab sheet specifies different figures, this is where they live:

| File | What you can change | Where |
| --- | --- | --- |
| 15.1.m | `num_tosses = 50` | [line 5](15.1.m#L5) |
| 15.2.m | `num_rolls = 100` | [line 5](15.2.m#L5) |
| 15.3.m | `num_walks`, `ship_distance`, `jetty_width`, the step probabilities | [lines 5–7](15.3.m#L5-L7), [lines 22–27](15.3.m#L22-L27) |
| 15.4.m | `total_intervals`, `prob_arrival`, the departure cap | [lines 5–7](15.4.m#L5-L7), [line 28](15.4.m#L28) |
| 15.5.m | `N0`, `time_mins`, `decay_rate` | [lines 5–7](15.5.m#L5-L7) |

> ⚠️ **Every script here uses `rand`, so your numbers change on every run.** That is
> the entire point of Monte Carlo simulation, not a fault — but it does mean the
> figures you paste into a report will not match a re-run. Add `rng(0);` at the top of
> a script to freeze it.

## Theoretical values to check against

The whole experiment is about comparing simulation to theory, so here is what each
script *should* converge towards:

| Script | Quantity | Theoretical value |
| --- | --- | --- |
| 15.1 | P(heads) | `0.50` |
| 15.2 | Mean roll | `3.50` |
| 15.2 | Standard deviation | `≈ 1.71` |
| 15.5 | P(decay within 100 min) | `≈ 0.9659` |
| 15.5 | Atoms remaining at 100 min | `≈ 3.4` |

With only 50 tosses, expect the simulated P(heads) to land anywhere from about `0.36`
to `0.64` — small samples are noisy, and saying so is a better answer than pretending
`0.5` should appear exactly.

`15.2.m` prints its standard deviation without a theoretical value beside it. For a
fair six-sided die it is `√(35/12) ≈ 1.71`, worth quoting in your report.

## Notes on individual scripts

### 15.3 — the drawn boundary and the actual boundary differ by one step

The loop continues while `abs(x) <= jetty_width`, so it only stops once `|x|` reaches
**4**, while the red dashed lines are drawn at **±3**. Trajectories will therefore
appear to cross the boundary by one step before terminating.

Not a crash, but it looks wrong on the plot. Either fix is one character:

```matlab
while y < ship_distance && abs(x) < jetty_width   % stop at ±3, matching the lines
```

Also note the walk is biased: `40%` forward against `60%` sideways combined, so the
sailor drifts laterally roughly one and a half times as fast as forward. Reaching the
ship needs about 37 steps on average, over which lateral scatter typically exceeds the
jetty half-width — which is why the success probability comes out well below half.
That difficulty is the result the task is demonstrating.

> 💡 If you get an error on the `plot(..., 'Color', [0.5 0.5 0.5 0.3])` line, your
> MATLAB is too old for the four-element colour (the fourth value is transparency).
> Drop it to `[0.5 0.5 0.5]` and the trajectories just render opaque.

### 15.4 — the queue is designed not to clear

Arrivals average `0.4 × 10 = 4` cars per interval, and the green light lets at most
`4` cars through per interval. Those are equal, so **during green the queue holds
roughly steady rather than draining** — cars arrive as fast as they leave.

The backlog built during the 30 seconds of red therefore persists to the end of the
simulation. That is a genuine finding about the intersection, not a bug: the signal
timing is right at capacity. Raise the departure cap at [line 28](15.4.m#L28) or lower
`prob_arrival` and you will see the queue actually clear.

The light schedule is correct, if slightly opaque: `mod(time_sec - 1, 60) < 30` gives
Red at `t = 10, 20, 30` and Green at `t = 40, 50, 60`.

### 15.5 — simulated decay runs marginally faster than the theoretical curve

The simulation asks each surviving atom once per minute whether it decays, with
probability `0.0338`. That is a **discrete** process, so survival after `t` minutes is
`(1 − 0.0338)^t`. The red theoretical line uses the **continuous** model
`e^(−0.0338t)`.

These are not quite the same — the discrete version decays slightly faster, ending at
about `3.2` atoms against the continuous `3.4`. With only 100 atoms that gap is far
smaller than the run-to-run randomness, so you will not reliably see it, but it is the
correct explanation if the blue curve sits persistently just below the red one.

Useful for your report: this decay rate gives a **half-life of `ln(2)/0.0338 ≈ 20.5`
minutes**, so 100 minutes is very nearly five half-lives — hence only a few atoms
survive.

The inner loop skips atoms that have already decayed, which is what makes the
simulation physically correct: a decayed atom cannot decay twice.
