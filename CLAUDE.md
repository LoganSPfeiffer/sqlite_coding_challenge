# SQLite Analytics — Coding Challenge

## Project
ISM 4212 coding challenge. Database: `bais_sqlite_lab.db` (SQLite).
Files to produce: `challenge.sql` and `INSIGHTS.md`.

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

## Tasks to complete

### Task 1 — Top 5 Customers by Total Spend
- Join orders → order_items → customers
- Line total = quantity × unit_price at item level
- Roll up to customer, sort descending, LIMIT 5
- Output: customer full name, total_spend
- Do NOT filter by status (include all orders)

### Task 2 — Total Revenue by Product Category
- Join order_items → products
- Sum(quantity × unit_price) grouped by category
- Sort descending by revenue
- Optional variant: repeat for only status = 'Delivered', compare rankings

### Task 3 — Employees Above Department Average Salary
- Compare each employee's salary to their department's average
- Output: first_name, last_name, department name, salary, dept_avg
- Sort by department name, then salary DESC
- Use a subquery or CTE to calculate department averages

### Task 4 — Cities with Most Gold Loyalty Customers
- Filter customers WHERE loyalty_level = 'Gold'
- GROUP BY city, sort DESC by count, tie-break alphabetically by city
- Extension: full loyalty distribution (Gold/Silver/Bronze counts by city)

## challenge.sql format rules
- Header comment at top: tool used + how results were validated
- Each task starts with a comment: -- TASK 1, -- TASK 2, etc.
- Consistent casing (SQL keywords uppercase), clear aliases, indentation
- Must run without errors on bais_sqlite_lab.db

## INSIGHTS.md format rules
- 5-10 bullet points
- Each bullet is specific and data-driven (include actual numbers from results)
- Cover: top customer findings, category revenue breakdown, salary outliers, geographic loyalty patterns
- Keep it concise, no fluff

## Validation approach
After writing each query, run it in VS Code + SQLTools SQLite driver against bais_sqlite_lab.db and verify row counts and totals look reasonable before finalizing.