# King County, Washington — House Sales Analysis (2014–2015)

> Visual analytics project to understand price drivers and neighborhood patterns for residential properties in King County, WA.

![Dashboard preview](sandbox:/mnt/data/Screenshot%202025-08-06%20144317.png)

---

## Project Overview

* **Title**: King County House Sales — Price Drivers & Market Patterns
* **Business problem**:
  Bagaimana faktor-faktor (luas bangunan, jumlah kamar mandi, kondisi, view, grade, lokasi) memengaruhi **harga jual rumah**, dan **insight apa** yang dapat dipakai untuk penentuan harga, renovasi prioritas, serta strategi pemasaran?
* **Dataset**:
  `HouseData.xlsx` — 21,060 baris × 16 kolom (±2.0 MB). Periode transaksi **2014-05-02 s.d. 2015-05-27**, mencakup fitur utama: `price, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view, condition, grade, yr_built, zipcode, lat, long, date`.
  • Unduh: [HouseData.xlsx](sandbox:/mnt/data/HouseData.xlsx)
* **Tools used**:
  Tableau (dashboard & mapping), Microsoft Excel (data check), *optional*: Python/Pandas untuk validasi cepat.
* **Timeline**: 1–2 hari (data understanding & cleaning), 1–2 hari (dashboard & insight), 0.5 hari (dokumentasi).

---

## Methodology (Concise)

1. **Ingest & Schema Check**
   Muat data Excel → verifikasi tipe data, range tanggal (2014–2015), 70 zipcode, *no missing values* pada kolom inti.
2. **Cleaning & Standardization**

   * Parse kolom `date` → `YYYY-MM-DD`.
   * Normalisasi kategori: `view` {No View, Fair, Average, Good, Excellent}, `condition` {Poor-Worn out … Very Good}.
   * Buat fitur turunan: `price_per_sqft = price / sqft_living`, binning histogram untuk price/bedrooms/bathrooms.
3. **Visual Analytics (Tableau)**

   * **Time series** daily average price.
   * **Histogram**: price, bedrooms, bathrooms.
   * **Heatmap**: `view × condition` vs **avg price**.
   * **Map**: agregasi per area/zipcode.
4. **Validation (quick checks)**

   * Korelasi numerik terhadap `price`.
   * Regresi satu variabel: `price ~ sqft_living` untuk estimasi *\$ per sqft*.

---

## Analysis Results

* **Key finding 1 — Driver Teknis Harga**
  Korelasi tertinggi ke `price`: **grade (0.665)**, **sqft\_living (0.656)**, **bathrooms (0.486)**, **lat (0.396)**.
  Regresi sederhana memberi slope ≈ **\$197 per sqft** (≈ **+\$19.7k per 100 sqft** tambahan pada luas bangunan).

* **Key finding 2 — View & Condition Premium**
  Rata-rata harga **Excellent view + Very Good condition** ≈ **\$1.014M**, sedangkan **No View + Average condition** ≈ **\$482k** → **premium ≈ \$532k (\~110%)**.
  Implikasi: perbaikan kondisi/estetika dan positioning properti dengan view baik memberi uplift signifikan.

* **Business impact**

  * **Pricing**: model faktor utama (grade, sqft\_living, bathrooms, view/condition) membantu penentuan harga listing & negosiasi.
  * **Renovation ROI**: fokus pada upgrade **grade/kualitas finishing** dan **kamar mandi** cenderung lebih berdampak pada nilai.
  * **Targeting**: zona dengan lat/zipcode tertentu menunjukkan harga rata-rata lebih tinggi → arahkan kampanye ke segmen premium.

* **Challenges faced**

  * **Distribusi harga long-tail** (p95 ≈ \$980k) memengaruhi rata-rata dan skala visual.
  * **Makna kategori** (`grade`, `condition`) perlu diselaraskan agar interpretasi konsisten lintas tim.
  * **Spatial nuance**: variasi mikro antar-blok tidak seluruhnya tertangkap pada agregasi zipcode.

---

## Dashboard & Files

* **Tableau Workbook**: [House Prices Dashboard.twbx](sandbox:/mnt/data/House%20Prices%20Dashboard.twbx)
  *(Buka dengan Tableau Desktop/Reader. Opsional: publish ke Tableau Public untuk live demo.)*
* **Preview Screenshot**: [PNG](sandbox:/mnt/data/Screenshot%202025-08-06%20144317.png)
* **Dataset**: [HouseData.xlsx](sandbox:/mnt/data/HouseData.xlsx)

**Live Demo (opsional):**
Setelah publish ke Tableau Public, tambahkan tautan di sini:
`https://public.tableau.com/views/KingCountyHouseSales/...`

---

## Technical Highlights

* **Data size**: 21,060 records, 16 fields; 2014–05–02 → 2015–05–27; 70 zipcode; tanpa missing pada kolom inti.
* **Quick stats**: mean price ≈ **\$500k**; mean **July 2014** ≈ **\$509k**.
* **Correlations to price**: grade (0.665), sqft\_living (0.656), bathrooms (0.486), lat (0.396), bedrooms (0.317).
* **Regression (simple)**: \~ \$197 **per sqft** (price \~ sqft\_living).
* **Heatmap insight**: kombinasi **view** dan **condition** menaikkan harga rata-rata secara konsisten.

---

## How to Reproduce

1. **Open workbook**:
   Unduh dan buka [`House Prices Dashboard.twbx`](sandbox:/mnt/data/House%20Prices%20Dashboard.twbx) di Tableau.
2. **Relink data (jika diminta)**:
   Arahkan ke file [`HouseData.xlsx`](sandbox:/mnt/data/HouseData.xlsx).
3. **Publish (opsional)**:
   *Server → Tableau Public → Save to Tableau Public*, lalu tambahkan tautan “Live Demo” ke README ini.

---

## Business Value (Executive Summary)

* Menyediakan **framework pricing** berbasis fitur fisik & kualitas (grade/condition) → mempercepat keputusan listing & appraisal.
* Mengidentifikasi **prioritas renovasi** ber-ROI tinggi (upgrade grade & kamar mandi) dan menilai **premium view**.
* Memberikan **pemetaan pasar** untuk targeting kampanye di area bernilai tinggi.

---

## Next Steps

* Tambahkan **model ML ringan** (regularized regression / tree-based) untuk prediksi price dengan validasi silang.
* Integrasi **price-per-sqft** dan **amenities** tambahan (jika data tersedia).
* Perkaya layer spasial (parcel/block level) untuk insight lokasi yang lebih granular.

---

## Repository Structure (suggested)

```
/data
  └── HouseData.xlsx
/dashboard
  └── House Prices Dashboard.twbx
/docs
  └── README.md
  └── screenshots/
       └── dashboard.png
/notebooks (opsional)
  └── quick_checks.ipynb
```

---

## Credits

Data: “King County, WA House Sales (2014–2015)” — disediakan melalui file `HouseData.xlsx`.
Visuals: Tableau.
Author: \[Nama Anda] — \[LinkedIn/GitHub].
