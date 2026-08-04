# Experiment 17 — Numerical Methods

Covers root finding (Newton and bisection), numerical integration, Euler's method,
solving ODE systems with `ode23` and `ode45`, the Crank-Nicolson scheme for heat
conduction, and interactive curve fitting.

## Files

| File | Topic | Values |
| --- | --- | --- |
| [17.1.m](17.1.m) | Newton's method, four starting points | ✅ Given |
| [17.2.m](17.2.m) | Bisection method on the same equation | ✅ Given |
| [17.3.m](17.3.m) | Trapezoidal rule | ✅ Given |
| [17.4.m](17.4.m) | Euler's method — population growth | ⚠️ **`a` assumed** |
| [17.5.m](17.5.m) | Euler's method — bacteria growth | ✅ Given |
| [17.6.m](17.6.m) | System of ODEs with `ode23` | ⚠️ **Initial condition assumed** |
| [17.7.m](17.7.m) | Heat conduction, Crank-Nicolson | ✅ Given |
| [17.8.m](17.8.m) | Same system with `ode45`, 3-D phase plot | ⚠️ **Initial condition assumed** |
| [17.9.m](17.9.m) | Phase trajectories for three ε values | ⚠️ **ε values assumed** |
| [17.10.m](17.10.m) | Cubic polynomial fit — **interactive** | 🖱️ You click the points |

## ⚠️ Assumed values — check these against your manual

Four scripts use numbers that were **not** specified in the manual. They are
reasonable standard choices and the scripts run correctly with them, but if your
instructor gives exact figures, swap them in:

