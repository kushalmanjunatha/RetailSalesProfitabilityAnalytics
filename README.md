# Retail Sales, Pricing & Profitability Analytics

**End-to-end graduate data analytics portfolio | Excel · MySQL · Power BI · Python**

> **Dataset:** Analysis of 18,240 **illustrative** FMCG retail orders dated 2023–2025. Figures are in **USD**, including records labelled Australia. This is a portfolio analysis, not validated financial performance from a real retailer. **The source CSV is not included in this public repository because redistribution permissions have not been verified.**

## Project overview

This project explores **what drives observed retail profitability differences** across product categories, discount ranges, sales channels and customer segments. It combines Excel reporting, MySQL analysis, Python data exploration and a three-page Power BI dashboard to communicate evidence-based findings.

### Highlights

| Measure | Value |
|---|---:|
| Orders | **18,240** |
| Net revenue | **US$14.45M** |
| Profit | **US$3.31M** |
| Overall profit margin | **22.90%** |
| Loss-making orders | **784 (4.30%)** |

## Business questions

- Which categories generate the most revenue and profit, and how do their margins compare?
- Where are loss-making orders concentrated?
- How do discounts and promotions correspond to margins?
- How does profitability differ by channel and customer segment?
- What patterns are worth investigating further before changing prices or promotions?

## Power BI dashboard

**[Open the Power BI report](powerbi/Retail%20Sales%20Dashboard.pbix)** in Power BI Desktop. The report contains three pages:

1. **Executive Overview:** Revenue, profit, orders and high-level performance trends.
2. **Pricing & Profitability:** Discount bands, margin comparisons and loss-making orders.
3. **Customer & Product Insights:** Customer type, channel, category and product comparisons.

### Dashboard screenshots

**Executive Overview** — KPI cards for revenue, profit, orders and margin, with sales trends and category/channel comparisons.

![Power BI Executive Overview](Dashboards/Executive%20Overview.png)

**Pricing & Profitability** — Profitability comparisons by promotion, discount range and sales channel, plus loss-making orders by category.

![Power BI Pricing and Profitability](Dashboards/Pricing%20and%20Profitability.png)

**Customer & Product Insights** — Customer segment performance, product-profit rankings and Australia city comparisons.

![Power BI Customer and Product Insights](Dashboards/Customer%20and%20Product%20Insights.png)

All three screenshots show the completed Power BI report pages. The `.pbix` file is also included and retains saved results; local data connections might need updating to refresh.

## Selected findings

| Segment | Finding | Interpretation |
|---|---|---|
| Beverages | **14.02%** margin; highest category revenue (**US$3.74M**) | Strong sales do not necessarily mean strong profitability |
| Household | **US$832,222** category profit | Highest absolute profit contribution |
| Wholesale | **25.90%** margin | Higher observed margin than other sales channels |
| Online | **12.41%** margin | Review costs, mix and discounts before drawing conclusions |
| Loss-making orders | **784**, including **510** Beverages orders | Investigate product-level loss drivers |
| Discounts | **10–15%** band margin **23.42%** | Association only; not evidence of causal discount effects |

Read the [Executive Summary](reports/Executive%20Summary.md) and the detailed [Business Insights Report](reports/Retail%20Business%20Insights.md) for evidence, caveats and recommendations.

### Business value

- **Performance reporting:** Developed KPIs and a Power BI dashboard to compare sales, profit and margins.
- **Profitability investigation:** Identified categories and orders with weaker or negative observed profitability.
- **Commercial interpretation:** Compared channels and discount groups without overstating causation.
- **Decision support:** Proposed specific investigations that could be tested using real operational data.

## Tools and techniques

| Stage | Techniques |
|---|---|
| Excel | Data review, PivotTables, KPI summaries, visual reporting |
| MySQL | Aggregations, CASE expressions, JOINs, CTEs and window functions |
| Power BI | Three report pages, DAX measures, visualisations and interactive filters |
| Python | pandas, NumPy, Matplotlib, grouped profitability summaries, data-quality checks |
| Reporting | Business findings, limitations and evidence-based recommendations |

## Python charts

**Profit margin by discount range**

![Profit margin by discount range](outputs/charts/Discount%20Profitability.png)

**Loss-making orders by category**

![Loss-making orders by category](outputs/charts/Loss%20Making%20Orders.png)

