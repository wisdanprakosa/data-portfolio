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
  Microsoft **Excel** (PivotTables, Slicers, Pivot Charts, Dashboard sheet). 

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

---

## Dashboard & Files
* **Workbook (Excel)**:
  `[Bike Sales Dashboard Project.xlsx](./assets/Bike%20Sales%20Dashboard%20Project.xlsx)`

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

## Skills Demonstrated

**Excel PivotTables & Slicers, KPI design, categorical segmentation, conversion analysis, dashboard storytelling, stakeholder-ready insight framing.**

---
