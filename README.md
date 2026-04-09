# 📊 Ordinal Logistic Regression - RA Treatment Response

## 📌 Overview

Analyze rheumatoid arthritis patient improvement using **ordinal logistic regression** in R.  
Identify the effects of **Treatment, Sex, and Age** on patient outcomes and provide **interpretable clinical insights**.

---

## 💼 Problem

Which factors influence patient improvement in rheumatoid arthritis trials?

- Quantify treatment effectiveness
- Evaluate impact of sex and age
- Support data-driven clinical decision-making

---

## 🎯 Objectives

- Explore dataset (`Arthritis` from `vcd` package)
- Summarize patient improvement by Treatment and Sex
- Build and interpret **ordinal logistic regression** model
- Test proportional odds assumption
- Report odds ratios for clinical interpretation

---

## 📂 Dataset

Built-in R dataset `Arthritis` (~84 patients):

| Variable    | Description                        |
| ----------- | ---------------------------------- |
| `Improved`  | Improvement (None < Some < Marked) |
| `Treatment` | Placebo vs Treated                 |
| `Sex`       | Female / Male                      |
| `Age`       | Age in years                       |

> Note: `data/` folder is empty because the dataset is built into R.

---

## 🛠️ Methodology

- **EDA:** frequency tables, mosaic plots, boxplots
- **Model:** Ordinal logistic regression (`Improved ~ Treatment + Sex + Age`)
- **Evaluation:** odds ratios, likelihood ratio test, Brant test for proportional odds
- **Software:** R, packages `vcd`, `MASS`, `car`, `ggplot2`

---

## 📈 Key Insights & Clinical Impact

- Treated patients are **5.7×** more likely to improve than Placebo → confirms RA treatment effectiveness
- Male patients less likely to improve than females (OR ~0.29) → highlights sex differences in response
- Older patients show slight improvement (~4% increase per year) → supports age-specific guidance
- Proportional odds assumption **holds** (Brant test p > 0.05) → model assumptions valid
- Model significantly better than intercept-only (p < 0.001) → predictors meaningfully improve prediction
- Provides clear, interpretable results for **evidence-based patient counseling** and personalized treatment planning

---

## 🔮 Future Improvements

- Include additional predictors (disease severity, comorbidities)
- Apply predictive modeling for patient outcomes
- Build interactive dashboards for clinicians (Shiny)
- Explore machine learning approaches for ordinal outcomes

---

## 💻 Technologies

R | Packages: `vcd`, `MASS`, `car`, `ggplot2`

---

## ▶️ Run

```r
install.packages(c("vcd","MASS","car","ggplot2"))
# Open and run analysis script in RStudio
```

⸻

## 📁 Structure

```
RA-Treatment-Ordinal-Regression/
├── data/        # built-in Arthritis dataset (no files)
├── scripts/     # R scripts for analysis
├── reports/     # PDF report and figures
└── README.md
```

⸻

## 🧩 Skills

```
• Ordinal logistic regression modeling & interpretation
• Exploratory data analysis & visualization
• Clinical & business-oriented reporting
• Reproducible analysis in R
```

⸻

👤 Author - Jinxi Zhang
