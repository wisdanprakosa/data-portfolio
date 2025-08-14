# Taxi Trip Analysis — NYC Yellow Taxi (2017)

> Exploratory data analysis of NYC yellow-taxi trips (2017) to profile trips, identify fare/tip drivers, and surface operations levers for pricing & cashless strategy.

---

## Project Overview

* **Title**: NYC Taxi Trips — Fare & Operations Insights
* **Business problem**:
  Which factors most influence **total fare** (distance, duration, passengers, payment method, tips)? What does a **typical trip** look like? Which actions (pricing, cashless/tip nudges) can improve **revenue** and **operational KPIs**?
* **Dataset**:
  `Taxi_Trip_Data.csv` — **22,699 rows × 18 columns** (NYC TPEP schema), period **2017-01-01 → 2017-12-31**.
* **Tools used**:
  Python (Pandas, NumPy, Matplotlib), Jupyter Notebook.

---

## Analysis Results

* **Key finding 1 — Trip profile & fare drivers**

  * **Median distance** ≈ **1.61 mi**; **median duration** ≈ **11.18 min**.
  * **Median `total_amount`** ≈ **\$11.80** (p90 ≈ **\$30.35**).
  * **Correlations with `total_amount`**: `fare_amount` **0.984**, `trip_distance` **0.902**, `dur_min` **0.162**, `passenger_count` **0.011** → **distance/fare** dominate; duration/passengers contribute little.
  * **Median `fare_per_mile`** ≈ **\$5.51** (robust to outliers).

* **Key finding 2 — Payment & tipping behavior**

  * **Payment mix**: **Card 67.29%**, **Cash 32.04%** (others <1%).
  * **Tip% (card)**: median **≈ 22%** (mean **≈ 21.4%**).
  * **\~71%** of trips have **1 passenger** → clear target for cashless/tipping nudges.

* **Business impact**

  * **Pricing**: calibrate by **distance** (not duration); monitor **fare per mile**.
  * **Revenue uplift**: promote **cashless** (higher/trackable tips); set **default tip buttons at 20–25%**.
  * **Ops KPIs**: focus on **tip rate** and **fare per mile** rather than passenger count.

---

## Dashboard & Files

> Adjust relative paths to your repo layout.

* **Notebook**: [`Taxi-Trip-Analysis.ipynb`](./assets/Taxi-Trip-Analysis.ipynb)
* **Dataset (CSV)**: [`Taxi_Trip_Data.csv`](./assets/Taxi_Trip_Data.csv)

---

## Technical Highlights

* **Size**: 22,699 trips (raw); **22,681** after cleaning.
* **Summary**: distance median **1.61 mi**; duration median **11.18 min**; total\_amount median **\$11.80**, p90 **\$30.35**.
* **Tip (card)**: median **\~22%**, mean **\~21.4%**.
* **Correlations to `total_amount`**: fare **0.984**, distance **0.902**, duration **0.162**, passengers **0.011**.
* **Derived metric**: `fare_per_mile` median **\$5.51**.

---

## Skills Demonstrated

**Data wrangling (Pandas), datetime feature engineering, outlier handling, correlation analysis, and decision-ready business.**

---
