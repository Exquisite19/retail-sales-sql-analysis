-- ============================================================
-- Retail Sales SQL Analysis
-- schema.sql — Database and table definitions
-- Author: Pheisel Gopito
-- ============================================================

CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

-- ── Customers ─────────────────────────────────────────────
CREATE TABLE customers (
    customer_id  INT           PRIMARY KEY AUTO_INCREMENT,
    first_name   VARCHAR(50)   NOT NULL,
    last_name    VARCHAR(50)   NOT NULL,
    email        VARCHAR(100)  UNIQUE NOT NULL,
    city         VARCHAR(50),
    gender       VARCHAR(10),
    joined_date  DATE
);

-- ── Products ──────────────────────────────────────────────
CREATE TABLE products (
    product_id    INT            PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(100)   NOT NULL,
    category      VARCHAR(50),
    price         DECIMAL(10,2)  NOT NULL,
    supplier      VARCHAR(100),
    stock_qty     INT            DEFAULT 0,
    reorder_level INT            DEFAULT 20
);

-- ── Sales ─────────────────────────────────────────────────
-- References both customers and products via foreign keys
CREATE TABLE sales (
    sale_id         INT            PRIMARY KEY AUTO_INCREMENT,
    customer_id     INT            NOT NULL,
    product_id      INT            NOT NULL,
    quantity        INT            NOT NULL,
    unit_price      DECIMAL(10,2)  NOT NULL,
    sale_date       DATE           NOT NULL,
    payment_method  VARCHAR(20),
    store_location  VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);