| File | Assumed | Where |
| --- | --- | --- |
| 17.4.m | Growth rate `a = 0.5` | [line 2](17.4.m#L2) |
| 17.6.m | Initial condition `initialState = [1; 1; 1]` | [line 7](17.6.m#L7) |
| 17.8.m | Initial condition `initialState = [1; 1; 1]` | [line 7](17.8.m#L7) |
| 17.9.m | `epsilonValues = [0.5, 1, 2]` | [line 2](17.9.m#L2) |

Everything else — 17.5's `r = 0.8` and `N(0) = 1000`, 17.7's rod length, time span
and initial temperature profile, 17.3's limits and step size — comes from the manual.

---

## Write-ups

### 17.1 — Newton's Method

Solves `f(x) = x³ + x − 3 = 0` from four different starting points (`0`, `1`, `2`,
`−1`) to test convergence behaviour. All four converge to the same root, about
`1.213`.

They must: the derivative `3x² + 1` is at least `1` for every real `x`, so the
function is strictly increasing and has exactly one real root — and the method can
never divide by zero. Even the `x0 = −1` start, which begins on the far side of the
root, lands on it.

### 17.2 — Bisection Method

Solves the same equation on the bracketing interval `[0, 2]`, chosen because
`f(0) = −3` is negative and `f(2) = 7` is positive, so a root must lie between them.
Tolerance `0.05`.

Expect **5 bisections**: the interval half-width starts at `1` and halves each pass
(`1 → 0.5 → 0.25 → 0.125 → 0.0625 → 0.03125`), stopping on the first value below
`0.05`. Compare that against 17.1 — Newton reaches eight decimal places in about the
same number of steps. That contrast is the point of running both.

### 17.3 — Trapezoidal Rule

Numerically integrates `∫₀⁴ x² dx` with step size `h = 1`, compared against the exact
analytical result `64/3`.

Known answers, so you can check your output directly:

| | Value |
| --- | --- |
| Trapezoidal approximation | `22.000000` |
| Exact | `21.333333` |
| Error | `0.666667` |

The approximation is **too high** because `x²` is convex — every trapezoid sits above
the curve it approximates.

### 17.4 — Euler's Method (Population Growth)

Solves `dN/dt = aN`, `N(0) = 1000`, using step sizes `h = 2, 1, 0.5`, plotted against
the exact solution `N₀e^{at}`. Growth rate `a = 0.5` was assumed — see the table above.

> ⚠️ **The `h = 2` curve stops short of the end.** `t = 0:2:5` gives `[0 2 4]`, so
> that line ends at `t = 4` while the others reach `t = 5`. `endTime` is not a multiple
> of `2`. Not a bug, but if you are asked why one line is shorter, that is why.

All three Euler curves sit **below** the exact solution, and the gap shrinks as `h`
gets smaller. That systematic underestimation of exponential growth is the result the
task is after.

### 17.5 — Euler's Method (Bacteria Growth)

Same structure as 17.4 but with the manual's exact given values: `r = 0.8`,
`N(0) = 1000`, step sizes `h = 1, 0.5, 0.1`.

The larger growth rate makes the error much more dramatic than in 17.4 — at `t = 5`
the exact value is around `54,600` while the `h = 1` Euler curve reaches only about
`18,900`. Roughly a third. Shrinking `h` to `0.1` closes most of the gap.

### 17.6 — System of ODEs (`ode23`)

Solves a 3-variable coupled ODE system over `t = [0, 20]` with initial condition
`[1, 1, 1]`, plotted as three stacked time series.

This is the **Lorenz system** — the coefficients `10`, `28` and `8/3` are σ, ρ and β.
You have already solved it once in [12.2.m](../experiment12/12.2.m) using hand-written
Euler steps; here MATLAB's adaptive solver does the work. Worth mentioning in your
report as a comparison of approaches.

### 17.7 — Heat Conduction (Crank-Nicolson)

Solves the 1-D heat equation on a rod of length `1` over `t = [0, 0.5]`, with the
specified piecewise initial temperature distribution (a tent peaking at `x = 0.5`) and
zero boundary conditions. Diffusivity is taken as `1`.

Crank-Nicolson is **unconditionally stable**, so this will not blow up whatever grid
you choose — which is its main advantage over an explicit scheme. With the current
`numSpaceSteps = 20, numTimeSteps = 100` the parameter `diffusionRatio` works out to exactly `1`. If the surface
shows small ripples near `t = 0` around the kink at `x = 0.5`, that is the scheme
reacting to the sharp corner in the initial condition; raising `numTimeSteps` smooths it out.

### 17.8 — System of ODEs (`ode45`)

The same Lorenz system as 17.6, solved with `ode45` instead of `ode23`, plotted as a
3-D phase trajectory — the butterfly shape.

> 💡 **Do not expect 17.6 and 17.8 to match.** The Lorenz system is chaotic, so the
> tiny difference in how the two solvers step through it grows exponentially. By
> `t = 20` the two trajectories will be in completely different places. **Both are
> correct.** They trace the same attractor, just not the same path around it — and
> saying so is a strong answer if you are asked to compare the two solvers.

### 17.9 — Phase Trajectories for Three ε Values

Simulates the system for `ε = 0.5, 1, 2` to compare stability and phase trajectory
behaviour. The exact ε values were not specified in the manual, so a representative
spread was chosen.

Each trajectory starts at `[2, 0]` and spirals onto a closed loop — a **limit cycle**.
Larger ε distorts that loop from a near-circle into the sharp-cornered shape
characteristic of relaxation oscillation. That progression across the three curves is
what the plot is demonstrating.

> ⚠️ **Naming mismatch worth checking.** The console header prints *"Radioactive Decay
> System"*, but the equation implemented is `x'' − ε(1 − x²)x' + x = 0` — the **Van der
> Pol oscillator**, which the figure title correctly says. These are different things:
> radioactive decay is first-order linear (`dN/dt = −λN`) and decays to zero without
> oscillating; Van der Pol is second-order nonlinear and settles into a limit cycle.
> If the manual asked for Van der Pol, just fix the `fprintf` label. If it genuinely
> asked for radioactive decay, the script is solving the wrong problem — worth
> confirming before submission.

### 17.10 — Cubic Polynomial Fit

Opens an empty set of axes, collects points you click with `ginput`, fits a cubic with
`polyfit`, and reports R² as the goodness-of-fit metric.

#### How many points to select

`ginput` with no argument keeps collecting until you press **Enter**.

- **Minimum: 4 points.** A cubic has four coefficients (a, b, c, d), so four points fit
  it exactly — no residual, `R² = 1`, which is not a meaningful test of anything.
- **Recommended: 8–15 points**, spread across the x-range (`0` to `10` as the axis is
  set), in a rough curved or wavy pattern. A straight line will not show off the cubic
  terms. This leaves real residuals so R² actually means something.
- Click each point, then press **Enter** to finish.

For a fixed number instead of open-ended, use:

```matlab
[clickedX, clickedY] = ginput(10);   % collects exactly 10 points, no Enter needed
```

> ⚠️ **Two ways this errors.** Pressing Enter without clicking anything leaves
> `clickedX` empty and `polyfit` fails. Clicking fewer than four points makes `polyfit`
> warn that the polynomial is not unique. Click at least four — realistically eight or
> more.

The axis limits are only the view. You can click outside `0`–`10` and those
coordinates are still recorded, so keep your clicks inside the visible grid.