## Project structure

```text
Retail Sales Profitability Analytics/
├── README.md
├── .gitignore
├── requirements.txt
├── data/
│   ├── README.md
│   └── raw/
│       └── README.md  (instructions; CSV not published)
├── excel/
│   ├── Retail Sales Portfolio.xlsx
│   └── Retail Excel Analysis.xlsx
├── sql/
│   ├── Database Setup.sql
│   ├── Sales Performance.sql
│   ├── Discount Profitability.sql
│   ├── Customer Channel Analysis.sql
│   └── Advanced Retail Analysis.sql
├── python/
│   ├── Data Exploration.py
│   └── Profitability Analysis.py
├── powerbi/
│   └── Retail Sales Dashboard.pbix
├── Dashboards/
│   ├── Executive Overview.png
│   ├── Pricing and Profitability.png
│   └── Customer and Product Insights.png
├── outputs/
│   └── charts/
│       ├── Discount Profitability.png
│       └── Loss Making Orders.png
└── reports/
    ├── Executive Summary.md
    └── Retail Business Insights.md
```

## How to reproduce

### 1. Prepare the project

Download or clone the repository, then work from the folder containing this `README.md`. The original CSV is **not** distributed here because its source licence and publication terms were not supplied.

To rerun the Python analyses or import data into MySQL, first obtain **an authorised copy of the same dataset** (or use your own data with the required 27-column schema). Place the file locally at `data/raw/Retail Sales Data.csv`. See [Data Setup](data/README.md) for the file requirements. `data/raw/` is retained in the repository through an instructions file. **The published KPI values can only be reproduced exactly with the same 18,240-record dataset and definitions.**

### 2. Install Python dependencies

```powershell
python -m pip install -r requirements.txt
```

### 3. Run Python exploration

```powershell
python "python/Data Exploration.py"
python "python/Profitability Analysis.py"
```

The second script saves the two charts in `outputs/charts/` using the filenames shown above. Both scripts require your **locally provided** `data/raw/Retail Sales Data.csv`; if it is absent, they show a setup message. The supplied chart images and dashboard screenshots can be viewed without the CSV.

### 4. Explore SQL results in MySQL Workbench

Run [`sql/Database Setup.sql`](sql/Database%20Setup.sql) to create `retail_analytics.retail_sales`, then import your **local** `data/raw/Retail Sales Data.csv` into that table using MySQL Workbench's Table Data Import Wizard. The repository does not contain this CSV. **Map all required columns and confirm 18,240 records if you have the same dataset used in this analysis.**

> If you already have the table and records, skip the import. The setup script creates the table but does not load the CSV automatically.

Execute the remaining SQL files in this order:

1. [`Sales Performance.sql`](sql/Sales%20Performance.sql)
2. [`Discount Profitability.sql`](sql/Discount%20Profitability.sql)
3. [`Customer Channel Analysis.sql`](sql/Customer%20Channel%20Analysis.sql)
4. [`Advanced Retail Analysis.sql`](sql/Advanced%20Retail%20Analysis.sql)

The advanced file contains the category-level **top-three products by profit** query using a CTE, JOIN and `DENSE_RANK()` window function.

### 5. Open the reporting files

- [Power BI dashboard](powerbi/Retail%20Sales%20Dashboard.pbix)
- [Excel portfolio workbook](excel/Retail%20Sales%20Portfolio.xlsx)
- [Excel analysis workbook](excel/Retail%20Excel%20Analysis.xlsx)

These files include saved analysis, but Power Query, MySQL or local CSV refresh paths might refer to the original computer or CSV filename. Update those connections in Excel/Power BI if you refresh them.

## Limitations and responsible interpretation

- The dataset is illustrative. Its source licence and redistribution permissions were not available, so the CSV has been excluded from this public repository. Exact recalculation requires a separately obtained, authorised copy of the same data.
- Saved Excel workbooks and Power BI files may contain embedded data/model records even though the standalone CSV is excluded; assess their publication rights as well.
- All monetary values are in **USD**, not AUD, even for the Australia-labelled rows.
- The analysis is descriptive and cannot establish that particular discounts, promotions or channels *cause* a profit change.
- No recommendations were implemented or measured against real business outcomes.
- The Power BI dashboard screenshots show saved report views; reopening or refreshing the `.pbix` may require reconnecting local data sources.
