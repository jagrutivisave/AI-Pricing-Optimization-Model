-- ==============================================
-- AI-Powered Pricing Optimization Database
-- ==============================================

-- 1. Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    base_price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_price DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 3. Create Competitor Pricing Table
CREATE TABLE competitor_prices (
    competitor_id INT,
    product_id INT,
    competitor_price DECIMAL(10,2),
    price_date DATE,
    PRIMARY KEY (competitor_id, product_id, price_date),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 4. Sample Query: Aggregate Sales by Product
SELECT
    p.product_id,
    p.product_name,
    SUM(s.quantity_sold) AS total_quantity,
    AVG(s.sale_price) AS avg_sale_price,
    SUM(s.quantity_sold * s.sale_price) AS total_revenue
FROM
    products p
JOIN
    sales s ON p.product_id = s.product_id
GROUP BY
    p.product_id, p.product_name;

-- 5. Sample Query: Compute Price Elasticity Placeholder
-- (To be exported for AI model input)
SELECT
    p.product_id,
    p.product_name,
    AVG(s.sale_price) AS avg_sale_price,
    SUM(s.quantity_sold) AS total_units_sold,
    AVG(c.competitor_price) AS avg_competitor_price
FROM
    products p
LEFT JOIN
    sales s ON p.product_id = s.product_id
LEFT JOIN
    competitor_prices c ON p.product_id = c.product_id
GROUP BY
    p.product_id, p.product_name;

-- 6. Sample Query: Revenue Impact for Price Change Scenario
-- Placeholder for AI-driven simulation
SELECT
    product_id,
    product_name,
    base_price,
    base_price * 1.05 AS increased_price, -- 5% increase scenario
    SUM(quantity_sold * base_price) AS current_revenue,
    SUM(quantity_sold * base_price * 1.05) AS projected_revenue
FROM
    products p
JOIN
    sales s ON p.product_id = s.product_id
GROUP BY
    product_id, product_name, base_price;

-- ==============================================
-- End of Pricing Optimization SQL Template
-- ==============================================