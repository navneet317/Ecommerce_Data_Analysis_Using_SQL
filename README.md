# SQL Data Analysis Project – Zepto E-commerce Inventory Dataset

## Project Overview

This project simulates how data analysts work with real-world e-commerce inventory data using SQL. The objective is to transform raw inventory data into actionable business insights through structured analysis, cleaning, and exploratory investigation.

The project focuses on building practical SQL skills commonly used in analytics roles, including data cleaning, business analysis, inventory analytics, pricing analysis, and revenue estimation.


## Dataset Overview

The dataset was sourced from Kaggle and contains inventory-level product information scraped from Zepto's product catalog.

Each record represents a unique product SKU containing information about product pricing, discounts, availability, inventory levels, and product attributes.

### Dataset Columns

* **sku_id** → Unique identifier for each product entry
* **name** → Product name
* **category** → Product category
* **mrp** → Maximum Retail Price (converted from paise to ₹)
* **discountPercent** → Discount percentage offered
* **discountedSellingPrice** → Final selling price after discounts
* **availableQuantity** → Available inventory quantity
* **weightInGms** → Product weight in grams
* **outOfStock** → Product availability status
* **quantity** → Units available per package


## Project Workflow

### 1. Database Setup

Created database tables with structured schemas and appropriate SQL data types.

### 2. Data Import

Imported raw CSV data into MySQL and resolved encoding issues to ensure proper ingestion.

### 3. Exploratory Data Analysis (EDA)

Performed exploratory analysis to understand:

* Dataset size and structure
* Product categories and distribution
* Stock availability patterns
* Duplicate product appearances across SKUs
* Missing or inconsistent values

### 4. Data Cleaning

Prepared the dataset for analysis by:

* Removing invalid pricing records
* Handling inconsistent values
* Converting pricing values into business-readable formats
* Standardizing inventory information

### 5. Business Analysis & Insights

Generated business-driven insights including:

* Revenue estimation by category
* Discount analysis across product groups
* Identification of high-value out-of-stock products
* Price-per-gram analysis for value optimization
* Category-level inventory analysis
* Product segmentation based on package sizes
* Inventory weight analysis across categories

---

## Key SQL Concepts Used

* SELECT, WHERE, ORDER BY
* GROUP BY, HAVING
* Aggregate Functions (SUM, AVG, COUNT)
* CASE WHEN Statements
* Data Cleaning Operations
* Filtering and Sorting Techniques
* Business KPI Calculations

---

## How to Use

### Clone Repository

```bash
git clone <repository-url>
cd <repository-name>
```

### Steps

1. Create a MYSQL database
2. Run the SQL file to create tables and analysis queries
3. Import the dataset into MYSQL / MYSQL
4. Execute analysis queries to reproduce insights

---

## Project Outcome

This project demonstrates practical SQL skills used by entry-level data analysts to work with messy business datasets, clean data pipelines, and generate decision-oriented insights from real-world inventory data.
