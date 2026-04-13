# 📊 OCD Patient Data Analysis (SQL Project)

## 📌 Project Overview
This project performs an in-depth analysis of OCD (Obsessive-Compulsive Disorder) patient data using SQL. The goal is to uncover patterns in patient demographics, symptom severity, and behavioral trends to derive meaningful insights.

---

## 🧰 Tools & Technologies
- MySQL
- SQL (CTEs, Aggregations, Group By, Data Cleaning)
- Git & GitHub

---

## 📂 Dataset Description
The dataset contains more than 1000 patients with different level OCD data's with the following fields:
- Patient ID
- Gender
- Age
- OCD Diagnosis Date
- Obsession Type
- Compulsion Type
- Y-BOCS Score (Obsessions)
- Y-BOCS Score (Compulsions)

---

## 🔧 Data Cleaning
- Converted `OCD Diagnosis Date` from string format to DATE format using `STR_TO_DATE`
- Ensured only valid date values were updated

---

## 🔍 Key Analyses Performed

### 1. Gender-Based Analysis
- Count of patients by gender
- Average obsession score per gender
- Percentage distribution of patients

---

### 2. Monthly Trend Analysis
- Number of patients diagnosed per month
- Identifies trends in OCD diagnosis over time

---

### 3. Obsession Type Analysis
- Most common obsession type
- Average obsession score for that type

---

### 4. Compulsion Type Analysis
- Most common compulsion type
- Average compulsion score

---

### 5. Age Group Analysis
Patients categorized into:
- Child (<18)
- Young Adult (18–30)
- Adult (31–50)
- Senior (50+)

Analyzed:
- Patient distribution
- Average obsession scores per group

---

### 6. High-Risk Patient Identification
- Patients with Y-BOCS score > 25
- Percentage of high-risk patients in dataset

---

### 7. Obsession vs Compulsion Cross Analysis
- Relationship between obsession types and compulsion types
- Most frequent combinations identified

---

## 📈 Key Insights
- Gender-based differences in OCD severity were observed
- Certain obsession and compulsion types are significantly more common
- A subset of patients falls into high-risk category based on severity scores
- Age plays a role in variation of obsession intensity
- Specific obsession-compulsion patterns occur more frequently

---

## ▶️ How to Run the Project
1. Import the dataset (`ocd_patient.csv`) into MySQL
2. Run the SQL script (`ocd_analysis.sql`)
3. Execute queries to view insights

---

## 📁 Project Structure