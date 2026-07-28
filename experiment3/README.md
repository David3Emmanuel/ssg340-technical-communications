# Experiment 3 — Arrays, Plotting and Free-Fall Simulation

Covers building arrays with `linspace`, degree-to-radian conversion, element-wise
operations, plotting with labels and legends, and writing a user-defined function
that returns multiple outputs.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [3.1.m](3.1.m) | Sine and cosine over a range of angles, plotted and tabulated | ✏️ **Change this** |
| [3.2.m](3.2.m) | `free_fall` — height and velocity of a falling object over time | ✅ **Given** — leave as-is |

## ✏️ What to change in 3.1.m

The lecturer did not give us an angle range, so this was chosen:

```matlab
degrees = linspace(0, 360, 50);   % <-- your own range and number of points
```

`linspace(0, 360, 50)` means *50 evenly spaced points from 0° to 360°*. Change the
first two arguments if your lab sheet specifies a different range, and the third if
it specifies a different number of points or a step size.

If your sheet gives you a **step size** rather than a point count, use colon notation
instead. For example, for 0° to 360° in steps of 5°:

```matlab
degrees = 0:5:360;
```

Everything after that line adapts automatically — the radian conversion, both plots,
and the results table are all element-wise operations on whatever `degrees` contains.

## ✅ 3.2.m — leave the values alone

The initial conditions here came from the lab sheet:

```matlab
h0 = 100;    % initial height (m)
v0 = 0;      % initial velocity (m/s)
g = 9.8;     % gravity (m/s^2)
dt = 0.1;    % time step (s)
t_max = 50;  % simulation cut-off (s)
```

Two things worth understanding rather than changing:

- The loop **breaks** as soon as `height(i) <= 0`, then truncates `time`, `height`
  and `velocity` down to `i`. That is what removes the unused pre-allocated slots, so
  the plot stops at the ground instead of continuing into negative height.
- `t_max = 50` is only an upper bound. With `h0 = 100` the object lands after about
  4.5 s, so the loop exits long before reaching it.
