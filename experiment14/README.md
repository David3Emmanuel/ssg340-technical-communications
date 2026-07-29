# Experiment 14 — Engineering Applications: Beam Deflection and RL Circuits

Covers applying MATLAB to two standard engineering problems: the deflection curve of
a cantilever beam under uniform load, and the current response of an RL circuit
solved both numerically with `ode45` and analytically.

## Files

| File | Topic |
| --- | --- |
| [14.1.m](14.1.m) | Cantilever beam deflection, and the effect of varying `I` |
| [14.2.m](14.2.m) | RL circuit current, numerical vs theoretical |

**Both scripts prompt you for values in the Command Window.** The suggested ranges
are already shown in the prompts themselves as you type, and are repeated below.

---

## 📋 Input Guidelines

### Experiment 14.1: Cantilever Beam Deflection

| Variable | Description | Suggested Range | Safe Example |
| --- | --- | --- | --- |
| **`w`** | Uniform load (N/m) | `1000` to `50000` | `10000` |
| **`L`** | Beam length (m) | `1` to `10` | `5` |
| **`E`** | Modulus of elasticity (Pa) | `2e11` steel, `7e10` aluminium | `2e11` |
| **`I`** | Moment of inertia (m⁴) | `1e-6` to `1e-4` | `1e-5` |

> ⚠️ **All four must be positive and non-zero.** `E` and `I` sit in the denominator of
> the deflection formula, so entering `0` for either divides by zero. Note that MATLAB
> does **not** raise an error for this — it quietly returns `Inf`, and you get an empty
> or nonsensical plot rather than a message telling you what went wrong. `L = 0` is
> just as bad: it makes the normalised position `x/L` evaluate to `NaN`.

> 💡 **The deflection comes out negative, and that is correct.** `Y` is negative
> because the beam bends *downward* under the load. Your curve should start at zero at
> the fixed end and reach its most negative value at the free tip.

The `E` values are not arbitrary — `2e11` Pa is roughly steel and `7e10` Pa roughly
aluminium, so entering the two in turn is a sensible way to compare materials.

**Task 4 needs no extra input.** It reuses whatever `I` you typed and automatically
compares it against `I*2` and `I*0.5`, so the three curves in the second figure are
always relative to your own value. Deflection is inversely proportional to `I`, so the
doubled-`I` curve should sit closest to zero and the halved-`I` curve furthest from it.

### Experiment 14.2: RL Circuit Response

| Variable | Description | Suggested Range | Safe Example |
| --- | --- | --- | --- |
| **`R`** | Resistance (ohms) | `1` to `100` | `10` |
| **`L`** | Inductance (henries) | `0.01` to `10` | `0.5` |
| **`V`** | Voltage source (volts) | `5` to `240` | `12` |

> ⚠️ **`R` and `L` must both be positive and non-zero.** The time constant `tau = L/R`
> drives the whole simulation. `R = 0` makes `tau` infinite, so the script asks `ode45`
> to integrate to `Inf` and it errors out. `L = 0` makes `tau` zero, giving a
> zero-length time span, which errors too. Unlike 14.1, these fail loudly rather than
> silently.

> 💡 **You do not need to pick a simulation time.** The window auto-scales to `5*tau`,
> which is long enough for the current to reach about 99% of its steady-state value
> whatever `R` and `L` you choose. That is why there is no prompt for it.

**What to look for in the output.** The numerical curve (`ode45`) and the theoretical
curve should lie on top of each other — the dashed red line should be invisible under
the solid blue one. The printed *max difference* should come out very small; a large
value would mean something is wrong. The steady-state current is simply `V/R`, which
the script prints so you can check the curve levels off where it should.

`ode45` is part of base MATLAB, so no extra toolbox is needed for this one.
