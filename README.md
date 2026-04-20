# 🎮 Video Game Sales Analysis Dashboard

## 📌 Project Overview
This project analyzes 16,000+ video game sales records to uncover trends in platforms, publishers, genres, and regional performance using Excel, SQL, and Power BI.

---

## 🎯 Business Problem
The objective is to identify:
- Top-performing platforms  
- Leading publishers  
- Popular game genres  
- Regional sales trends  

---

## 🛠️ Tools Used
- Microsoft Excel  
- Microsoft SQL Server  
- Microsoft Power BI  

---

## 📂 Dataset
- Source: Kaggle  
- Records: 16,000+  

---

## 🔄 Data Cleaning (Excel)
- Removed duplicates  
- Handled missing values  
- Standardized columns  

---

## 🧠 SQL Analysis

### Example Query:
```sql
SELECT Publisher, SUM(Global_Sales) AS Total_Sales
FROM video_games
GROUP BY Publisher
ORDER BY Total_Sales DESC;
```

---

## 📊 Power BI Dashboard
![Power BI Dashboard](dashboard.png)

---

## 🔍 Key Insights
- Nintendo leads global sales  
- Action genre is most popular  

---

## 🚀 Outcome
End-to-end data analytics project using Excel, SQL, and Power BI.

