from pathlib import Path
import pandas as pd
import numpy as np

# Project paths
PROJECT_DIR = Path(__file__).resolve().parent.parent

DATA_FILE = (
    PROJECT_DIR
    / "data"
    / "raw"
    / "Retail Sales Data.csv"
)

if not DATA_FILE.is_file():
    raise SystemExit(
        "Retail source CSV is not included in the public repository.\n"
        "To run this script, place an authorised copy at:\n"
        f"  {DATA_FILE}\n"
        "See data/README.md for instructions."
    )

# Load dataset
df = pd.read_csv(DATA_FILE)

print("RETAIL DATA EXPLORATION")
print("=" * 50)

# Dataset overview
print("\nDataset shape:")
print(df.shape)

print("\nColumn names:")
print(df.columns.tolist())

print("\nMissing values:")
print(df.isnull().sum())

print("\nDuplicate Order IDs:")
print(df["Order_ID"].duplicated().sum())

# Convert dates
df["Order_Date"] = pd.to_datetime(
    df["Order_Date"],
    errors="coerce"
)

print("\nDate range:")
print(df["Order_Date"].min())
print(df["Order_Date"].max())

print("\nInvalid dates:")
print(df["Order_Date"].isna().sum())

# Calculate KPIs
total_revenue = df["Net_Revenue_USD"].sum()
total_profit = df["Profit_USD"].sum()

profit_margin = (
    total_profit / total_revenue * 100
    if total_revenue != 0 else 0
)

print("\nOVERALL BUSINESS KPIs")
print("-" * 50)

print("Total Orders:", df["Order_ID"].nunique())
print(f"Net Revenue: US${total_revenue:,.2f}")
print(f"Total Profit: US${total_profit:,.2f}")
print(f"Profit Margin: {profit_margin:.2f}%")
print("Units Sold:", df["Units_Sold"].sum())

# Product-category analysis
category = df.groupby("Product_Category").agg(
    Revenue=("Net_Revenue_USD", "sum"),
    Profit=("Profit_USD", "sum"),
    Orders=("Order_ID", "nunique")
)

category["Profit_Margin_Pct"] = (
    np.where(
        category["Revenue"] != 0,
        category["Profit"] / category["Revenue"] * 100,
        0
    )
)

print("\nCATEGORY PERFORMANCE")
print("-" * 50)
print(category.round(2).to_string())

# Loss-making orders
losses = df[df["Profit_USD"] < 0]

print("\nLOSS-MAKING TRANSACTIONS")
print("-" * 50)
print("Loss-making orders:", len(losses))

print("\nLosses by category:")
print(
    losses.groupby("Product_Category")
    .size()
    .sort_values(ascending=False)
)

print("\nPython exploration completed!")
