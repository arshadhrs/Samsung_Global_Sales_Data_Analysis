📊 Samsung Global Sales Analytics Dashboard

⭐ This project simulates a real-world Data Analyst role — covering data cleaning, analysis, visualization, and predictive modeling.

🚀 Quick Summary

End-to-end data analytics project on Samsung’s global product sales (2021–2024) using Python, SQL, and Power BI. Built a 3-page interactive dashboard and a machine learning model to predict product returns and uncover key business insights.

📊 Dashboard Preview


<img width="893" height="501" alt="dashboard_1" src="https://github.com/user-attachments/assets/d14eb729-602f-48ac-9de0-c91ce56e4ce5" />


<img width="895" height="502" alt="dashboard_2" src="https://github.com/user-attachments/assets/da9aa3e3-5419-42b7-84ae-0e8f6009eb10" />


<img width="896" height="503" alt="dashboard_3" src="https://github.com/user-attachments/assets/906aa3f2-4798-452c-8300-c04b029e4ff6" />


📌 Project Overview

This project analyzes Samsung’s global sales data to answer a core business question:

"How is Samsung performing globally — what is selling, who is buying it, and can we predict product returns?"

The project covers the complete analytics workflow — from raw data processing to business insights and predictive modeling.

📂 Dataset Information

Property	Details
Source	Kaggle – Samsung Global Product Sales
Period	2021 – 2024
Rows	15,500 transactions
Columns	28 (33 after feature engineering)
Countries	40+
Categories	11 product categories
Channels	7 sales channels
🛠️ Tools & Technologies
Python (Pandas, NumPy) – Data Cleaning & Feature Engineering
Matplotlib, Seaborn – Exploratory Data Analysis
MySQL – SQL Business Insights
Power BI – Interactive Dashboard
Scikit-learn – Machine Learning Model
GitHub – Version Control & Portfolio



📁 Project Structure

samsung-sales-analytics/

│

├── data/

│   ├── samsung_global_sales_dataset.csv

│   └── samsung_cleaned.csv

│

├── python/

│   ├── phase2_data_cleaning.py

│   ├── phase3_eda.py


│   └── phase6_ml.py

│

├── sql/

│   └── phase4_sql_queries.sql

│
├── dashboard/

│   ├── Samsung_Sales_Dashboard.pbix

│   ├── powerbi_guide.md

│   └── screenshots/

│       ├── dashboard_page1.png

│       ├── dashboard_page2.png

│       └── dashboard_page3.png

│

├── outputs/

│   ├── eda_charts.png

│   └── ml_results.png

│

└── README.md




🔄 Project Workflow
Phase 1 – Dataset Understanding
Explored 28 columns across sales, product, and customer data
Identified missing values and class imbalance in returns

Phase 2 – Data Cleaning (Python)
Fixed date formats
Handled missing values using appropriate strategies
Created new features:
Month Number
Revenue Category
Discount Band
Return Flag

Phase 3 – Exploratory Data Analysis
Revenue trends by region, category, and time
Sales channel performance
Return rate analysis
Discount vs customer rating relationship
Customer segmentation insights

Phase 4 – SQL Business Insights
20+ queries using:
GROUP BY
JOINs
Window Functions
CTEs
Extracted insights on revenue trends, customer behavior, and product performance
Phase 5 – Power BI Dashboard

📍 Page 1 – Global Sales Performance
KPIs: Revenue, Orders, Avg Order Value
Revenue by Region & Category
Monthly Trend Analysis
Top 10 Countries

🛒 Page 2 – E-Commerce Analysis
Return Rate, Avg Rating, Discount Analysis
Revenue by Channel
Payment Method Distribution
Discount vs Rating (Scatter Plot)

👥 Page 3 – Customer Intelligence
Revenue by Customer Segment & Age Group
Switcher Analysis (Previous Device OS)
Payment Preference Heatmap
Return Rate by Segment

🤖 Machine Learning Model
Model: Random Forest Classifier
Objective: Predict product returns
Key Features:
Customer Rating
Discount %
Unit Price

Result:
Random Forest (with resampling) achieved very high accuracy (~99%), indicating strong predictive signals. Further validation is required to ensure generalization.

📈 Key Insights
Asia and Europe are top revenue-generating regions
Galaxy S and A series drive the majority of sales
E-commerce channel has the highest order volume
Discounts do not significantly impact customer ratings
Business and Enterprise segments generate higher order value
iOS users switching to Samsung prefer flagship models
Customer rating is the strongest predictor of product returns
Q4 shows consistent seasonal sales spikes

⚙️ How to Run
Install Dependencies
pip install pandas numpy matplotlib seaborn scikit-learn
Run Python Scripts
python phase2_data_cleaning.py
python phase3_eda.py
python phase6_ml.py
SQL
Import cleaned dataset into MySQL
Run queries from phase4_sql_queries.sql
Power BI
Open .pbix file
Update dataset path if required

💼 Resume Highlight
Built an end-to-end data analytics project using Python, SQL, Power BI, and Machine Learning
Developed a 3-page interactive dashboard analyzing global sales, customer behavior, and product performance
Implemented a predictive model to identify product return patterns

👤 Author

Arshad H R

Student

B.Com Business Analytics

LinkedIn: [www.linkedin.com/in/arshad-h-r-17234b369] 

GitHub: [https://github.com/arshadhrs]

Skills: Python · SQL · Power BI · Machine Learning · Excel

📄 License
This project is for educational and portfolio purposes.

📁 Dataset
Samsung Global Product Sales Dataset Source: Data_Set_Size: 15,500 synthetic sales transactions

⚠️ Dataset not included due to size limitations

Dataset sourced from Kaggle (https://www.kaggle.com/datasets/ashyou09/samsung-global-product-sales-dataset).

🚀 Final Note
This project demonstrates strong capabilities in data analysis, business intelligence, and predictive modeling, making it suitable for data analyst roles.

 


