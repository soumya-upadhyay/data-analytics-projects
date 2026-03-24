# 🏬 Retail Sales & Customer Behavior Analysis (SQL Case Study)

This project analyzes a retail dataset using SQL to uncover insights related to **sales performance, customer behavior, product trends, and data quality issues**.

The case study goes beyond basic querying by incorporating **data cleaning, transformation, and segmentation**, simulating a real-world data analytics workflow.

---

# 🔍 Business Problem

The retail company is experiencing **stagnant growth and declining customer engagement**. Initial observations suggest:

- Variability in product performance  
- Lack of effective customer segmentation  
- Limited understanding of customer purchasing behavior  

The goal of this project is to leverage SQL to extract insights that can improve **marketing strategies, inventory planning, and customer retention**.

---

# 🎯 Objectives

- Clean and prepare raw transactional data for analysis  
- Identify high-performing and low-performing products  
- Segment customers based on purchasing behavior  
- Analyze sales trends and growth patterns  
- Generate insights to improve business decision-making  

---

# 🗂 Dataset Description

The dataset consists of three key tables:

### Sales Transaction
- TransactionID  
- CustomerID  
- ProductID  
- QuantityPurchased  
- TransactionDate  
- Price  

### Customer Profiles
- CustomerID  
- Age  
- Gender  
- Location  
- JoinDate  

### Product Inventory
- ProductID  
- ProductName  
- Category  
- StockLevel  
- Price  

---

# 🧠 Analytical Approach

## 1️⃣ Data Cleaning

Performed multiple data cleaning operations:

- Removed duplicate transactions  
- Corrected mismatched product prices  
- Replaced NULL values with 'Unknown'  
- Converted date fields from text to proper date format  

---

## 2️⃣ Sales Performance Analysis

- Calculated total sales and units sold per product  
- Identified top 10 high-revenue products  
- Identified low-performing products  

---

## 3️⃣ Customer Behavior Analysis

- Analyzed purchase frequency per customer  
- Identified:
  - High-frequency, high-value customers  
  - Occasional/low-frequency customers  
- Analyzed repeat purchases across products  

---

## 4️⃣ Category-Level Insights

- Evaluated product category performance  
- Compared total sales and units sold across categories  
- Identified categories needing marketing focus  

---

## 5️⃣ Sales Trend Analysis

- Analyzed daily and monthly sales trends  
- Calculated month-on-month growth rate using **window functions (LAG)**  
- Identified patterns in revenue fluctuations  

---

## 6️⃣ Customer Segmentation

Customers were segmented based on total quantity purchased:

| Total Quantity | Segment |
|---------------|--------|
| 0             | No Orders |
| 1–10          | Low |
| 11–30         | Medium |
| >30           | High Value |

This segmentation helps target customers for **personalized marketing strategies**.

---

# 📊 Key Insights

- A small group of customers contributes disproportionately to total revenue  
- Several products show **low sales volume**, indicating potential inventory inefficiencies  
- Certain categories outperform others, suggesting **focused marketing opportunities**  
- Sales trends show **fluctuations rather than steady growth**, indicating inconsistent demand  
- Data inconsistencies (duplicates, incorrect pricing, null values) highlight the importance of **data cleaning before analysis**

---

# 📌 Strategic Recommendations

- Focus retention strategies on **high-value customers**  
- Improve visibility and promotion for **low-performing products**  
- Optimize inventory for **high-demand products**  
- Use customer segmentation for **targeted marketing campaigns**  
- Implement stronger **data validation processes** to avoid inconsistencies  

---

# 🧰 SQL Skills Demonstrated

- Data Cleaning (UPDATE, DELETE, CREATE TABLE)
- Aggregations (`SUM`, `COUNT`)
- Joins (`INNER JOIN`, `LEFT JOIN`)
- Subqueries
- Window Functions (`LAG`)
- CTEs (Common Table Expressions)
- Date Transformation (`STR_TO_DATE`, `DATE_FORMAT`)
- Customer Segmentation using `CASE WHEN`

---

# 🧑‍💼 About Me

I’m **Soumya Upadhyay**, a Programmatic Analyst transitioning into Data Analytics.

This project demonstrates my ability to:

- Clean and transform raw data using SQL  
- Perform end-to-end data analysis  
- Translate business problems into analytical queries  
- Generate actionable insights  

📍 Currently: IPG Mediabrands  
📚 Learning: SQL, Python, Power BI  
🌍 Seeking: Data Analyst roles  

---

# 🔗 Let’s Connect

- LinkedIn: https://linkedin.com/in/soumyachanderupadhyay  
- GitHub: https://github.com/soumya-upadhyay  
- Email: soumya.upadhyay19@gmail.com  

If you found this project useful or have feedback, feel free to connect!
