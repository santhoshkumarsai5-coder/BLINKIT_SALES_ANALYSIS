# 🛒 Blinkit Grocery Data Analysis using SQL

## 📌 Project Overview

This project performs **SQL-based data analysis on Blinkit grocery order data** to generate business KPIs, sales metrics, and time-based performance insights.

The goal of this project is to simulate real-world SQL work done by:

* Data Analysts
* Business Intelligence Teams
* E-commerce Analytics Teams
* Retail Analytics Teams
* Product & Sales Analysts

The project includes:

* KPI calculations
* Revenue analysis
* Category performance
* Monthly trends
* MTD / PMTD / YTD metrics
* MoM growth analysis
* Aggregations & CTE queries

---

## ⚙️ Tech Stack

| Tool       | Usage           |
| ---------- | --------------- |
| PostgreSQL | Database        |
| SQL        | Data analysis   |
| pgAdmin    | Query execution |
| GitHub     | Project hosting |

---

## 📂 Dataset Description

The dataset contains grocery order level data from a Blinkit-like delivery platform.

Main columns used:

| Column     | Description      |
| ---------- | ---------------- |
| item_id    | Product ID       |
| item_name  | Product name     |
| category   | Product category |
| price      | Item price       |
| quantity   | Quantity ordered |
| city       | Order city       |
| order_date | Order date       |
| rating     | Customer rating  |

---

## 🧱 Table Creation

The table is created using proper data types for analysis.

```sql
CREATE TABLE blinkit_data (...)
```

Includes:

* Numeric values for price & revenue
* Date column for time analysis
* Text columns for category & city

---

## 📊 KPI Queries

The project calculates important KPIs:

* Total Orders
* Total Revenue
* Average Order Value
* Total Quantity Sold
* Average Rating

Used SQL functions:

* COUNT
* SUM
* AVG
* ROUND

---

## 💰 Revenue Analysis

Revenue is calculated using formula:

```sql
price * quantity
```

Used in:

* Total revenue
* Category revenue
* Monthly sales
* MTD / YTD / PMTD
* MoM growth

---

## 📦 Category Performance

Category-wise revenue calculated using:

```sql
GROUP BY category
```

Used to identify:

* Top selling categories
* Low performing categories

---

## 🌍 City-wise Orders

Orders grouped by city to analyze:

* Demand distribution
* Regional performance

```sql
GROUP BY city
```

---

## 📈 Monthly Sales Trend

Monthly analysis using:

```sql
DATE_TRUNC('month', order_date)
```

Used for:

* Trend analysis
* Dashboard charts
* Time-based KPIs

---

## 📅 MTD (Month-To-Date)

```sql
WHERE order_date >= DATE_TRUNC('month', CURRENT_DATE)
```

Used for:

* Current month sales
* Current month orders
* Dashboard metrics

---

## 📅 PMTD (Previous Month-To-Date)

```sql
CURRENT_DATE - INTERVAL '1 month'
```

Used for comparison with current month.

---

## 📅 YTD (Year-To-Date)

```sql
DATE_TRUNC('year', CURRENT_DATE)
```

Used for yearly performance tracking.

---

## 📊 MoM (Month-over-Month Growth)

Calculated using CTE:

```sql
WITH mtd AS (...)
pmtd AS (...)
```

Used to calculate:

* Growth %
* Sales change
* Performance trend

---

## 🧠 SQL Concepts Used

* Aggregations
* GROUP BY
* ORDER BY
* CASE
* CTE
* Window functions
* DATE_TRUNC
* INTERVAL
* Mathematical formulas
* KPI calculations

---

## 📌 Real-World Use Case

This type of SQL analysis is used in:

* E-commerce companies
* Blinkit / Swiggy / Zomato analytics
* Retail dashboards
* Sales reporting
* Business intelligence tools
* Data analyst projects

---

## 📁 Repository Structure

```
blinkit-sql-analysis/
│
├── blinkit_sql_analysis.sql
├── dataset.csv
└── README.md
```

---

## ⭐ Author

Santhosh Kumar
SQL | Data Analytics | PostgreSQL | BI Projects | Data Warehouse
