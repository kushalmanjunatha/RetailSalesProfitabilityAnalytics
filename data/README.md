# Retail dataset setup

This project analysed **18,240 illustrative FMCG retail orders from 2023–2025**. All monetary figures are **USD**, including rows labelled Australia. The analysed file originally contained **27 columns**.

## Why the CSV is not in this repository

The dataset's verified source URL and public redistribution licence were not supplied with the project. To avoid publishing a file without confirmed permission, the original CSV is **excluded**. No publicly downloadable replacement is asserted here.

## How to run the analyses locally

1. Obtain an authorised copy of the same dataset (if you have access), or use your own CSV with compatible columns.
2. Save it at `data/raw/Retail Sales Data.csv` relative to the repository root. This folder is present in the repository and the CSV is ignored by Git.
3. Install Python dependencies from the project root: `python -m pip install -r requirements.txt`.
4. Run `python "python/Data Exploration.py"` and `python "python/Profitability Analysis.py"`.
5. For SQL, run `sql/Database Setup.sql` and use MySQL Workbench's Table Data Import Wizard to load the same CSV into `retail_analytics.retail_sales`.

The original 27-column schema is declared in `sql/Database Setup.sql`. Key columns used directly by Python include `Order_ID`, `Order_Date`, `Product_Category`, `Discount_Pct`, `Units_Sold`, `Net_Revenue_USD`, and `Profit_USD`.

The published values (**18,240 orders; US$14.45M revenue; US$3.31M profit; 784 loss-making orders**) were measured on the original illustrative dataset. An alternative dataset will produce different results; the displayed figures are not guaranteed without the same source data.

## Saved outputs

The repository still includes chart images, dashboard screenshots, saved Power BI and Excel files, and summary reports. Refreshing Power BI or Excel may require reconnecting to your local data source. **Note:** Excel/Power BI files may themselves contain embedded records from the original dataset; review rights to share those files before publishing.
