# Indonesian Urban Solid Waste Analysis — SIPSN 2024

> A 2024 snapshot to map waste generation, check national targets for reduction & handling, and set intervention priorities.

---

## Project Overview

* **Title**: Indonesian Urban Waste Generation Analysis Based on SIPSN 2024
* **Business goals**:

  * Understand waste generation at the city/regency level.
  * Identify areas with the highest volumes.
  * Evaluate performance on **reduction** (upstream) and **handling** (downstream).
  * Set policy and intervention priorities.

## Dataset & Coverage

* **Source**: SIPSN (KLHK), year **2024**
* **Total national waste**: **33,980,337.89 tons/year**
* **Average per reporting city/regency**: **107,874.09 tons/year** *(n = **315**; coverage **315/514** ≈ **61%**)*
* **Processing note**: data cleaned and standardized; empty fields in performance columns are treated as **0**.

## Method (brief)

1. Normalize fields & units (tons/year; kg/person/year → kg/person/day).
2. Descriptive roll-up: national KPIs, top areas, provincial shares, per-capita indicators.
3. Check against **Presidential Regulation 97/2017** (Reduction ≥30%, Handling ≥70%).

---

## KPI Summary (2024)

* **Total waste**: **33,980,337.89 tons/year**
* **Average per city/regency (n=315)**: **107,874.09 tons/year**
* **Coverage**: **315/514** city/regency (**61%**)
* **Target achievement**:

  * **Reduction ≥30%**: **6/315 (1.90%)**
  * **Handling ≥70%**: **70/315 (22.22%)**

---

## Top-5 Highest Waste (tons/year)

1. **Bogor Regency** — **1,026,931.33**
2. **East Jakarta (Administrative City)** — **859,045.05**
3. **Tangerang City** — **798,405.91**
4. **West Jakarta (Administrative City)** — **757,857.05**
5. **South Jakarta (Administrative City)** — **725,690.82**

## Provincial Contribution to National Total

* **West Java**: **18.11%**
* **East Java**: **12.26%**
* **Central Java**: **10.20%**

## Per-Capita Indicators

*(kg/person/year → kg/person/day)*

* **DKI Jakarta**: **296.80 → 0.81**
* **Banten**: **173.74 → 0.48**
* **West Java**: **122.22 → 0.34**
* **East Java**: **99.63 → 0.27**
* **Central Java**: **91.48 → 0.25**

> International practice (World Bank/UNEP) typically compares **per-capita** measures rather than total volume—hence the use of **kg/person/day** for cross-area comparisons.

---

## Target Status (Pres. Reg. 97/2017)

### Reduction (≥30% of generation)

* **Achieved**: **6/315 (1.90%)**

  * **Bandung Regency (West Java)**
  * **Ciamis Regency (West Java)**
  * **Banyumas Regency (Central Java)**
  * **Kulon Progo Regency (Special Region of Yogyakarta)**
  * **Banyuwangi Regency (East Java)**
  * **Magetan Regency (East Java)**
* **Reduction = 0**: **18 areas**, including:
  Aceh (Pidie Jaya Regency, Sabang City), North Sumatra (Dairi Regency), East Nusa Tenggara (Timor Tengah Utara, Sumba Timur, Malaka Regencies), Central Kalimantan (Gunung Mas Regency), Southeast Sulawesi (Konawe Utara, Buton Selatan Regencies), North Maluku (Halmahera Tengah, Halmahera Selatan, Kepulauan Sula, Halmahera Timur, Pulau Morotai, Pulau Taliabu Regencies), Papua (Sarmi Regency), Central Papua (Dogiyai Regency), Southwest Papua (Sorong Selatan Regency).

### Handling (≥70% of generation)

* **Achieved**: **70/315 (22.22%)**

---

## Dashboard Components (suggested)

* **KPI Bar**: Total waste; Average (n=315); Coverage; % meeting **Reduction ≥30%**; % meeting **Handling ≥70%**.
* **Bar Chart**: **Top-10** waste (tons/year).
* **Stacked Bars by Province**: **Met target / < Target / = 0** for **Reduction** and **Handling** (two panels).
* **Choropleth (city/regency)**: **kg/person/day** (quartiles), with tooltip showing waste volume, per-capita, % reduction, and % handling.

---

## Key Insights (short)

* The largest volumes cluster around **Greater Jakarta (Jabodetabek)**—Bogor Regency and three Jakarta administrative cities.
* **Per-capita** is highest in **DKI Jakarta (0.81 kg/person/day)**—suggesting both upstream (3R) and downstream (treatment) measures are needed.
* **Target attainment is still low**: reduction **1.90%**, handling **22.22%**—prioritize areas with **= 0** and provinces with many sub-regions below target.

---

## Quick Definitions

* **Reduction (upstream)** = 3R/limitation. **% reduction = reduced volume / total generation**.
* **Handling (downstream)** = collection, processing, disposal. **% handling = handled volume / total generation**.

---

## Repo Structure (optional)

```
/sipsn-2024
├─ README.md
├─ data/
│  └─ sipsn_2024.csv
├─ notebooks/   # if any
└─ dashboards/  # BI files / images
```

## Next Steps (optional)

* Add **per-capita ranking** by city/regency.
* Build **stacked bars** of target status by province (met / \<target / =0).
* Create a **priority list** using a simple score (volume, per-capita, target status).

---

If you want, I can also trim this into a one-page executive summary or add an **English CV blurb** version.

