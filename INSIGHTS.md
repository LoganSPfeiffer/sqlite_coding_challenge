# Analytics Insights — bais_sqlite_lab.db

## Customer Lifetime Value

- The top two spenders — Jacob Foster ($8,722.67) and Ethan Gomez ($8,206.19) — together account for a disproportionate share of total customer revenue. Both are Bronze-tier customers, which suggests loyalty classification may not track actual spend.
- The top 5 customers by spend are all separated by less than $4,400, indicating a relatively tight cluster at the high end rather than a single dominant whale.
- Emma Young ($4,409.83), a Gold-tier customer in Tampa, rounds out the top 5, confirming that Gold-tier customers do appear in the high-value segment — just not exclusively.

## Revenue by Product Category

- Electronics dominates all-order revenue at $25,364.23 — more than double the next category (Furniture at $12,712.00). Grocery ($405.72) and Stationery ($319.24) are distant outliers by comparison.
- When filtered to Delivered orders only, Electronics drops to $13,616.93 and Furniture to $8,750.00. Category rankings hold — no tier inversion — which means Electronics' lead is real, not inflated by a high cancellation rate.
- The Delivered-to-all ratio for Electronics (~54%) is close to the dataset's overall delivery rate (~60%), suggesting Electronics doesn't carry unusual fulfillment risk.

## Compensation Outliers

- Every department has exactly one employee earning above the department average, which reflects small team sizes (most departments have just two employees) rather than any structural pay inequality.
- Maya Bennett (IT) is the highest-paid employee in the dataset at $112,000 — $6,667 above her department's average of $105,333 — suggesting IT salaries are elevated but internally compressed.
- Alice Nguyen (Sales) shows the widest gap relative to her peers: she earns $72,000 versus a department average of $61,000, an $11,000 premium over a three-person team.
- Kira Patel (Operations) clears the department average by only $500 ($61,000 vs. $60,500), the narrowest margin across all departments.

## Geographic Loyalty Segmentation

- All four Gold-tier customers are concentrated in Tampa. No other city has a single Gold customer, making Tampa the only high-loyalty market in the dataset.
- The remaining six cities each contain exactly one customer, split evenly between Silver (Brandon, Sarasota, St. Petersburg) and Bronze (Clearwater, Lakeland, Orlando).
- The geographic distribution is highly skewed: Tampa holds 4 of 10 customers and 100% of the Gold tier, which may reflect a targeted acquisition strategy or a sampling artifact in the dataset.
