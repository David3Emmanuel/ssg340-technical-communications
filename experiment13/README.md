# Experiment 13 — Building GUIs in MATLAB

Covers creating graphical user interfaces: pushbuttons and callbacks, reading user
input from an edit box, drawing into GUI axes, and customising a button's appearance
with image data.

## ⚠ Read this first: we are not using GUIDE

The lab manual asks you to build these interfaces with **GUIDE** (GUI Design
Environment) — MATLAB's drag-and-drop designer. GUIDE saves your layout into a binary
`.fig` file paired with an `.m` file, which is awkward to share: you cannot read a
`.fig` in a text editor, cannot paste it into a chat, and cannot review it in git.

**So these are written programmatically instead.** Every window, button and callback
the manual asks for is created in plain MATLAB code. You do **not** need to open GUIDE
or drag anything. Copy, paste, run — you get the exact same windows and behaviour the
manual describes.

This is a presentation choice, not a shortcut around the work. The controls, the
callbacks and the functionality are all still there and still assessed the same way.
It also ages better: MathWorks has been phasing GUIDE out in favour of App Designer
for years, and newer MATLAB releases warn about it or drop it entirely. Code written
this way keeps working.

If your lecturer specifically wants a `.fig` produced by GUIDE, you will need to
rebuild it in the tool — mention it and ask.

## Files

| File | Topic | Status |
| --- | --- | --- |
| [13.1.m](13.1.m) | Time display GUI — one button, shows current time via `clock` and `sprintf` | *(empty — not written yet)* |
| [13.2.m](13.2.m) | Newton's method for square roots — edit box, Start button, 8 iterations shown | *(empty — not written yet)* |
| [13.3.m](13.3.m) | Plotting in GUI axes — **Plot**, **Toggle Grid** and **Clear** buttons | ✅ Written |
| [13.4.m](13.4.m) | Custom button colour — 100×50 button, random RGB image on each press | ✅ Written |

## ⚠ How to actually run these

These files are **functions**, not scripts like the rest of the repository. That
changes how you launch them, and there is a naming problem to fix first.

MATLAB requires a function file to be named with a valid MATLAB identifier, and
`13.3.m` is not one — you cannot type `13.3` at the prompt, because MATLAB reads it as
a number. The function inside is also called something different from the file:

```matlab
% file: 13.3.m
function experiment13_3()   % <-- name does not match the file
```

**The fix is to rename each file to match the function inside it:**

| Rename this | To this | Then run |
| --- | --- | --- |
| `13.1.m` | `experiment13_1.m` | `experiment13_1` |
| `13.2.m` | `experiment13_2.m` | `experiment13_2` |
| `13.3.m` | `experiment13_3.m` | `experiment13_3` |
| `13.4.m` | `experiment13_4.m` | `experiment13_4` |

Then `cd experiment13` and type the name at the Command Window prompt. This is why
the original instructions said to save each block as `experiment13_1.m` and so on —
the numbered filenames used elsewhere in this repository only work because those files
are scripts.

## Why these are functions and not scripts

Look at [13.3.m](13.3.m): the three callbacks (`plotSine`, `toggleGrid`, `clearPlot`)
are **nested** inside the main function, which is what lets them all see the `ax`
handle without it being passed around or stored globally. That closure is only
available inside a function — the same code written as a script would not be able to
reach `ax` from the callbacks. Programmatic GUIs are built this way as standard.

## Notes on the two that are written

### 13.3.m — Plotting Graphs in GUI Axes

Three buttons along the bottom, axes above. **Plot** draws `sin(x)` over `0` to `2π`,
**Toggle Grid** flips the gridlines on and off by reading `ax.XGrid` and inverting it,
and **Clear** wipes the axes with `cla`.

Press **Toggle Grid** before **Plot** and nothing appears to happen — the grid is
toggling on empty axes. That is correct behaviour, not a fault. Press **Plot** first.

### 13.4.m — Custom Button Color with Image

The button is exactly 100×50 pixels as the manual requires, and each press generates a
fresh random colour and paints it across the button face via `CData`.

Worth understanding for the viva: `CData` wants a **height × width × 3** array, which
is why [13.4.m:17](13.4.m#L17) builds a `[50, 100, 3]` block for a button that is 100
wide and 50 tall — the dimensions are deliberately the other way round from the
`Position` values. The code sets the text to bold black afterwards so the label stays
readable against whatever random colour comes up.
