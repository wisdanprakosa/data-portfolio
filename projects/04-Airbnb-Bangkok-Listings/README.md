Here’s a ready-to-paste README for your **Airbnb Listings — Bangkok** project. I filled in the details from the files you uploaded (CSV, notebook, data dictionary) and kept it recruiter-friendly.

---

# Airbnb Listings — Bangkok Market Analysis

> Exploratory analysis of Bangkok Airbnb listings to understand price drivers, neighborhood patterns, and levers to improve occupancy & revenue.

---

## Project Overview

* **Title**: Airbnb Bangkok — Price & Demand Patterns
* **Business problem**:
  Which factors (room type, neighborhood, availability, minimum nights) drive price and potential occupancy, and how can hosts/platforms use them to optimize pricing, supply, and listing strategy?
* **Dataset**:
  `Airbnb Listings Bangkok.csv` — **15,854 rows × 17 columns** (\~**2.30 MB**). Core fields: `price, room_type, neighbourhood, latitude, longitude, minimum_nights, number_of_reviews, last_review, reviews_per_month, availability_365, calculated_host_listings_count`. Date range for `last_review`: **2012-12-15 → 2022-12-28**.
  Data dictionary provided in PDF.
* **Tools used**:
  Python (Pandas, NumPy, Matplotlib), Jupyter Notebook; optional: Tableau/Geo tools for mapping.
* **Timeline**: \~2–3 days (data understanding/cleaning: 1; EDA & visuals: 1–1.5; write-up: 0.5).

---

## Methodology (Concise)

1. **Load & schema checks**
   Remove index col (`Unnamed: 0`), confirm dtypes; parse `last_review` to datetime.
2. **Cleaning**
   Handle missing values (`last_review`, `reviews_per_month`), cap extreme outliers for visualization (e.g., price above P99).
3. **Feature prep**

   * Create robust statistics (median/quantiles) due to right-skewed price.
   * Aggregate by `room_type` and `neighbourhood`; derive simple demand proxy from `reviews_per_month` and `availability_365`.
4. **EDA & visualization**
   Distribution plots (price, availability, minimum nights), heatmaps/boxplots by room type & neighborhood, and basic geo overview.
5. **Validation**
   Sanity checks (top neighborhoods by count, price quantiles, outlier review of min nights & price).

---

## Analysis Results

* **Key finding 1 — Price drivers**
  Prices are **right-skewed** (median ≈ **1,429**; P95 ≈ **6,762**; max outliers exist). Median price by room type:

  * **Hotel room** ≈ **1,700**
  * **Entire home/apt** ≈ **1,536**
  * **Private room** ≈ **1,212**
  * **Shared room** ≈ **500**
    → Room type is a strong discriminator; “entire place” and “hotel room” command higher medians than private/shared rooms.

* **Key finding 2 — Geographic concentration & pricing**
  Listings are concentrated in **Vadhana** and **Khlong Toei** (≈ **26.8%** of all listings combined). Median neighborhood prices (top examples): **Nong Chok \~ 2,539**, **Parthum Wan \~ 2,400**, **Vadhana \~ 2,000**, **Bang Rak \~ 1,850**.
  → Neighborhood effects are material and can inform localized pricing.

* **Business impact**

  * **Dynamic pricing** by room type & neighborhood reduces under/over-pricing risk.
  * **Minimum nights**: majority allow **1 night** (P75 = 7) but outliers (up to 1,125) depress demand—tighten rules to market norms.
  * **Supply strategy**: expand in high-demand clusters (Vadhana/Khlong Toei); optimize availability for seasonality (median `availability_365` ≈ **309** days; median `reviews_per_month` ≈ **0.44**).

* **Challenges faced**

  * Extreme **outliers** in `price` and `minimum_nights`.
  * **Missing values** in review-related fields.
  * **Neighborhood spelling/standardization** (minor inconsistencies).

---

## Dashboard & Files

> Adjust the relative paths below to match your repo if needed.

* **Notebook**:
  [`Capstone 2_Airbnb Listings Bangkok.ipynb`](./notebooks/Capstone%202_Airbnb%20Listings%20Bangkok.ipynb)

* **Dataset (CSV)**:
  [`Airbnb Listings Bangkok.csv`](./assets/Airbnb%20Listings%20Bangkok.csv)

* **Data Dictionary (PDF)**:
  [`Airbnb Listings Bangkok Data Dictionary.pdf`](./assets/Airbnb%20Listings%20Bangkok%20Data%20Dictionary.pdf)

**Live demo (optional):**
Publish charts to Tableau Public or a lightweight Streamlit app; add the link here once deployed.

---

## Technical Highlights

* **Size**: 15,854 records, 17 fields; **6,659** unique hosts; **50** neighborhoods.
* **Distributions**:

  * `price`—median **1,429**, mean **3,218** (skewed by outliers), P75 **2,429**, P95 **6,762**.
  * `availability_365`—median **309** (IQR 138–360).
  * `minimum_nights`—median **1** (P75 **7**), max **1,125**.
* **Room-type medians**: Hotel **1,700** > Entire **1,536** > Private **1,212** > Shared **500**.
* **Neighborhood concentration**: Vadhana (**2,153 listings**), Khlong Toei (**2,097 listings**).

---

## How to Reproduce

1. Clone the repo and open the notebook:

   ```bash
   pip install -r requirements.txt  # if provided
   jupyter lab
   ```
2. Run `./notebooks/Capstone 2_Airbnb Listings Bangkok.ipynb`.
3. Ensure data files are in `./assets/`.

---

## Suggested Repository Structure

```
/projects/04-Airbnb-Bangkok-Listings
├─ README.md
├─ notebooks/
│  └─ Capstone 2_Airbnb Listings Bangkok.ipynb
└─ assets/
   ├─ Airbnb Listings Bangkok.csv
   └─ Airbnb Listings Bangkok Data Dictionary.pdf
```

---

## Skills Demonstrated

**Data wrangling (Pandas), exploratory data analysis, outlier handling, robust statistics, geospatial grouping (by neighborhood), visualization, and business interpretation for pricing & supply decisions.**

---

## Next Steps

* Model price with regularized regression or tree-based models (target: **log(price)**; features: room type, neighborhood, min nights, availability, reviews).
* Add seasonality features (month, weekday) from calendar data if available.
* Ship a **Streamlit/Tableau** mini-app for interactive exploration.

---

**Author**: *\[Your Name]* • *\[LinkedIn]* • *\[GitHub]*
