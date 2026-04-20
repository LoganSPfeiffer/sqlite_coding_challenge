# Analytics Insights — bais_sqlite_lab.db

---

## Task 1 — Customer Lifetime Value

**Results**
| Customer | Total Spend |
|---|---|
| Jacob Foster | $8,722.67 |
| Ethan Gomez | $8,206.19 |
| Sophia Ahmed | $5,471.57 |
| Lucas Hale | $4,438.25 |
| Emma Young | $4,409.83 |

**Analysis**
- The top two spenders — Jacob Foster and Ethan Gomez — are both Bronze-tier customers, which suggests loyalty classification doesn't reliably track actual spend.
- All five customers are separated by less than $4,400 total, indicating a tight cluster at the high end rather than a single dominant whale.
- Emma Young ($4,409.83) is the only Gold-tier customer in the top 5, confirming Gold status correlates with loyalty, not necessarily with revenue.

---

## Task 2 — Revenue by Product Category

**Results — all orders**
| Category | Revenue |
|---|---|
| Electronics | $25,364.23 |
| Furniture | $12,712.00 |
| Grocery | $405.72 |
| Stationery | $319.24 |

**Results — Delivered orders only**
| Category | Revenue |
|---|---|
| Electronics | $13,616.93 |
| Furniture | $8,750.00 |
| Grocery | $260.82 |
| Stationery | $144.90 |

**Analysis**
- Electronics dominates at $25,364.23 — more than double Furniture ($12,712.00). Grocery and Stationery are negligible by comparison.
- Category rankings hold when filtered to Delivered orders only — no inversions — meaning Electronics' lead is real and not inflated by undelivered volume.
- Electronics' delivered share (~54%) is close to the overall dataset delivery rate (~60%), so it doesn't carry unusual fulfillment risk.

---

## Task 3 — Compensation Outliers

**Results**
| First | Last | Department | Salary | Dept Avg |
|---|---|---|---|---|
| Farah | Garcia | Finance | $91,000 | $89,500 |
| Maya | Bennett | IT | $112,000 | $105,333 |
| Carol | Singh | Marketing | $65,000 | $61,500 |
| Kira | Patel | Operations | $61,000 | $60,500 |
| Alice | Nguyen | Sales | $72,000 | $61,000 |

**Analysis**
- Every department has exactly one outlier, which reflects small team sizes (most have just two employees) rather than systemic pay inequality.
- Maya Bennett (IT) is the highest-paid employee at $112,000 — $6,667 above her department average — but IT as a whole skews high, so the premium is compressed.
- Alice Nguyen (Sales) has the widest relative gap: $11,000 above a three-person department average of $61,000.
- Kira Patel (Operations) clears the threshold by just $500 ($61,000 vs. $60,500), the narrowest margin in the dataset.

---

## Task 4 — Geographic Loyalty Segmentation

**Results — Gold customers by city**
| City | Gold Customers |
|---|---|
| Tampa | 4 |

**Results — Full tier distribution by city**
| City | Gold | Silver | Bronze | Total |
|---|---|---|---|---|
| Tampa | 4 | 0 | 0 | 4 |
| Brandon | 0 | 1 | 0 | 1 |
| Clearwater | 0 | 0 | 1 | 1 |
| Lakeland | 0 | 0 | 1 | 1 |
| Orlando | 0 | 0 | 1 | 1 |
| Sarasota | 0 | 1 | 0 | 1 |
| St. Petersburg | 0 | 1 | 0 | 1 |

**Analysis**
- All four Gold-tier customers are in Tampa. No other city has a single Gold customer.
- Every other city holds exactly one customer, split evenly between Silver (Brandon, Sarasota, St. Petersburg) and Bronze (Clearwater, Lakeland, Orlando).
- Tampa accounts for 4 of 10 customers and 100% of Gold-tier volume — a sharp geographic concentration that could reflect targeted acquisition or a small, non-representative sample.
