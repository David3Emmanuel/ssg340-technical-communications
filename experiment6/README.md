# Experiment 6 — Logical Vectors, Logical Indexing and Matrices

Covers relational and logical operators, using logical vectors as array subscripts,
the `any` / `all` / `sum` logical functions, Monte Carlo simulation with `rand`, and
matrix operations from basic multiplication through linear algebra to
multidimensional arrays and tiling.

## Files and which values you need to change

| File | Topic | Values |
| --- | --- | --- |
| [6.1.m](6.1.m) | Logical indexing, sinc function, discontinuous plot, counting random numbers | ✅ **Given** — leave as-is |
| [6.2.m](6.2.m) | `any`/`all`, dice rolls, Monte Carlo π, logical subsetting | ✅ **Given** — leave as-is |
| [6.3.m](6.3.m) | Tax bands, vectorised loan repayments, random statistics, matrix filtering | ✏️ **Change this** — see below |
| [6.4.m](6.4.m) | Matrix creation, multiplication, transposition, reshaping | ✅ **Given** — leave as-is |
| [6.5.m](6.5.m) | Linear systems, determinant and inverse, eigenvalues, LU decomposition | ✅ **Given** — leave as-is |
| [6.6.m](6.6.m) | 3D arrays with `cat`, reshaping, `eye`, `pascal`, `repmat` | ✅ **Given** — leave as-is |

## ✏️ What to change in 6.3.m

The lecturer did **not** give us numbers for this one, so the values below were made
up so that the script would run. Replace them with the values from your own lab
sheet before you submit.

### Task 1 — Tax bands

```matlab
incomes = [5000, 15000, 25000, 8000, 18000, 30000]; % <-- your own incomes
```

Replace the `incomes` array with the incomes your lab sheet specifies. If your sheet
also gives different band limits or rates, update the three blocks that follow —
the thresholds `10000` / `20000` and the rates `0.10` / `0.20` / `0.50` all appear
explicitly in the `idx1`, `idx2`, `idx3` sections.

### Task 2 — Loan repayments

```matlab
A = 100000;                  % <-- your own loan amount
n = 12;                      % payments per year (12 = monthly)
r_vals = [0.03, 0.05, 0.07]; % <-- your own interest rates
k_vals = [10; 20; 30];       % <-- your own loan terms in years
```

Keep `r_vals` as a **row** vector and `k_vals` as a **column** vector. That
orientation is what makes `meshgrid` produce a grid where every rate is paired with
every term, giving one repayment per combination. If you flip them, the result
matrix comes out transposed.

### Task 3 — Random number statistics

```matlab
r_rand = rand(1, 10000);   % <-- sample size, if your sheet specifies one
```

The threshold `0.5` and the `expected_value = 0.5` are tied to each other — if your
sheet asks for a different threshold, change both.

### Task 4 — Matrix filtering

```matlab
M = rand(10, 10);   % <-- matrix size
M(M < 0.2) = 0;     % <-- lower cut-off
M(M > 0.8) = 1;     % <-- upper cut-off
```

Note that `lowCount` and `highCount` are deliberately computed **before** the two
clipping lines. Counting after the clipping would give the wrong answer, because by
then the small values have already been overwritten with 0 and the large ones with 1.

## Expected output for 6.5.m

`6.5.m` is fully deterministic — no `rand` — so these are exactly the numbers you
should see. Useful for checking your run:

| Task | Result |
| --- | --- |
| 1 — solve `A1*X = B1` | `X = [1; 2]` |
| 2 — determinant of `A2` | `-5` |
| 2 — inverse of `A2` | `[-0.2, 0.4; 0.8, -0.6]` |
| 2 — identity check | the 2×2 identity |
| 3 — eigenvalues of `A3` | `2` and `5` |
| 4 — `L * U` | reproduces `A4` exactly |

Two things worth knowing for the viva:

- **Task 1 uses `\`, not `inv(A1)*B1`.** Left division solves the system directly
  without ever forming the inverse, which is both faster and more numerically
  accurate. Task 2 computes an inverse only because it is explicitly asked to.
- **Task 4's `L` comes out genuinely lower triangular here.** With two outputs, `lu`
  returns a *row-permuted* `L` whenever pivoting is needed — `L*U` still reproduces
  the original matrix, but `L` may not look triangular. `A4` happens not to need a row
  swap, so this one looks textbook.

## Note on the random-number tasks

`6.2.m` (dice rolls, Monte Carlo π) and parts of `6.1.m` and `6.3.m` use `rand`, so
**your output will differ slightly every time you run them**. This is expected — the
proportions should still sit close to the theoretical values (about 0.5 for `r < 0.5`,
about 3.14 for π, about 1 in 6 sixes). If you need the exact same numbers twice, add
`rng(0);` at the top of the script.
