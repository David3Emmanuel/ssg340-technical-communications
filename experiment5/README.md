# Experiment 5 — Inverse Trigonometric Functions and Subplots

Covers the domains and ranges of `abs`, `acos`, `asin` and `atan`, laying out several
plots with `subplot`, annotating a figure with `text`, and guarding against
out-of-domain input with `try` / `catch`.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [5.1.m](5.1.m) | Arc functions plotted individually and compared on one axes | ✅ **Given** — leave as-is |
| [5.2.m](5.2.m) | *(empty — not written yet)* | — |
| [5.3.m](5.3.m) | *(empty — not written yet)* | — |

## ✅ 5.1.m — leave the values alone

The input range came from the lab sheet:

```matlab
x_input = -1:0.1:1;   % 21 points from -1 to 1 in steps of 0.1
```

`[-1, 1]` is not an arbitrary choice — it is the **valid domain of `acos` and
`asin`**. Feed either function a value outside that range and MATLAB returns a
complex number rather than an error, which is why the script checks the range
explicitly:

```matlab
if any(x_input < -1 | x_input > 1)
    error('Input contains values outside the valid range [-1, 1] ...');
end
```

The `catch` block then filters the offending values out with logical indexing rather
than letting the script die. If you widen the range for an experiment of your own,
that guard will trim it straight back to `[-1, 1]` — which is intended.

`atan` is the exception: its domain is all real numbers, so it is the only one of the
three that would still be valid over a wider range.

## Note on 5.2.m and 5.3.m

Both files exist but are empty. They are placeholders for the remaining tasks in this
experiment and have not been written yet.
