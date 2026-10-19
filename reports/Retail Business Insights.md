# Retail Sales, Pricing & Profitability Analytics

## Business Insights Report

**Period:** 2023–2025  
**Dataset:** Illustrative FMCG retail transactions (18,240 orders)  
**Currency:** USD  
**Analysis:** Excel, MySQL, Power BI and Python

## Executive summary

The analysis covers **18,240 orders**, producing **US$14,449,920 net revenue** and **US$3,308,965.31 profit**, an overall **22.90% profit margin**. Performance varies by product category, sales channel and promotional activity. In particular, **784 orders (4.30%)** generated negative profit, concentrated in Beverages.

These are observations from an illustrative dataset, not measured outcomes at an operating retailer.

## Product category performance

| Category | Net revenue (USD) | Profit (USD) | Margin |
|---|---:|---:|---:|
| Beverages | 3,737,688.56 | 524,201.65 | 14.02% |
| Household | 3,160,720.02 | 832,221.58 | 26.33% |
| Personal Care | 2,765,969.05 | 776,980.16 | 28.09% |
| Snacks | 2,516,605.10 | 555,212.09 | 22.06% |
| Dairy & Breakfast | 2,268,937.27 | 620,349.83 | 27.34% |

**Insight:** Beverages has the highest revenue but the lowest category margin; Household contributes the greatest absolute profit. Volume and profitability should be monitored separately.

## Profitability by sales channel

| Sales channel | Net revenue (USD) | Profit margin |
|---|---:|---:|
| Wholesale | 5,208,657.92 | 25.90% |
| Distributor | 4,451,811.56 | 25.23% |
| Modern Trade | 3,371,020.34 | 19.59% |
| Online | 1,418,430.18 | 12.41% |

**Insight:** Online's margin is substantially lower than Wholesale's. This observation warrants examining product mix, discounts, logistics and acquisition costs; it does not establish which factors caused the difference.

## Discounts and promotions

- The **10–15%** discount band has the highest observed margin (**23.42%**) among the reported discount groups.
- Higher discount bands also show margins near 23%, but these patterns are not evidence that increasing discounts raises profitability.
- A fair comparison should account for category, customer segment, order size and sales channel.

## Loss-making orders

- **784** orders were loss-making (**4.30%** of all orders).
- **510** came from Beverages (about **65%** of loss-making orders).
- Other loss-making counts: Snacks 125, Household 55, Personal Care 49, Dairy & Breakfast 45.

## Recommended next steps

1. **Investigate Beverages:** Drill into negative-margin products and orders, checking costs, discount levels and promotional mix.
2. **Review Online profitability:** Compare product mix, logistics costs, marketing spend and discount patterns against other channels.
3. **Evaluate promotions carefully:** Compare like-for-like product and channel segments before recommending discount changes.
4. **Track profitability, not just revenue:** Monitor profit, margin and loss-making order counts alongside sales KPIs in Power BI.

## Limitations

The dataset is illustrative, and its provenance and redistribution permissions were not documented in the supplied project files. No results should be described as verified Australian retail transactions. Values are in **USD** even for rows labelled Australia. Results are descriptive, not causal; the recommendations are hypotheses for further investigation, not tested business improvements. Refreshing the Power BI or Excel data connections on a different computer may require updating local source paths.
