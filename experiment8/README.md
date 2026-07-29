# Experiment 8 — Loops, Iteration and Simulation

Covers `for` and `while` loops, binomial coefficients, Newton's law of cooling,
projectile motion, series approximation of π, and validating user input.

## Files

| File | Topic |
| --- | --- |
| [8.1.m](8.1.m) | Five loop exercises: binomial coefficient, cooling, projectile, π series, investment doubling |
| [8.2.m](8.2.m) | Binomial coefficient two ways, timed with `tic`/`toc` |
| [8.3.m](8.3.m) | Temperature change modelling |
| [8.4.m](8.4.m) | Projectile motion and optimisation |

**All four scripts prompt you for values in the Command Window.** Nothing is
hardcoded, so there is no file to edit — you just need to know what to type. Use the
guidelines below.

---

## 📋 Input Guidelines for Lab Experiments

To ensure the simulations run smoothly and reflect realistic physics, please use
values within the suggested ranges below when prompted by the MATLAB scripts.

### Experiment 1: Five Loop Exercises — `8.1.m`

This script prompts for all input values across five separate tasks. Each task
validates naturally through its math (e.g. `r > n` or `K ≥ 1` would produce
non-physical or erroneous results), so stay within the suggested ranges.

| Task | Variable | Description | Suggested Range | Safe Example |
| --- | --- | --- | --- | --- |
| 1 | **`n`** | Binomial coefficient, top value | `0` to `170` | `10` |
| 1 | **`r`** | Binomial coefficient, chosen value | `0` to `n` | `3` |
| 2 | **`T`** | Initial temperature (°C) | `0` to `100` | `25` |
| 2 | **`F`** | Ambient temperature (°C) | `0` to `100` | `10` |
| 2 | **`K`** | Cooling constant | `0 < K < 1` | `0.05` |
| 2 | **`dt`** | Time step (minutes) | must be `> 0` | `1` |
| 3 | **`u`** | Initial velocity (m/s) | must be `> 0` | `60` |
| 3 | **`angleDeg`** | Launch angle (degrees) | `0` to `90` | `45` |
| 4 | **`n_terms`** | Number of series terms | must be `> 0` | `10000` |
| 5 | **`initial`** | Initial investment | must be `> 0` | `1000` |
| 5 | **`rate`** | Annual interest rate, as a decimal | `0 < rate < 1` | `0.05` |

The `0` to `170` limit on `n` exists because `factorial(171)` exceeds MATLAB's
double-precision limit and returns `Inf`. In this script the limit really binds on
`r`, since only `factorial(r)` is ever computed — but keeping both under `170` is the
simple safe rule, and in `8.2.m` it applies to `n` for real.

> ⚠️ **Two inputs here can hang the script in an infinite loop:**
>
> - **Task 2** — the loop runs until the temperature is within `0.5` of `F`, and each
>   step multiplies the gap by `1 - K*dt`. That only shrinks while `K*dt` stays below
>   `2`. `K = 0.05, dt = 1` is completely safe; something like `K = 0.9, dt = 5` makes
>   the gap grow instead and the loop never ends.
> - **Task 5** — the loop runs until the balance doubles. Enter `rate = 0` and the
>   balance never grows, so it never gets there.
>
> Press **Ctrl+C** in the Command Window to break out if either happens.

> 💡 **Notes on the other tasks:**
> - **Task 3** — at exactly `0°` the projectile has no upward velocity, so it is
>   already on the ground and the loop exits after one step. Not an error, just a
>   trivial result. Use `45` for something meaningful.
> - **Task 4** — this series converges *slowly*. Even `10000` terms only gets you
>   about four decimal places of π. That is the point of the task, not a mistake.
>   Very large values just make it slow without helping much.

### Experiment 2: Binomial Coefficient Efficiency — `8.2.m`

This script prompts for two values, `n` and `r`, then computes C(n, r) two ways — a
simplified loop-based formula that avoids large factorials, and a direct
factorial-based formula — and compares their execution time to show why the
simplified approach is more efficient and numerically stable for large `n`.

| Variable | Description | Suggested Range | Safe Example |
| --- | --- | --- | --- |
| **`n`** | Non-negative integer | `0` to `170` | `20` |
| **`r`** | Non-negative integer | `0` to `n` | `10` |

> ⚠️ **Why `n` stops at 170:** `factorial(171)` exceeds MATLAB's double-precision
> limit (`realmax`), so the factorial-based comparison returns `Inf`. Unlike `8.1.m`,
> this script computes `factorial(n)` directly, so the limit genuinely applies to `n`
> here.
>
> **Why `r` must satisfy `0 ≤ r ≤ n`:** if `r > n` the result is mathematically
> undefined (it needs the factorial of a negative number), and if `r < 0` the loop
> `0:(r-1)` does not behave as expected.

> 💡 **Tip:** try `n = 20, r = 10` first, then a larger `n` to see the timing gap
> open up. That comparison is the whole point of the task.

### Experiment 3: Temperature Change Modeling (Cooling Juice) — `8.3.m`

This experiment simulates a warm drink being placed into a cold fridge.

| Variable | Description | Suggested Range | Safe Example to Test |
| --- | --- | --- | --- |
| **`T0`** | Initial juice temperature (°C) | `25` to `35` (Room temp) | `30` |
| **`F`** | Fridge ambient temperature (°C) | `2` to `5` | `4` |
| **`K`** | Cooling constant | `0.01` to `0.05` | `0.02` |
| **`dt`** | Time step (seconds) | `0.1` to `1.0` | `0.5` |
| **`opint`** | Output interval (seconds) | `1` to `5` | `2.0` |

> ⚠️ **CRITICAL RULE FOR EXPERIMENT 3:**
> The output interval (`opint`) **MUST** be an exact integer multiple of the time step
> (`dt`). For example, if `dt = 0.5`, then `opint` can be `1.0`, `1.5`, `2.0`, etc. If
> you violate this, the script will trigger an error alarm and terminate!

The "alarm" is literal — the script calls `sound(...)` before raising the error, so
your computer will beep. That is intentional, not a fault.

> ⚠️ **Stay inside the suggested `K` and `dt` ranges,** for the same reason as Task 2
> of `8.1.m`: the loop only converges while `K*dt` stays small. The ranges above top
> out at `K*dt = 0.05`, which is safe. Press **Ctrl+C** if you go outside them and it
> hangs.

### Experiment 4: Projectile Motion Optimization — `8.4.m`

This experiment simulates launching a projectile and calculates the optimal angle for
maximum range and hang time.

| Variable | Description | Suggested Range | Safe Example to Test |
| --- | --- | --- | --- |
| **`u`** | Initial velocity (m/s) | `10` to `100` | `50` |
| **`theta`** | Launch angle (degrees) | `1` to `89` | `45` |

> 💡 **Tip for Experiment 4:**
> Try entering `45` degrees for your angle first. You will see in the generated
> optimization graphs that 45° yields the maximum horizontal range, while angles
> closer to 90° yield the longest time of flight.

Stick to `1`–`89` for the angle as the table says. At exactly `0°` the projectile has
no upward velocity, so it is already at ground level and the trajectory loop exits
after a single step — you get an empty-looking plot rather than a useful one. The
optimisation section further down still sweeps the full `0:1:90` range regardless of
what you type, so both graphs come out complete either way.
