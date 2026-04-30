# retail-sales-sql-analysis
# Retail Sales SQL Analysis

A relational database project analysing retail sales data using MySQL.  
Built to demonstrate core data analyst skills: database design, data modelling, and business querying.

---

## Project Overview

Designed and populated a 3-table relational database (customers, products, sales) representing  
6 months of retail transactions across multiple store locations in Mauritius.  
Wrote 6 business-focused SQL queries to extract actionable insights from the data.

---

## Database Schema

| Table       | Rows | Description                              |
|-------------|------|------------------------------------------|
| customers   | 15   | Customer profiles and demographics       |
| products    | 15   | Product catalogue with stock levels      |
| sales       | 60   | Transactions linking customers/products  |

**Relationships:**  
`sales.customer_id` → `customers.customer_id`  
`sales.product_id` → `products.product_id`

---

## Business Questions Answered

| # | Question | SQL Concept Used |
|---|----------|-----------------|
| 1 | What is the monthly revenue trend? | GROUP BY, DATE_FORMAT, aggregation |
| 2 | Which are the top 5 best-selling products? | JOIN, subquery, percentage calc |
| 3 | Who are the highest-value customers? | JOIN, GROUP BY, MIN/MAX |
| 4 | Which product category drives most revenue? | JOIN, GROUP BY, AVG |
| 5 | Do customers prefer card or cash? | GROUP BY, percentage calc |
| 6 | Which products need restocking? | WHERE filter, computed column |

---

## Key Findings

- **Meat** was the highest-revenue category despite fewer transactions — driven by high unit price
- **Card payments** were preferred over cash across all store locations
- **Chicken Breast** was the single highest-revenue product
- Stock levels for several **Personal Care** and **Meat** products fell within reorder range

---

## Files

| File | Description |
|------|-------------|
| `schema.sql` | CREATE TABLE statements |
| `data.sql` | INSERT statements for all three tables |
| `queries.sql` | All 6 business analysis queries |

---

## Tools Used

- MySQL 8.0
- MySQL Workbench
- SQL (DDL + DML + DQL)

---

## Author

**Pheisel Gopito**  
BCom Business Informatics Student — UNISA  
[LinkedIn](https://linkedin.com/in/pheiselgopito)
