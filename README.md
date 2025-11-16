# 📊 Global Sales Data Analysis with Power BI

This project is an end-to-end exploration of **global sales performance**, using **Power BI** to analyze revenue trends, product categories, customer segments, returns, and regional opportunities. As a complete case study, it demonstrates the transformation of raw transactional sales data into meaningful insights that support strategic decision-making.

---

### ❓ Problem Statements

The main objective of this case study was to answer key business questions across product, customer, and regional dimensions. These insights help stakeholders understand performance drivers and areas of improvement.

* Which **products and categories** generate the highest revenue and profit?  
* Which **regions, countries, and territories** drive the most sales?  
* How significant are **returns**, and which products have the highest return rates?  
* Which **customer demographics** (income, education, gender) contribute most to revenue?  
* How have **MTD, QTD, and YTD** revenues changed over time?  
* What are the patterns in **weekday vs weekend** performance?  
* Which metrics demonstrate **rolling trends** (10-day, 90-day, and 12-month windows)?

---

### 🛠️ Tools & Technologies

* **Power BI:** Used for cleaning, modeling, and visualization  
  * `Power Query Editor`: Data cleaning, type correction, metadata prep  
  * `DAX`: 30+ measures including time intelligence, rolling windows, Top-N ranking, contribution metrics  
  * `Visualizations`: Interactive charts, drill-down hierarchies, slicer sync, bookmarks  
* **JSON Theme Files**: Custom minimal light and dark modes for consistent UI/UX  

---

### 🧠 Approach

1. **Data Cleaning and Transformation (Power Query Editor):**  
   * Standardized data types, removed duplicates, and cleaned categorical fields  
   * Structured tables for Calendar, Products, Customers, Territories, and Returns  

2. **Data Modeling (Star Schema):**  
   * Fact table: Sales  
   * Dimensions: Calendar, Customers, Products, Subcategories, Categories, Territories  
   * Ensured unidirectional filtering for performance  
   * Marked Calendar as a **date table**  

3. **DAX Development:**  
   * Created core revenue/quantity/profit measures  
   * Built advanced calculations:
     - Time Intelligence (MTD, QTD, YTD, YoY)  
     - Rolling metrics (10-day, 90-day, R12)  
     - Customer insights (AOV, repeat purchase rate)  
     - Contribution % and Top-N dynamic ranking  
   * Added dynamic titles and context-aware calculations for storytelling  

4. **Dashboard Design & Visualization:**  
   * Five-page interactive dashboard:
     - Executive Summary  
     - Product Performance  
     - Customer Insights  
     - Territory Insights  
     - Time Intelligence  
   * Slicers synced across pages  
   * Drillthrough and tooltip report pages added  
   * Clean layout using a custom minimal theme  

5. **Data Storytelling:**  
   * Each page crafted to answer a clear set of business questions  
   * Logical flow from summary → deep dives → trends  
   * Visual hierarchy ensures insights are immediately interpretable  

---

### 📈 Key Insights & Findings

* **Top Products:** A small number of SKUs drive the majority of total revenue.  
* **High Return Categories:** Certain product groups show significantly higher return rates.  
* **Regional Trends:** APAC and EMEA regions stand out with consistent growth patterns.  
* **Customer Segments:** Higher-income customers show greater average order values.  
* **Rolling Performance:** R12 revenue highlights long-term stability across certain regions.  
* **Weekday vs Weekend:** Weekday performance consistently outperforms weekend revenue.  

---

## 🧑‍💼 About Me

I'm **Soumya Upadhyay**, a Programmatic Analyst transitioning into Data Analytics.  
This project showcases my ability to model complex data, write optimized DAX, and create clean, user-focused dashboards.

📍 IPG Mediabrands | 📚 Specializing in BI & Analytics (SQL, Python, Power BI)  
🌍 Seeking Roles: Data Analyst | Business Analyst | BI Analyst (Singapore / Dubai / Gurgaon)

---

## 🔗 Let’s Connect

- [LinkedIn](https://linkedin.com/in/soumyachanderupadhyay)  
- [GitHub Portfolio](https://github.com/soumya-upadhyay)  
- [Email](mailto:soumya.upadhyay19@gmail.com)

If you have feedback, suggestions, or want to collaborate—feel free to reach out!
