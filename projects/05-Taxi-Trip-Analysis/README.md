# Taxi Trip Analysis — NYC Yellow Taxi (2017)

> Exploratory data analysis of 2017 NYC yellow-taxi trips to understand trip profiles, fare/tip drivers, and operational levers for pricing & service optimization.

---

## Project Overview

* **Title**: NYC Taxi Trips — Fare & Operations Insights
* **Business problem**:
  What factors most influence **total fare** (distance, duration, passenger count, payment method, tips)? What does the **typical trip** look like? Which operational actions (pricing, cashless promotion, shift planning) can improve revenue and service?
* **Dataset**:
  `Taxi_Trip_Data.csv` — **22,699 rows × 18 columns** (NYC TPEP schema).
  Key fields: `tpep_pickup_datetime, tpep_dropoff_datetime, passenger_count, trip_distance, fare_amount, tip_amount, total_amount, payment_type, PULocationID, DOLocationID`.
  Period: **2017-01-01 → 2017-12-31**.
* **Tools used**:
  Python (Pandas, NumPy, Matplotlib), Jupyter Notebook.
* **Timeline**: \~2 days (0.5 data checks/cleaning, 1.0 EDA & insights, 0.5 documentation).

---

## Methodology (Concise)

1. **Load & schema checks**: drop index column (`Unnamed: 0`); parse pickup/dropoff datetimes (UTC).
2. **Cleaning**: cast numerics; remove/flag impossible values (negative fares/distances, nonpositive durations); light winsorization (P99) for visuals.
3. **Feature engineering**:

   * `dur_min = dropoff − pickup` (minutes)
   * `tip_pct = tip_amount / fare_amount` (for card payments with positive fare)
   * `fare_per_mile = fare_amount / trip_distance`
4. **EDA**: distributions (distance, duration, fare, tips), correlations to `total_amount`, segments by `payment_type`, `passenger_count`, and `PULocationID`.
5. **Validation**: quantile checks, zero/negative screens, duration sanity.

---

## Analysis Results

* **Key finding 1 — Trip profile & fare drivers**

  * **Median duration** ≈ **11.2 min** (p90 **28.6**); **median distance** ≈ **1.76 mi** (p90 **4.6**).
  * **Median total\_amount** ≈ **\$12.36** (p90 **\$26.00**).
  * Correlation with `total_amount`: `fare_amount` **0.987**, `trip_distance` **0.767**, `dur_min` **0.126**, `passenger_count` **0.008** → **distance/fare** dominate; duration/passengers contribute little.
  * **Median fare\_per\_mile** ≈ **\$5.50** (robust to outliers).

* **Key finding 2 — Payment & tipping behavior**

  * **Payment type mix**: card (`1`) **67.3%**, cash (`2`) **32.0%**, others <1%.
  * For **card trips**, **median tip\_pct ≈ 22%** (mean **21.4%**).
  * **71%** of trips have **1 passenger** → clear target for cashless/tipping nudges.

* **Business impact**

  * **Pricing**: calibrate by **distance** (not duration) and monitor **fare per mile**.
  * **Revenue uplift**: promote **cashless** (higher/trackable tips); set default tip buttons at **20–25%**.
  * **Ops KPIs**: focus on **distance per trip** and **tip rate** rather than passenger count.

* **Challenges faced**

  * **Extreme outliers** (very long durations, anomalous fares/tips).
  * Zero/negative values in distance/fare fields.
  * Location codes (`PULocationID/DOLocationID`) require zone maps for rich spatial analysis.

---

## Dashboard & Files

> Adjust relative paths to your repo layout.

* **Notebook**:
  [`Taxi-Trip-Analysis.ipynb`](./notebooks/Taxi-Trip-Analysis.ipynb)
* **Dataset (CSV)**:
  [`Taxi_Trip_Data.csv`](./assets/Taxi_Trip_Data.csv)

**Live demo (optional):**
Publish a Tableau Public or Streamlit mini-app and place the link here.

---

## Technical Highlights

* **Data size**: 22,699 trips; full **2017** coverage.
* **Quick stats**

  * `trip_distance` — median **1.76 mi**, p90 **4.60**, max **33.0**.
  * `dur_min` — median **11.18**, p90 **28.55**, max outlier **1,440**.
  * `total_amount` — median **\$12.36**, p90 **\$26.00**.
  * `tip_pct (card)` — median **22%**, mean **21.4%**.
* **Correlations to `total_amount`**: fare **0.987**, distance **0.767**, duration **0.126**, passengers **0.008**.

---

## How to Reproduce

```bash
# (optional) create env
python -m venv .venv
# Windows: .venv\Scripts\activate
source .venv/bin/activate
pip install -r requirements.txt  # if provided

jupyter lab  # or jupyter notebook
# open notebooks/Taxi-Trip-Analysis.ipynb and run all cells
```

---

## Suggested Repository Structure

```
/projects/05-taxi-trip-analysis
├─ README.md
├─ notebooks/
│  └─ Taxi-Trip-Analysis.ipynb
└─ assets/
   └─ Taxi_Trip_Data.csv
```

---

## Skills Demonstrated

**Data wrangling (Pandas), datetime engineering, feature design (duration, tips, fare per mile), robust statistics, outlier handling, correlation analysis, and decision-ready business framing.**

---

## Next Steps

* **Modeling**: light regression (target `log(total_amount)`), features: distance, duration, hour-of-day, payment type, pickup/dropoff zones.
* **Geo insights**: join TLC taxi-zone shapefiles to map revenue and distance by zone.
* **Data quality rules**: automatic filters for outliers (e.g., `dur_min > 180`, `fare_per_mile` outside \[P1, P99]).

---
