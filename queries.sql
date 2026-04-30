-- ============================================================
-- Retail Sales SQL Analysis
-- queries.sql — Business analysis queries
-- Author: Pheisel Gopito
-- NOTE: Run schema.sql and data.sql first
-- ============================================================

USE retail_db;

-- ── Query 1: Monthly Revenue Trend ────────────────────────
-- Business question: Is the business growing month on month?

SELECT
    DATE_FORMAT(sale_date, '%Y-%m')        AS month,
    COUNT(sale_id)                          AS total_transactions,
    SUM(quantity * unit_price)              AS total_revenue,
    ROUND(AVG(quantity * unit_price), 2)    AS avg_order_value
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;


-- ── Query 2: Top 5 Best-Selling Products ──────────────────
-- Business question: Which products drive the most revenue?

SELECT
    p.product_name,
    p.category,
    SUM(s.quantity)                                         AS units_sold,
    SUM(s.quantity * s.unit_price)                          AS total_revenue,
    ROUND(SUM(s.quantity * s.unit_price) * 100.0
        / (SELECT SUM(quantity * unit_price) FROM sales), 1) AS revenue_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 5;


-- ── Query 3: Top Customers by Spend ───────────────────────
-- Business question: Who are our most valuable customers?

SELECT
    CONCAT(c.first_name, ' ', c.last_name)  AS customer_name,
    c.city,
    COUNT(s.sale_id)                         AS total_purchases,
    SUM(s.quantity * s.unit_price)           AS total_spent,
    MIN(s.sale_date)                         AS first_purchase,
    MAX(s.sale_date)                         AS last_purchase
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY total_spent DESC
LIMIT 5;


-- ── Query 4: Revenue by Product Category ──────────────────
-- Business question: Which category is most profitable?

SELECT
    p.category,
    COUNT(s.sale_id)                            AS transactions,
    SUM(s.quantity * s.unit_price)              AS total_revenue,
    ROUND(AVG(s.quantity * s.unit_price), 2)    AS avg_sale_value
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- ── Query 5: Payment Method Breakdown ─────────────────────
-- Business question: Do customers prefer card or cash?

SELECT
    payment_method,
    COUNT(sale_id)                              AS transactions,
    SUM(quantity * unit_price)                  AS total_revenue,
    ROUND(COUNT(sale_id) * 100.0
        / (SELECT COUNT(*) FROM sales), 1)      AS pct_of_transactions
FROM sales
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- ── Query 6: Low Stock Alert ──────────────────────────────
-- Business question: Which products need restocking?

SELECT
    product_name,
    category,
    supplier,
    stock_qty,
    reorder_level,
    (stock_qty - reorder_level)     AS stock_buffer
FROM products
WHERE stock_qty <= reorder_level * 1.5
ORDER BY stock_buffer ASC;
