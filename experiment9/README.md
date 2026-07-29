# Experiment 9 — Debugging and Error Handling

Covers finding and fixing syntax errors, spotting logical errors that produce wrong
answers without crashing, vector size mismatches, `try` / `catch` blocks, and raising
custom errors with the `error` function.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [9.1.m](9.1.m) | Corrected syntax errors, Newton quotient, vector size mismatch | ✅ **Given** — leave as-is |
| [9.2.m](9.2.m) | *(empty — not written yet)* | — |
| [9.3.m](9.3.m) | `try`/`catch`, custom `error` messages, correcting multiple errors | ✅ **Given** — leave as-is |

**All values in this experiment came from the lecturer.** The scripts, coefficients
and test cases are taken from the lab manual listings, so there is nothing to
substitute — run them as they are.

## Do not "clean up" the commented-out code

Unlike the other experiments, this one is *about* broken code. Two blocks are
commented out **on purpose**, and uncommenting them will break the scripts:

- **[9.1.m:50](9.1.m#L50)** — the line `x = 0:pi/40:3*pi;`. This is the bug from the
  manual's Listing 9.3: redefining `x` at a different step size after `y = sin(x)` has
  already been computed leaves the two vectors different lengths, so `plot(x, y)`
  fails. Commenting it out *is* the fix.
- **[9.3.m:76-85](9.3.m#L76-L85)** — the whole of the manual's Listing 9.8. It is kept
  as a comment so you can read the original faulty code next to the corrected version
  underneath it. Uncommenting it makes the script crash, which is the point it is
  demonstrating.

## Things worth understanding before you run these

### 9.1 Task 2 — the answers are *supposed* to get worse

The Newton quotient `(f(x+h) - f(x)) / h` should approach the exact derivative `4` as
`h` shrinks. It does at first, then falls apart:

| `h` | What you see |
| --- | --- |
| `1`, `0.1`, `0.01` | Closes in on 4 as expected |
| `1e-8` | About as accurate as it gets |
| `1e-12`, `1e-16` | Wildly wrong |

This is **catastrophic cancellation**, not a coding mistake. Once `h` is tiny,
`f(x+h)` and `f(x)` are nearly identical numbers, and subtracting them throws away
almost every significant digit — then dividing by a tiny `h` magnifies whatever
rounding noise is left. At `h = 1e-16`, `x_val + h` is not even distinguishable from
`x_val` in double precision, so the numerator can come out as exactly `0`. Identifying
this is the whole task.

### 9.3 Task 1 — MATLAB does not error on divide-by-zero

`10/0` returns `Inf` in MATLAB rather than throwing an error, so a bare `try`/`catch`
around it would catch nothing. That is why [9.3.m:26-28](9.3.m#L26-L28) checks
`num2 == 0` and raises the error by hand. Worth knowing if you are asked why the
`catch` block is reached at all.

### 9.3 Task 2 — the first test case is not protected

The *invalid* quadratic test is wrapped in `try`/`catch`, but the **valid** one at
[9.3.m:42-50](9.3.m#L42-L50) is not. It is safe as written because `a_valid = 1`. If
you edit that to `0` while experimenting, the `error` fires with nothing to catch it
and the rest of the script will not run.
