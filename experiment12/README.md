# Experiment 12 — Handle Graphics, 3-D Plotting and Exporting Figures

Covers graphics handles and `set`, Lissajous curves, animating a chaotic system,
surface plots with lighting and camera control, visualising complex functions, and
saving figures to every format MATLAB supports.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [12.1.m](12.1.m) | Lissajous curves, handle manipulation, annotations | ✏️ **Our choice** — change freely |
| [12.2.m](12.2.m) | Lorenz attractor animation | ✅ **Given** — mostly, see below |
| [12.3.m](12.3.m) | Surface plots, colour mapping, lighting, camera | ✅ Nothing to set |
| [12.4.m](12.4.m) | Complex function plots | ⚠️ **Half given** — see below |
| [12.5.m](12.5.m) | Saving, printing and exporting figures | ✅ Nothing to set |

### 12.1 — no fixed values were given, so these are ours

The manual leaves the Lissajous parameters up to you. We picked reasonable ones, and
they sit on a single line so they are easy to find:

```matlab
ampX = 3; ampY = 2; freqX = 4; freqY = 5; phaseShift = pi/2;   % change these
```

The shape you get is governed by the **ratio** `freqX:freqY` and the phase `phaseShift`. Equal
frequencies give an ellipse; simple ratios like 3:2 or 4:5 give the classic woven
patterns. Change them freely — there is no wrong answer here.

Task 2 has a second, independent set in the `curveParams` matrix at
[12.1.m:14](12.1.m#L14), one curve per row in the order `ampX ampY freqX freqY phaseShift`. Add a row to
plot a fourth curve; the loop and the `gobjects` array size themselves off that
matrix automatically. If you do add one, note that
[Task 3](12.1.m#L26-L28) styles `curveHandles(1)` to `curveHandles(3)` by hand and will not
touch a fourth.

### 12.2 — the physical constants are given, the simulation settings are not

From the manual, leave these alone:

```matlab
sigmaParam = 10; rhoParam = 28; betaParam = 8/3;   % the classic Lorenz parameters
lorenzX(1) = 1; lorenzY(1) = 1; lorenzZ(1) = 1;   % initial conditions [1,1,1]
```

But `timeStep = 0.01` and `numSteps = 5000` were **our choice** — the manual does not specify
them. They give a good-looking attractor, so there is no need to change them unless
your sheet says otherwise.

Two things worth knowing if you do experiment:

- The solver is plain **Euler integration**, which accumulates error. Increase `timeStep`
  much beyond `0.01` and the trajectory degrades or flies off entirely.
- Lorenz is **chaotic**, so a tiny change to the initial conditions produces a
  completely different path. Both paths are equally valid — that sensitivity is the
  famous property of the system, not instability in the code.

### 12.4 — the function is given, the grid range is not

`f(z) = (e^{iz} − 1) / z` comes from the manual. The grid range does not, so we used
a standard `-2π` to `2π`:

```matlab
realAxis = -2*pi:0.1:2*pi;
imagAxis = -2*pi:0.1:2*pi;
```

Change both if your manual specifies something different. Keep the step at `0.1` or
coarser — halving it quadruples the number of grid points and the surface plots get
slow.

> 📝 **About the singularity guard.** [12.4.m:8](12.4.m#L8) sets `funcValues(complexGrid == 0) = 1` to
> handle `z = 0`. Two notes: the true limit as `z → 0` is **i**, not 1 (the code's own
> comment says as much), and with this particular grid the line never actually runs —
> stepping by `0.1` from `-2π` never lands exactly on zero, so no grid point is ever
> `0`. It is harmless either way, since the singularity is removable and the function
> stays bounded near the origin. Only worth fixing to `1i` if you are asked about it.

## ⚠ 12.5.m: the clipboard step is Windows-only

[12.5.m:18](12.5.m#L18) calls:

```matlab
print(gcf, '-clipboard', '-dbitmap');
```

The `-clipboard` option **only works on Microsoft Windows**. On macOS or Linux this
line errors and the script stops before reaching Task 5, so the three batch figures
never get created.

If you are on a Mac, comment that line out to let the rest of the script finish:

```matlab
% print(gcf, '-clipboard', '-dbitmap');   % Windows only
```

You still demonstrate the task — just note in your report that the export formats in
Task 2 and 3 are the cross-platform equivalents.

## These scripts write a lot of files

Four of the five save figures to disk, always into **MATLAB's current directory**
rather than next to the script. `cd experiment12` before running or they scatter into
the repository root.

| Script | Files produced |
| --- | --- |
| 12.1.m | `lissajous_figure.fig`, `lissajous_figure.png` |
| 12.2.m | `lorenz_attractor.fig`, `lorenz_final.jpg` |
| 12.3.m | `surface_plot.fig`, `surface_plot.png` |
| 12.5.m | `sine_wave.fig/.png/.jpg/.eps`, `sine_wave_hq.pdf`, `batch_figure_1..3.png` |

That is fourteen files. They are regenerated every run, so there is no need to commit
them to git.

## Other things worth knowing

### 12.2 and 12.3 animate — let them finish

Both contain loops that redraw the figure. `12.2.m` steps through the attractor in
ten jumps of 500 points, recolouring randomly each time, so the trace changes colour
as it grows. `12.3.m` spins the camera a full 360° in 10° increments with a `0.05 s`
pause, taking roughly two seconds. Do not click on the figure window while either is
running or you may interrupt the redraw.

### 12.3 may warn about `lighting phong`

Newer MATLAB releases dropped Phong lighting. If you get a warning on
[12.3.m:13](12.3.m#L13), swap it for the supported option — the surface looks nearly
identical:

```matlab
lighting gouraud;
```

### 12.4 opens five figure windows

One each for the real part, imaginary part, modulus, argument, and the customised
surface, plus the animation reuses the last. That is expected. Close them between
runs or they stack up.
