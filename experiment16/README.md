# Experiment 16 — Matrices, Linear Systems and Markov Chains

Covers Leslie matrices for population dynamics, Markov chain simulation, solving
linear systems with left division, sparse matrix efficiency, and a hand-written Gauss
elimination with partial pivoting.

## Files

| File | Topic | Values |
| --- | --- | --- |
| [16.1.m](16.1.m) | Population dynamics with a Leslie matrix | ✏️ **Placeholder** — see below |
| [16.2.m](16.2.m) | Markov chain, limiting distribution | ✏️ **Placeholder** — see below |
| [16.3.m](16.3.m) | Linear systems, residuals, ill-conditioning | ✅ Generic examples — leave as-is |
| [16.4.m](16.4.m) | Sparse vs full matrix memory and speed | ✅ Generated — leave as-is |
| [16.5.m](16.5.m) | Gauss elimination with partial pivoting | ✅ Generic example — leave as-is |

---

## ✏️ The two matrices you must replace

The manual says to use the matrices *"as shown in the document"* and the
*"probabilities provided in the document"*. **The numbers currently in `16.1.m` and
`16.2.m` are not those numbers** — they are placeholders chosen so the scripts run and
you can verify the loops, eigenvalue calculation and plotting all work.

Swap in the real figures when your lecturer or technologist provides them. Nothing
else needs to change: the code sizes itself off the matrices.

### ⚠️ Do not just pick numbers "in a range"

It is tempting to say "each entry can be anything from 0 to 1" and let everyone fill
in their own. **That does not work for either of these matrices** — the entries are
not independent of one another. Follow the structure rules below instead.

### 16.1 — Leslie matrix rules

A Leslie matrix has a fixed shape. Only two kinds of entry are free; the rest must be
exactly zero.

```matlab
L = [0,   1.5, 1.2;    % row 1  = fecundity
     0.8, 0,   0;      % subdiagonal = survival
     0,   0.5, 0];
```

| Position | Meaning | Valid values |
| --- | --- | --- |
| **Row 1** | Fecundity — offspring per individual per month | `≥ 0`, and may exceed 1 (typically `0` to `5`) |
| **Subdiagonal** | Survival — fraction living to the next age class | **`0` to `1` only** |
| **Everything else** | — | must be exactly `0` |

A survival value above `1` would mean more individuals survive than existed, which is
impossible — so a blanket "0 to 5 for every entry" would produce a meaningless model.

> 💡 **Aim for a dominant eigenvalue near 1.** The script prints it, and it is the
> long-term growth factor: above `1` the population grows, at `1` it holds steady,
> below `1` it dies out. The current placeholders give about `1.27`, which grows
> roughly 300-fold over the 24 months — already near the limit of what plots
> readably. Push fecundity much higher and the curve shoots off the top of the axes;
> make survival very small and it flatlines at zero. Either way the graph stops
> showing anything useful.

### 16.2 — Transition matrix rules

This one has a hard constraint that per-entry ranges cannot express:

> **Every column must sum to exactly 1**, and every entry must be between `0` and `1`.

Column *j* holds the probabilities of where the student goes *from* intersection *j*.
They have to go somewhere, so those probabilities must total 1. The script multiplies
`P * X_state`, which is the column convention.

If everyone picks entries independently, the columns will not sum to 1, total
probability leaks away or inflates on every step, and the "limiting distribution"
printed at the end is meaningless — while still looking like a perfectly normal
answer. This is the failure mode to warn your course mates about.

**Check any matrix before trusting it:**

```matlab
sum(P)                      % should print 1 for every column
all(abs(sum(P) - 1) < 1e-10)  % should print 1 (true)
```

The placeholder currently in the file passes this check, so you can use it as a
template — change numbers within a column, then adjust one other entry in that same
column so the total returns to 1.

---

## ✅ The other three need no lecturer values

`16.3.m`, `16.4.m` and `16.5.m` use standard demonstration matrices rather than
data specific to a scenario, so there is nothing to swap out:

- **16.3.m** — the ill-conditioned example `[1, 1; 1, 1.0001]` is the textbook case.
  Its `rcond` comes out around `1e-5`, warning that small changes in `b` cause large
  changes in `x`. The overdetermined and underdetermined systems are there to show
  that `\` silently switches behaviour: least-squares for the tall system, one of
  infinitely many solutions for the wide one.
- **16.4.m** — builds its own 1000×1000 tridiagonal matrix as a stand-in for a large
  Markov matrix. Expect the sparse version to use a small fraction of the memory and
  solve considerably faster; that gap is the result the task wants. `b_large` uses
  `rand`, so the timings shift slightly each run.
- **16.5.m** — the test system is a generic symmetric matrix. Both solutions printed
  should agree to several decimal places; that agreement is what validates the
  hand-written elimination against MATLAB's `\`.

`gauss_elimination_pivot` sits at the bottom of `16.5.m` because MATLAB requires local
functions to come last in a script.
