# SQLite Analytics

Exploratory SQL analysis against a small relational SQLite database (`bais_sqlite_lab.db`) covering customers, orders, products, and employees.

## Files

| File | Purpose |
|------|---------|
| `challenge.sql` | All queries, organized by analysis area with section comments |
| `INSIGHTS.md` | Key findings with specific numbers from each query |
| `bais_sqlite_lab.db` | Source SQLite database |

## What's Analyzed

- **Customer Lifetime Value** — top 5 spenders across all order statuses
- **Revenue by Category** — Electronics vs. Furniture vs. Grocery vs. Stationery, with a delivered-only variant for confirmed revenue
- **Compensation Outliers** — employees earning above their department's average, found via CTE
- **Geographic Loyalty** — Gold-tier customer concentration by city, plus a full Gold/Silver/Bronze breakdown

## Running the Queries

Requires SQLite 3. To run all queries at once:

```bash
sqlite3 bais_sqlite_lab.db < challenge.sql
```

Or open `challenge.sql` in VS Code with the SQLTools SQLite driver to run sections interactively.

## Schema at a Glance

```
departments  →  employees
customers    →  orders  →  order_items  ←  products
```
