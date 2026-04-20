# SQLite Analytics

## Overview
Exploratory SQL analytics against a relational SQLite database covering customer revenue,
product performance, compensation analysis, and geographic loyalty segmentation.

## Database
`bais_sqlite_lab.db` (SQLite)

## Schema
- departments(id, name)
- employees(id, first_name, last_name, email, department_id, salary, hire_date)
- customers(id, first_name, last_name, email, loyalty_level, city)
- products(id, name, category, price, active)
- orders(id, customer_id, order_date, status)
- order_items(id, order_id, product_id, quantity, unit_price)

Key relationships:
- Employees → Departments (many-to-one via department_id)
- Orders → Customers (many-to-one via customer_id)
- Order Items → Orders and Products (many-to-one each)

## Analyses

### Customer Lifetime Value — Top Spenders
- Join orders → order_items → customers
- Line total = quantity × unit_price at item level
- Roll up to customer, sort descending, LIMIT 5
- Output: customer full name, total_spend
- Include all order statuses for full lifetime view

### Revenue by Product Category
- Join order_items → products
- SUM(quantity × unit_price) grouped by category, sort descending
- Variant: isolate Delivered orders only and compare category rankings to the all-orders baseline

### Compensation Outliers by Department
- Identify employees earning strictly above their department's average salary
- Output: first_name, last_name, department name, salary, dept_avg
- Sort by department, then salary DESC
- Use CTE or subquery for department averages

### Geographic Loyalty Segmentation
- Count Gold-tier customers by city, sort DESC with alphabetical tie-break
- Extension: full Gold/Silver/Bronze distribution by city to surface geographic patterns

## File Structure
- `challenge.sql` — all queries, each section headed with a descriptive comment
- `INSIGHTS.md` — data-driven findings with specific numbers from query results

## SQL Style
- Keywords uppercase, consistent indentation, meaningful aliases
- Descriptive section comments (not task numbers)
- All queries validated against bais_sqlite_lab.db via VS Code SQLTools

## Commit Guidelines
- Commit after each logical analysis is complete and validated
- Commit messages should read like real analytical work, examples:
  - `add customer lifetime value query and initial findings`
  - `segment revenue by product category, add delivered-only variant`
  - `identify compensation outliers using dept avg CTE`
  - `add geographic loyalty distribution and city-level segmentation`
  - `finalize insights and clean up query formatting`
- Never commit broken SQL — validate before every commit