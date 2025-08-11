# Bike Sales Dashboard — Buyer Segmentation & Conversion Insights

> Excel dashboard to identify who buys bikes and which factors drive conversion (age, commute distance, region, home ownership, etc.).

---

## Project Overview

* **Title**: Bike Sales — Buyer Persona & Conversion Drivers
* **Business problem**:
  Who are the most likely buyers (buyer personas), which factors most influence **purchase** (age, commute distance, region, home ownership, marital/education), and how can these insights improve **targeting** and **campaign ROI**?
* **Dataset**:
  `Bike Sales Dashboard Project.xlsx` → main sheet **`bike_buyers`**, **1,026 rows × 14 columns** (key fields: `Gender, Income, Children, Education, Occupation, Home Owner, Cars, Commute Distance, Region, Age, Age Bracket, Purchased Bike`).
* **Tools used**:
  Microsoft **Excel** (PivotTables, Slicers, Pivot Charts, Dashboard sheet). *(Optional: Power Query for light cleaning).*
* **Timeline**: \~**1–2 days** (0.5 data understanding, 0.5–1 pivot & dashboard, 0.5 documentation).

---

## Methodology (Concise)

1. **Data check**: validate column types, ensure consistent categorical labels (e.g., `Commute Distance`, `Age Bracket`).
2. **Feature & standardization**: unify `Purchased Bike` → {Yes/No}; derive **conversion rate** = buyers / total by segment.
3. **Pivoting**: build PivotTables for conversion by **Age Bracket**, **Commute Distance**, **Region**, **Home Owner**, **Gender**, **Marital Status**, **Education**, **Occupation**, **Cars**, **Children**.
4. **Dashboarding**: assemble KPIs & charts; add **slicers** (Region, Gender, Age Bracket, Commute Distance, Home Owner).
5. **Validation**: sanity-check row totals, Yes+No consistency, and conversion math.

---

## Analysis Results

* **Key finding 1 — Who converts most?**

  * **Age Bracket**: *Middle Age* highest conversion **54.7%** (vs *Adolescent* **36.6%**, *Old* **31.3%**).
  * **Commute Distance**: **2–5 Miles** **58.6%**, **0–1 Miles** **54.8%** → short–medium commutes are most likely to buy.
  * **Region**: **Pacific** **58.9%** highest; **Europe** **49.4%**; **North America** **43.3%**.
  * **Marital Status**: **Single** **54.3%** > **Married** **43.0%**.
  * **Cars**: **0** car **60.2%**, **1** car **57.4%** → fewer cars, higher purchase likelihood.

* **Key finding 2 — Buyer profile & behavior**

  * **Gender**: nearly balanced (**Female 48.5%**, **Male 48.0%**) → gender is not a primary driver.
  * **Home Owner**: **Non-homeowner** slightly higher (**49.5%**) vs **Homeowner 47.6%**.
  * **Income & Age**: median **Income** is similar for Yes/No (**\$60,000**), but **mean** is higher among buyers (\~\$57.5k vs \$55.0k). **Buyers** skew younger (median **41** vs **44**).

### Quick KPIs

* **Total records**: 1,026
* **Overall conversion (Purchased Bike = Yes)**: **48.25%**
* **Top segments**: *Middle Age*, *2–5 Miles commute*, *Pacific*, *Single*, *0–1 cars*

> **Business impact**:
>
> * **Targeting** → focus on *Middle Age* with **0–5 mile** commutes in **Pacific/Europe**; tailor creatives & channels to *Single* segments.
> * **Positioning** → emphasize commute-friendly features (lightweight, practical, efficient).
> * **Promotions** → entry bundles for buyers with no/one car; commute gear bundling.

* **Challenges faced**

  * No transaction date → cannot analyze seasonality.
  * Text categories (e.g., commute/education) need standardization for consistency.
  * Income medians overlap → add features (micro-location, product price) for sharper propensity models.

---

## Dashboard & Files

> Use **relative paths** in your repo (renaming files to avoid spaces is safer).

* **Workbook (Excel)**:
  `[Bike Sales Dashboard Project.xlsx](./assets/Bike%20Sales%20Dashboard%20Project.xlsx)`
  *Recommended rename →* `Bike_Sales_Dashboard.xlsx` → `[./assets/Bike_Sales_Dashboard.xlsx](./assets/Bike_Sales_Dashboard.xlsx)`

* **Live demo (optional)**:
  Host via OneDrive/SharePoint/Google Drive (view-only) or export a PNG preview of the dashboard and link it here.

---

## Technical Highlights

* **Data size**: 1,026 × 14; key fields: `Gender, Income, Children, Education, Occupation, Home Owner, Cars, Commute Distance, Region, Age, Age Bracket, Purchased Bike`.
* **Conversion math**: `conv_rate = count(Yes) / total` per segment; validated with Yes+No totals.
* **Descriptive splits**:

  * *Age Bracket* → Middle Age **54.7%**, Adolescent **36.6%**, Old **31.3%**
  * *Commute* → 2–5 **58.6%**, 0–1 **54.8%**, 1–2 **47.2%**, 5–10 **39.1%**, 10+ **29.2%**
  * *Region* → Pacific **58.9%**, Europe **49.4%**, North America **43.3%**
  * *Home Owner* → No **49.5%**, Yes **47.6%**
  * *Gender* → Female **48.5%**, Male **48.0%**

---

## How to Reproduce (Excel)

1. Open the workbook → see **Pivot Table** & **Dashboards** sheets.
2. If data updates, click **Data → Refresh All**.
3. Use **Slicers** (Region, Gender, Age Bracket, Commute Distance, Home Owner) for interactive exploration.
4. (Optional) Power Query: add cleaning/standardization steps before pivoting.

---

## Suggested Repository Structure

```
/projects/06-bike-sales-dashboard
├─ README.md
├─ assets/
│  └─ Bike_Sales_Dashboard.xlsx
└─ docs/
   └─ screenshots/
      └─ dashboard.png   # optional preview
```

---

## Skills Demonstrated

**Excel PivotTables & Slicers, KPI design, categorical segmentation, conversion analysis, dashboard storytelling, stakeholder-ready insight framing.**

---

## Next Steps

* Add a simple **propensity score** per persona (e.g., logistic regression in Excel/Power BI).
* Roll out **A/B tests** targeting *Middle Age & 0–5 miles* in the *Pacific* region.
* Integrate **price & product** (bike types) for commute-focused bundling recommendations.

