from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Project paths
PROJECT_DIR = Path(__file__).resolve().parent.parent

DATA_FILE = (
    PROJECT_DIR / "data" / "raw"
    / "Retail Sales Data.csv"
)

OUTPUT_DIR = PROJECT_DIR / "outputs" / "charts"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

if not DATA_FILE.is_file():
    raise SystemExit(
        "Retail source CSV is not included in the public repository.\n"
        "To run this script, place an authorised copy at:\n"
        f"  {DATA_FILE}\n"
        "See data/README.md for instructions."
    )

df = pd.read_csv(DATA_FILE)

# -----------------------------------------
# 1. Discount profitability analysis
# -----------------------------------------

conditions = [
    df["Discount_Pct"] == 0,
    df["Discount_Pct"] <= 5,
    df["Discount_Pct"] <= 10,
    df["Discount_Pct"] <= 15,
    df["Discount_Pct"] <= 20
]

labels = [
    "0%",
    "0-5%",
    "5-10%",
    "10-15%",
    "15-20%",
    "Above 20%"
]

df["Discount_Range"] = np.select(
    conditions,
    labels[:-1],
    default=labels[-1]
)

discount_summary = (
    df.groupby("Discount_Range")
    .agg(
        Orders=("Order_ID", "count"),
        Revenue=("Net_Revenue_USD", "sum"),
        Profit=("Profit_USD", "sum")
    )
    .reindex(labels)
)

discount_summary["Profit_Margin"] = (
    100 * discount_summary["Profit"]
    / discount_summary["Revenue"]
)

print("\nDISCOUNT PROFITABILITY")
print(discount_summary.round(2))

# Chart 1
plt.figure(figsize=(10, 5))

bars = plt.bar(
    discount_summary.index,
    discount_summary["Profit_Margin"],
    color="steelblue"
)

plt.title("Profit Margin by Discount Range")
plt.xlabel("Discount Range")
plt.ylabel("Profit Margin (%)")
plt.axhline(0, color="grey", linewidth=0.8)
plt.bar_label(bars, fmt="%.2f%%", padding=3)
plt.ylim(
    min(-5, discount_summary["Profit_Margin"].min() - 3),
    discount_summary["Profit_Margin"].max() + 5
)
plt.tight_layout()

plt.savefig(
    OUTPUT_DIR / "Discount Profitability.png",
    dpi=160
)
plt.close()

# -----------------------------------------
# 2. Loss-making transaction analysis
# -----------------------------------------

losses = df[df["Profit_USD"] < 0]

loss_summary = (
    losses["Product_Category"]
    .value_counts()
    .sort_values(ascending=True)
)

print("\nLOSS-MAKING ORDERS BY CATEGORY")
print(loss_summary)

# Chart 2
plt.figure(figsize=(10, 5))

bars = plt.barh(
    loss_summary.index,
    loss_summary.values,
    color="steelblue"
)

plt.title("Loss-Making Orders by Product Category")
plt.xlabel("Number of Loss-Making Orders")
plt.bar_label(bars, padding=3)
plt.xlim(0, loss_summary.max() * 1.15)
plt.tight_layout()

plt.savefig(
    OUTPUT_DIR / "Loss Making Orders.png",
    dpi=160
)
plt.close()

print("\nCharts generated successfully!")
print("Saved to:", OUTPUT_DIR)
