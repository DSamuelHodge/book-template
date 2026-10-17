"""Example data chart. Reads data/sample.csv, writes figures/out/growth.pdf."""
import csv
import pathlib

import matplotlib.pyplot as plt

root = pathlib.Path(__file__).resolve().parents[2]
plt.style.use(root / "figures/src/style.mplstyle")

with open(root / "data/sample.csv") as f:
    rows = list(csv.DictReader(f))
x = [int(r["year"]) for r in rows]
y = [float(r["value"]) for r in rows]

fig, ax = plt.subplots(figsize=(4.6, 2.6))
ax.plot(x, y, marker="o", markersize=3)
ax.set_xlabel("Year")
ax.set_ylabel("Value")

out = root / "figures/out"
out.mkdir(exist_ok=True)
fig.savefig(out / "growth.pdf")
