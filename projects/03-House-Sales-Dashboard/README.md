# King County, Washington — House Sales Analysis (2014–2015)

> Visual analytics project to understand price drivers and neighborhood patterns for residential properties in King County, WA.

---

## Project Overview

* **Title**: King County House Sales — Price Drivers & Market Patterns
* **Business problem**:
  Identify how features (living area, bathrooms, grade/finish quality, view, condition, location) affect **sale price**, and turn those insights into actionable guidance for **pricing**, **renovation priorities**, and **marketing strategy**.
* **Dataset**:
  `HouseData.xlsx` — **21,060 rows × 16 columns** . Transactions **2014-05-02 to 2015-05-27** with fields such as `price, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view, condition, grade, yr_built, zipcode, lat, long, date`.
* **Tools used**:
  Tableau (dashboards), Microsoft Excel
* **Timeline**: \~3–4 days total (data understanding/cleaning: 1–2; dashboarding/insights: 1–2; documentation: 0.5).

---

## Methodology (Concise)

1. **Ingestion & Schema Checks**
   Load Excel → verify types, date range, zipcode coverage; ensure no missing values in core fields.
2. **Cleaning & Standardization**

   * Parse `date` to `YYYY-MM-DD`.
   * Normalize categories: `view` {No View, Fair, Average, Good, Excellent}; `condition` from Poor/Worn-out → Very Good.
   * Create features: `price_per_sqft = price / sqft_living`; binned histograms for price/bedrooms/bathrooms.
3. **Visual Analytics (Tableau)**

   * **Time series**: daily average price.
   * **Histograms**: price, bedrooms, bathrooms.
   * **Heatmap**: `view × condition` vs **avg price**.
   * **Map**: zipcode-level aggregation for spatial patterns.
4. **Validation (quick)**

   * Correlation of numerics to `price`.
   * Simple regression: `price ~ sqft_living` to estimate **\$ per sqft**.

---

## Analysis Results

* **Key finding 1 — Technical price drivers**
  Highest correlations with `price`: **grade (0.665)**, **sqft\_living (0.656)**, **bathrooms (0.486)**, **lat (0.396)**.
  A simple regression gives slope ≈ **\$197 per sqft** (≈ **+\$19.7k per additional 100 sqft** of living area).

* **Key finding 2 — View & condition premium**
  Avg price for **Excellent view + Very Good condition** ≈ **\$1.014M** vs **No View + Average condition** ≈ **\$482k** → **≈ \$532k (\~110%) premium**.
  Implication: upgrades that improve **finish grade/condition** and **perceived view** meaningfully lift value.

* **Business impact**

  * **Pricing**: factor-based guidance (grade, living area, bathrooms, view/condition) supports listing price and negotiation.
  * **Renovation ROI**: prioritize **finish grade** and **bathroom upgrades** for stronger value uplift.
  * **Targeting**: spatial clusters (lat/zipcode) show higher averages → focus marketing on premium pockets.

* **Challenges faced**

  * **Right-skewed prices** (p95 ≈ \$980k) affect averages and chart scaling.
  * **Category semantics** (`grade`, `condition`) need shared definitions across teams.
  * **Spatial granularity**: zipcode aggregation can hide block-level nuances.

---

## Dashboard & Files

* **Tableau Workbook**: [House Prices Dashboard.twbx](sandbox:/mnt/data/House%20Prices%20Dashboard.twbx)
  *(Open with Tableau Desktop/Reader. Optionally publish to Tableau Public for a live demo.)*
* **Preview Screenshot**: [PNG](sandbox:/mnt/data/Screenshot%202025-08-06%20144317.png)
* **Dataset**: [HouseData.xlsx](./assets/HouseData.xlsx)

**Live Demo:**
[House Sales Dashboard](https://public.tableau.com/app/profile/muhammad.zaki8426/viz/HousePricesDashboard_17339701719370/KingCountyHouseSales?publish=yes)

---

## Technical Highlights

* **Data size**: 21,060 records; 2014-05-02 → 2015-05-27; \~70 zipcodes; no missing values on key fields.
* **Quick stats**: mean price ≈ **\$500k**; mean **July 2014** ≈ **\$509k**.
* **Correlations to price**: grade (0.665), sqft\_living (0.656), bathrooms (0.486), lat (0.396), bedrooms (0.317).
* **Simple regression**: \~ **\$197 per sqft** (price \~ sqft\_living).
* **Heatmap takeaway**: stronger **view × condition** combos consistently command higher prices.

---

## Business Value (Executive Summary)

* Delivers a **pricing framework** grounded in physical and quality features → faster listing/appraisal decisions.
* Identifies **high-ROI renovations** (finish grade, bathroom upgrades) and quantifies **view premium**.
* Provides **market mapping** to direct campaigns toward higher-value areas.

---
