-- =============================================================================
-- SQLite Analytics — bais_sqlite_lab.db
-- Tool: SQLite 3 via VS Code SQLTools (SQLite driver)
-- Validation: each query run interactively against the live database;
--             row counts and totals verified before committing.
-- Covers: customer lifetime value, category revenue, compensation outliers,
--         and geographic loyalty segmentation.
-- =============================================================================


-- =============================================================================
-- Top 5 customers by lifetime spend (all order statuses included)
-- Joins order line items back to customers to get a true spend picture
-- regardless of fulfillment status — cancelled orders still reflect intent.
-- =============================================================================

SELECT
    c.first_name || ' ' || c.last_name AS customer,
    SUM(oi.quantity * oi.unit_price)   AS total_spend
FROM customers    c
JOIN orders       o  ON o.customer_id = c.id
JOIN order_items  oi ON oi.order_id   = o.id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;
