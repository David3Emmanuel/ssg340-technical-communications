# Experiment 7 — Advanced 2-D Plotting and Customisation

Covers plotting composite functions, line styles and marker customisation, plotting
several components on shared axes, annotating with `text`, controlling axis limits
and aspect ratio, and saving figures to image files.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [7.1.m](7.1.m) | `e^sin(x)·cos(x) + 1/(1+x²) + (2/π)·atan(x)`, plotted with its three components | ✅ **Given** — leave as-is |
| [7.2.m](7.2.m) | Composite function with three terms, plotted and annotated | ✅ **Given** — leave as-is |
| [7.3.m](7.3.m) | *(empty — not written yet)* | — |

**All values in this experiment came from the lecturer.** The functions, the `-10` to
`10` range and the axis limits are as specified, so there is nothing to substitute —
run the scripts as they are.

## Things worth understanding before you run these

### Both scripts write image files

`saveas` drops the output into **whatever directory MATLAB is currently in**, not
next to the script:

- `7.1.m` → `advanced_plot_experiment1.png`
- `7.2.m` → `composite_function_plot.png` and `composite_function_plot.tiff`

So `cd experiment7` before running, or the images land in the repository root.

### 7.1.m uses two different x vectors on purpose

```matlab
lineGrid = linspace(-10, 10, 1000);   % smooth curves
markerGrid = linspace(-10, 10, 30);   % markers only
```

The lines need 1000 points to look smooth, but drawing 1000 circles and squares would
smear into a solid block. The marker series are therefore plotted against the
30-point vector instead. This is why `lineComp1` and `lineComp3` are each calculated twice —
once for the line resolution, once for the marker resolution.

### `axis equal` fights with the axis limits

Task 5 asks for both `axis([-10 10 -1.5 2.5])` and `axis equal`. These pull in
opposite directions: the x span is 20 and the y span only 4, so forcing a 1:1 aspect
ratio squashes the plot vertically and MATLAB may override the limits you just set.
That is why `7.1.m` re-applies `xlim` and `ylim` immediately afterwards. The comments
in the file say the same thing — the squashed look is expected, not a bug.

### The spikes in 7.2.m are real

```matlab
f = exp(sin(x.^2)) ./ (1 + cos(x.^3)) + ...
```

Wherever `cos(x.^3)` comes close to `-1`, that denominator approaches zero and `f`
shoots off towards very large values. The function is oscillating faster and faster
as `|x|` grows, so this happens repeatedly across the range. The `ylim([-10 10])` in
Task 4 is what keeps the plot readable. If your figure looks like a few enormous
spikes with everything else flat, that is the function behaving correctly, not an
error in the code.
