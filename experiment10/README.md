# Experiment 10 — User-Defined Functions, Recursion and Numerical Methods

Covers anonymous functions, local functions in a script, Newton's method for finding
roots, recursion, stepping through code with the MATLAB debugger, and comparing a
numerical approximation against a built-in function.

## Files

| File | Topic | Values |
| --- | --- | --- |
| [10.1.m](10.1.m) | Coupled harmonic oscillators, plotted and compared | 🔧 Hardcoded |
| [10.2.m](10.2.m) | Newton's method for `x³ + x − 3 = 0` | 🔧 Hardcoded |
| [10.3.m](10.3.m) | Recursive factorial, tested for 1 to 10 | 🔧 Hardcoded |
| [10.4.m](10.4.m) | The same recursion with trace printing, for debugging practice | 🔧 Hardcoded |
| [10.5.m](10.5.m) | *(empty — not written yet)* | — |
| [10.6.m](10.6.m) | Standard normal CDF approximation vs `normcdf` | 🔧 Hardcoded |

**Nothing in this experiment prompts you for input.** Unlike experiment 8, every
value is written directly into the script, so you just press **Run**. If you need
different values, edit them in the file:

| File | What you can change | Where |
| --- | --- | --- |
| 10.1.m | Time range `t`, the oscillator frequencies | [lines 2–3](10.1.m#L2-L3), [line 12](10.1.m#L12) |
| 10.2.m | Initial guess `x0`, tolerance `tol`, iteration cap `maxIter` | [lines 2–4](10.2.m#L2-L4) |
| 10.3.m | The `1:10` test range | [line 3](10.3.m#L3) |
| 10.4.m | `n = 5`, the value traced through the recursion | [line 3](10.4.m#L3) |
| 10.6.m | The `xVals` range | [line 4](10.6.m#L4) |

## ⚠ 10.6.m needs the Statistics Toolbox

`normcdf` is **not** part of base MATLAB — it comes from the Statistics and Machine
Learning Toolbox. If you do not have that toolbox installed, [10.6.m](10.6.m) will
fail with an "Undefined function" error on the comparison line.

The fix is a one-line swap, since the standard normal CDF can be written using `erf`,
which *is* in base MATLAB:

```matlab
actual = 0.5 * (1 + erf(x / sqrt(2)));   % replaces normcdf(x)
```

Run `ver` in the Command Window to check what toolboxes you have.

## Things worth understanding before you run these

### Local functions have to be at the bottom

`10.2.m`, `10.3.m`, `10.4.m` and `10.6.m` all define their functions **after** the
script code, and `10.3.m` even says so in a comment. That ordering is required: in a
script file, MATLAB expects the executable lines first and the local function
definitions last. Moving a function to the top turns the file into something MATLAB
reads differently and it will not run as a script.

### 10.1.m — the wobble is a beat, not a plotting error

`cos(8t) + cos(9t)` produces a fast oscillation inside a slow rising-and-falling
envelope. That is a **beat**: two nearby frequencies drifting in and out of phase
with each other. Adding the third and fourth oscillators in Task 3 makes the pattern
busier and less regular, which is the comparison the third figure is there to show.

### 10.2.m — this one cannot divide by zero

Newton's method breaks when the derivative hits zero, since the update divides by it.
Here the derivative is `3x² + 1`, which is at least `1` for every real `x`, so that
failure mode cannot occur no matter what `x0` you start from. Convergence is fast —
expect the root near `1.213` in a handful of iterations, well short of the
`maxIter = 100` cap.

### 10.6.m — the approximation only works for x ≥ 0

The Zelen & Severo formula in `normCDFApprox` is defined for non-negative `x` only,
which is why `xVals` starts at `0`. If you extend the range into negative numbers the
approximation returns visibly wrong values while `normcdf` stays correct, so the
`diff` column blows up. For negative `x`, use the symmetry `Φ(−x) = 1 − Φ(x)`
instead.
