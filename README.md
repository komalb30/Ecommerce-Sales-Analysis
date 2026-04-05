# 📈 E-Commerce Sales Analytics Project

## Overview
End-to-end data analytics project on an Indian PC components
e-commerce dataset (2020–2022). Analyzes 5,095 orders across
revenue, profit, regional performance, and order fulfillment
using MySQL, Python, and Power BI.

---

## Tools & Technologies
| Tool | Purpose |
|---|---|
| MySQL | Data storage and business SQL queries |
| Python (Pandas) | Data cleaning and feature engineering |
| Power BI | Dashboard and visualization |
| Jupyter Notebook | Python analysis environment |

---

## Business Problem
The sales manager needed visibility into:
- Which products and categories drive the most profit?
- Which regions are underperforming?
- Why 75% of orders are not being delivered?
- Which supervisors are driving the most revenue?

---

## Project Workflow
1. Defined stakeholder and problem statement
2. Loaded raw CSV into MySQL database
3. Wrote business-driven SQL queries
4. Exported data to Python for cleaning and feature engineering
5. Built 4-page interactive Power BI dashboard

---

## Dataset
- **Source:** Online E-Commerce CSV
- **Rows:** 5,095 orders (after cleaning)
- **Period:** January 2020 – December 2022
- **Columns:** 16 (after feature engineering)

---

## Key Insights
- **Total Revenue:** ₹99.3M | **Total Profit:** ₹22.9M
- **Profit Margin:** 23.08% consistent across all orders
- **Top Category:** Monitor (₹5.37M profit)
- **Top State:** Maharashtra (₹17.6M revenue, 18% of total)
- **Top Brand:** Intel (₹18.76M revenue)
- **Fulfillment Rate:** Only 24.89% — critical operational issue
- **Revenue grew** 2020→2021 (+4%) but slightly dipped in 2022

---

## Dashboard Pages
| Page | Content |
|---|---|
| Executive Summary | KPI cards, revenue trend, profit by category |
| Product Analysis | Category profit, brand revenue, product table |
| Regional Performance | State treemap, revenue by state, state table |
| Fulfillment & Supervisors | Status breakdown, supervisor table, monthly trend |

---

## SQL Queries Covered
- Revenue, Cost, Profit by Year
- Category Profit Analysis
- Top 10 States by Revenue
- Fulfillment Rate by Supervisor
- Brand Profit Margin
- Monthly Revenue Trend
- Order Status Breakdown

---

## Python Features Engineered
| Feature | Formula |
|---|---|
| Profit | Total_Sales - Total_Cost |
| Profit_Margin_Pct | (Profit / Total_Sales) × 100 |
| Order_Year | Extracted from Order_Date |
| Order_Month | Extracted from Order_Date |
| Is_Delivered | 1 if Status = Delivered, else 0 |

---

## Folder Structure
```
ecommerce-analytics/
│
├── data/
│   ├── cleaned_ecommerce_data.csv      # Cleaned dataset
│
├── sql/
│   └── ecommerce_db.sql              # All SQL queries
│
├── notebook/
│   └── ecommerce_analysis.ipynb      # Jupyter notebook
│
├── dashboard/
│   └── ecommerce_dashboard.pbix      # Power BI file
│
└── README.md
```

---

## How to Run
1. Load `Online-eCommerce.csv` into MySQL using the schema
   in `sql/business_queries.sql`
2. Run `notebook/ecommerce_analysis.ipynb` in Jupyter
3. Open `dashboard/ecommerce_dashboard.pbix` in Power BI
4. Connect to `ecommerce_powerbi_final.csv` if prompted
