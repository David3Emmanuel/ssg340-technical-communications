# Experiment 11 — Simulation, Sorting and Data Structures

Covers temperature modelling with user input, random walk simulation, histograms and
bin sizes, bubble sort versus MATLAB's built-in sort, and storing mixed data in
structures and cell arrays.

## Files

| File | Topic | Values |
| --- | --- | --- |
| [11.1.m](11.1.m) | Cooling curves, numerical vs exact, two cooling constants | 📋 **Prompts for input** |
| [11.2.m](11.2.m) | Random walk from `x = 40`, 500 and 1000 steps | 🔧 Hardcoded |
| [11.3.m](11.3.m) | Histogram of random student marks at two bin counts | 🔧 Generated randomly |
| [11.4.m](11.4.m) | Bubble sort, traced small then timed against `sort` | 🔧 Generated randomly |
| [11.5.m](11.5.m) | Structures, cell arrays, and a `varargin` builder function | 🔧 Hardcoded |

Only `11.1.m` asks you to type anything. The other four generate or hardcode their
own data, so you just press **Run**.

---

## 📋 Input Guidelines

### Experiment 11.1: Temperature Modeling Inputs

When running the script for Experiment 11.1, you will be prompted to enter values for
the time step and the output display interval. Please use values within the following
ranges for a stable simulation:

| Variable | Description | Suggested Range | Safe Example to Test |
| :--- | :--- | :--- | :--- |
| **`dt`** | Time step (seconds) | `0.1` to `2.0` | `1.0` |
| **`output_interval`** | How often to print results | `1` to `10` | `2.0` |

> ⚠️ **Note:** For the cleanest output, ensure your `output_interval` is a multiple of
> `dt` (e.g., if `dt = 0.5`, an interval of `2.0` works perfectly).

This matters more than it looks. The script decides when to print by testing
`mod(t, out_interval) < 1e-5` — if your interval is not a multiple of `dt`, the
simulation time never lands close enough to a multiple and **you get almost no printed
output at all**. The plot still draws correctly, so an empty-looking table is the
symptom to watch for.

Everything else in `11.1.m` is hardcoded and does not need changing: `T0 = 30`,
`F = 4`, the two cooling constants `K1 = 0.02` and `K2 = 0.05`, and `t_max = 200`.

> ⚠️ **`11.1.m` stops and waits for you to click the figure.** The last four lines call
> `gtext`, which parks the script until you click a spot on the graph to drop each
> label. Four labels means **four clicks**. If MATLAB looks frozen after the plot
> appears, it is waiting for you — bring the figure window to the front and click.

---

## 🔧 What is hardcoded in the other four

### Experiment 11.2 — Random Walk

Starts at `x = 40` and runs the walk for `500` then `1000` steps, one subplot each,
driven by `steps_array = [500, 1000]` at [line 5](11.2.m#L5). Add another value to
that array for a third length — the loop and subplot indices follow it automatically.

Because a random walk uses `rand`, **your distribution will be different every run**.
That is expected. Add `rng(0);` at the top if you need the same walk twice, for
instance when comparing the two step counts fairly or re-generating a figure for your
report.

### Experiment 11.3 — Histogram

Marks are generated rather than typed:

```matlab
marks = randi([0, 100], 1, 150);   % 150 students, marks from 0 to 100
bins  = [10, 20];                   % the two bin counts to compare
```

`randi` gives whole numbers, which is what you want for marks. The same `rng(0);` tip
applies — without it the histogram changes shape on every run and will not match what
you paste into your report.

The script uses `hist`, which is what the manual's hints call for. Newer MATLAB
releases prefer `histogram` and may flag `hist` as discouraged; it still works, so
leave it unless your lecturer says otherwise.

### Experiment 11.4 — Bubble Sort

Two parts. A five-element array printed after every pass so you can watch the sort
work, then a 1000-element timing comparison.

The timing part is set up correctly for a fair test — `large_data` is generated once
and copied into two separate variables, so bubble sort and `sort` operate on
**identical** data rather than two different random arrays.

Bubble sort will be dramatically slower than MATLAB's built-in `sort` on 1000
elements. That gap **is** the result the task is after, not a sign anything is broken.
Expect a wait of a second or so on the bubble sort while `sort` finishes essentially
instantly.

### Experiment 11.5 — Data Structures

Student names, IDs and marks are hardcoded when the structure and cell arrays are
initialised, as the manual asks. Two students are defined directly, then two more are
built dynamically through `create_students`.

That helper takes `varargin` in groups of three (Name, ID, Marks) and errors if you
pass a number of arguments that is not a multiple of three — so if you add a student,
add all three fields. It sits at the **bottom** of the file because MATLAB requires
local functions to come last in a script, which the comment above it notes.
