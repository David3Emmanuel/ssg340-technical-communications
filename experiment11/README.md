# Experiment 11 — Simulation, Sorting and Data Structures

Covers temperature modelling with user input, random walk simulation, histograms and
bin sizes, bubble sort versus MATLAB's built-in sort, and storing mixed data in
structures and cell arrays.

> ⚠️ **The scripts in this folder are not written yet.** All five `.m` files are
> currently empty. This README is the specification — it records what each script
> needs to do and which values to use, taken from the lab manual. Everything below
> describes the intended behaviour, not code that exists.

## Files

| File | Topic | Values |
| --- | --- | --- |
| [11.1.m](11.1.m) | Temperature modelling | 📋 **Prompts for input** — see guidelines |
| [11.2.m](11.2.m) | Random walk | 🔧 Hardcode the variations |
| [11.3.m](11.3.m) | Histogram of student marks | 🔧 Hardcode / generate randomly |
| [11.4.m](11.4.m) | Bubble sort efficiency | 🔧 Generate inside the script |
| [11.5.m](11.5.m) | Structures and cell arrays | 🔧 Hardcode the records |

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

---

## 🔧 What to hardcode in the other four

### Experiment 11.2 — Random Walk

The manual asks you to start at `x = 40` and *"Experiment with different numbers of
steps (e.g., 500, 1000)"*. Hardcode these variations directly in the script — for
example, a `for` loop that runs the simulation for 500 steps, then 1000.

Because a random walk uses `rand`, **your path will be different every run**. That is
expected. Add `rng(0);` at the top if you need the same walk twice, for instance when
comparing two step counts fairly or when re-generating a figure for your report.

### Experiment 11.3 — Histogram

Hardcode a list of student marks and test different bin sizes such as `10` and `20`.
Generate the marks with random numbers:

```matlab
marks = randi([0, 100], 1, 100);   % 100 students, marks from 0 to 100
```

Note that `randi` gives whole numbers, which is what you want for marks. The same
`rng(0);` tip applies — without it, your histogram changes shape on every run and
will not match whatever you paste into your report.

### Experiment 11.4 — Bubble Sort

The manual asks you to compare sorting efficiency by *"sorting large datasets (e.g.,
1000 numbers)"*. Generate the array inside the script and pass it to your sorting
functions:

```matlab
data = rand(1, 1000);
```

Time both approaches with `tic` / `toc`, the same way `8.2.m` compares the two
binomial coefficient formulas. Bubble sort will be dramatically slower than MATLAB's
built-in `sort` on 1000 elements — that gap **is** the result the task is after, not
a sign anything is broken.

Use the *same* array for both methods, not two separate calls to `rand`, or you are
not comparing like with like.

### Experiment 11.5 — Data Structures

The student names, IDs, and marks should be manually hardcoded when initialising the
structure and cell arrays. Pick a handful of entries — enough to demonstrate the data
structure, not a full class list.
