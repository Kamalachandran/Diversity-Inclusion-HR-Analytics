# Diversity and Inclusion Data Analytics Project

Unlocking insights to foster equitable workplaces using **Excel, SQL, Python, and Power BI**.

---

## 📌 Project Overview
This project focuses on analyzing workforce **diversity and inclusion** to identify gaps and provide actionable, data-driven recommendations for creating fair and equitable workplaces.

### Objectives
- **Workforce Analysis**: Assess current diversity and inclusion metrics.  
- **Identify Gaps**: Detect disparities in hiring, promotion, turnover, and performance.  
- **Data-Driven Recommendations**: Offer strategic improvements to HR practices.  

---

## 🛠 Tools & Technologies
- **Excel** → Data cleaning, handling nulls, duplicates, and standardizing categorical values.  
- **SQL** → Querying large employee datasets, extracting key workforce metrics.  
- **Python** → Advanced data processing, statistical modeling, visualization.  
- **Power BI** → Interactive dashboards and visual storytelling.  

---

## 📊 Key Analyses & Insights

### Excel
- Handled missing values (imputation/removal).  
- Removed duplicate records.  
- Standardized categorical fields (e.g., gender values: `M → Male`, `F → Female`).  

### SQL
- **Promotions by Gender**:
  ```sql
  SELECT Gender, COUNT(Employee_ID) AS No_of_Employees
  FROM Promotion
  GROUP BY Gender;
  ```

- **Performance Rating Trends by Job Level**:
  ```sql
  SELECT Job_Level_after_FY20_promotions AS Job_Level,
         CONCAT(ROUND(AVG(FY19_Performance_Rating), 2), '%') AS Avg_FY19_Performance,
         CONCAT(ROUND(AVG(FY20_Performance_Rating), 2), '%') AS Avg_FY20_Performance,
         CONCAT(ROUND(AVG(FY20_Performance_Rating) - AVG(FY19_Performance_Rating), 2), '%') AS Rating_Change
  FROM Promotion
  GROUP BY Job_Level_after_FY20_promotions
  ORDER BY Job_Level_after_FY20_promotions;
  ```

- **Employee Distribution by Performance Rating (FY20)**:
  ```sql
  SELECT FY20_Performance_Rating,
         COUNT(Employee_ID) AS Employee
  FROM Promotion
  GROUP BY FY20_Performance_Rating
  ORDER BY FY20_Performance_Rating;
  ```
  🔎 Insight: Equal number of employees (19 each) received performance ratings **1** and **4**.  

### Python
- **Gender Distribution**: Count plots of employees by gender.  
- **Employees by Department & Gender**: Visualization of departmental diversity.  

### Promotion Trends (2011–2020)
- 📉 **Decline (2011–2014)**: Drop from 47 to 27 promotions.  
- 📈 **Growth (2015–2017)**: Peak at 90 promotions in 2017.  
- 📉 **Sharp Decline (2018–2019)**: Down to 33 promotions.  
- 📈 **Recovery (2020)**: Rise to 66 promotions.  

---

## 📌 Power BI Dashboard
Developed interactive dashboards to visualize:  
- Employee demographics  
- Departmental representation  
- Promotion trends  
- Performance insights  

---

## 📂 Repository Structure
```
├── data/                 # Raw and cleaned datasets
├── sql/                  # SQL queries
├── notebooks/            # Python Jupyter notebooks
├── powerbi/              # Power BI files/screenshots
├── presentation/         # Project presentation slides
└── README.md             # Project documentation
```

---

## 🚀 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/diversity-inclusion-analytics.git
   ```
2. Navigate to the project folder:
   ```bash
   cd diversity-inclusion-analytics
   ```
3. Explore:
   - `data/` → datasets  
   - `sql/` → queries  
   - `notebooks/` → Python scripts & visualizations  
   - `powerbi/` → dashboards  

---

## 📈 Results
- Clear identification of promotion and performance disparities.  
- Actionable insights for HR teams to improve diversity and inclusion.  
- Compelling dashboards for leadership decision-making.  

---

## 🙌 Acknowledgements
Special thanks to open-source tools and libraries:  
**Pandas, Matplotlib, Seaborn, SQL, Power BI**.  

---

## 📧 Contact
For questions or collaboration:  
**Your Name** – [your.email@example.com]  
