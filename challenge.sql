-- =============================================================================
-- SQLite Analytics — bais_sqlite_lab.db
-- Tool: SQLite 3 via VS Code SQLTools (SQLite driver)
-- Validation: each query run interactively against the live database;
--             row counts and totals verified before committing.
-- Covers: customer lifetime value, category revenue, compensation outliers,
--         and geographic loyalty segmentation.
-- =============================================================================


-- TASK 1 =====================================================================
-- Top 5 customers by lifetime spend (all order statuses included)
-- Joins order line items back to customers to get a true spend picture
-- regardless of fulfillment status — cancelled orders still reflect intent.
-- ============================================================================

SELECT
    c.first_name || ' ' || c.last_name AS customer,
    SUM(oi.quantity * oi.unit_price)   AS total_spend
FROM customers    c
JOIN orders       o  ON o.customer_id = c.id
JOIN order_items  oi ON oi.order_id   = o.id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;


-- TASK 2 =====================================================================
-- Revenue by product category — all orders
-- Establishes the baseline category ranking before any status filtering.
-- ============================================================================

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items  oi
JOIN products     p  ON p.id  = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;


-- TASK 2 (variant) ===========================================================
-- Revenue by product category — Delivered orders only
-- Isolates confirmed revenue (goods that actually reached customers) to see
-- whether category rankings shift when undelivered volume is removed.
-- ============================================================================

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items  oi
JOIN products     p  ON p.id  = oi.product_id
JOIN orders       o  ON o.id  = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;


-- TASK 3 =====================================================================
-- Employees earning above their department's average salary
-- CTE computes per-department averages first; the main query then filters to
-- only employees who beat that threshold, surfacing true outliers per team.
-- ============================================================================

WITH dept_avg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.first_name,
    e.last_name,
    d.name                      AS department,
    e.salary,
    ROUND(da.avg_salary, 2)     AS dept_avg
FROM employees    e
JOIN departments  d   ON d.id  = e.department_id
JOIN dept_avg     da  ON da.department_id = e.department_id
WHERE e.salary > da.avg_salary
ORDER BY d.name, e.salary DESC;


-- TASK 4 =====================================================================
-- Gold-tier customers by city — identifies the highest-value geographic markets
-- Sorted by count descending, then alphabetically to break ties cleanly.
-- ============================================================================

SELECT
    city,
    COUNT(*) AS gold_customers
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customers DESC, city ASC;


-- TASK 4 (extension) =========================================================
-- Full loyalty tier distribution by city
-- Extends the Gold-only view to show Silver and Bronze alongside Gold,
-- revealing whether cities have mixed tiers or are dominated by one segment.
-- ============================================================================

SELECT
    city,
    SUM(CASE WHEN loyalty_level = 'Gold'   THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN loyalty_level = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN loyalty_level = 'Bronze' THEN 1 ELSE 0 END) AS bronze,
    COUNT(*)                                                    AS total
FROM customers
GROUP BY city
ORDER BY gold DESC, city ASC;
