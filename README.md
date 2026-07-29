# SSG 340 — Technical Communications (MATLAB Lab Work)

MATLAB scripts for the SSG 340 laboratory experiments. Each experiment lives in its
own folder, and each `.m` file corresponds to one numbered task set from the lab
sheet.

## ⚠ Read the README in each experiment folder first

Not all the numbers in these scripts came from the lecturer. Where the lab sheet
gave us values, they are used as given. Where it did not, **placeholder values were
chosen just so the script would run** — and if you leave those in, your results will
not match your own lab sheet.

The README inside each experiment folder tells you exactly which files are safe to
run as-is and which values you need to substitute:

| Experiment | Topic | Read this |
| --- | --- | --- |
| experiment3 | Arrays, plotting, free-fall simulation | [experiment3/README.md](experiment3/README.md) |
| experiment4 | Projectile motion, quadratic solver, simultaneous equations | [experiment4/README.md](experiment4/README.md) |
| experiment5 | Inverse trigonometric functions and subplots | [experiment5/README.md](experiment5/README.md) |
| experiment6 | Logical vectors, logical indexing, matrices | [experiment6/README.md](experiment6/README.md) |
| experiment7 | Advanced 2-D plotting and customisation | [experiment7/README.md](experiment7/README.md) |
| experiment8 | Loops, iteration and simulation — **all scripts prompt for input** | [experiment8/README.md](experiment8/README.md) |
| experiment9 | Debugging and error handling | [experiment9/README.md](experiment9/README.md) |
| experiment10 | User-defined functions, recursion and numerical methods | [experiment10/README.md](experiment10/README.md) |
| experiment11 | Simulation, sorting and data structures | [experiment11/README.md](experiment11/README.md) |
| experiment12 | Handle graphics, 3-D plotting and exporting figures | [experiment12/README.md](experiment12/README.md) |
| experiment13 | Building GUIs — **written programmatically instead of with GUIDE** | [experiment13/README.md](experiment13/README.md) |
| experiment14 | Beam deflection and RL circuits — **both scripts prompt for input** | [experiment14/README.md](experiment14/README.md) |
| experiment15 | *(not started yet — folder is empty)* | — |
| experiment16 | Matrices, linear systems and Markov chains | [experiment16/README.md](experiment16/README.md) |
| experiment17 | Numerical methods — root finding, ODEs, curve fitting | [experiment17/README.md](experiment17/README.md) |

Each of those READMEs marks every script as either:

- ✅ **Given** — the lecturer supplied these values, leave them alone
- ✏️ **Change this** — placeholders, substitute your own before submitting

## Running the scripts

Open the file in the MATLAB Editor and press **Run**, or from the Command Window:

```matlab
cd experiment6
run('6.1.m')
```

Filenames contain dots, so `run('6.1.m')` is needed — you cannot call them as plain
commands.

Scripts that use `rand` produce slightly different output on every run. That is
expected. Add `rng(0);` at the top if you need repeatable numbers.
