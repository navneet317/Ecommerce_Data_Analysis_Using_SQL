SELECT * FROM zepto_project.new_table;

drop table if  exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
MRP Numeric(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
OutOfStock BOOLEAN,
Quantity INTEGER
);

-- data exploration

Select * from zepto_v2;

-- data check
SELECT 
    COUNT(*)
FROM
    zepto_v2;
-- sample data
SELECT 
    *
FROM
    zepto_v2
LIMIT 10;

-- null values
SELECT 
    *
FROM
    zepto_v2
WHERE
    name IS NULL OR category IS NULL
        OR mrp IS NULL
        OR discountPercent IS NULL
        OR discountedSellingPrice IS NULL
        OR availableQuantity IS NULL
        OR outOfStock IS NULL
        OR quantity IS NULL;
        
-- different product categories
SELECT DISTINCT
    category
FROM
    zepto_v2
ORDER BY category;

-- products in stock vs out of stock

SELECT
sku_id,
name,
Quantity,
CASE
    WHEN OutOfStock = TRUE THEN 'Out Of Stock'
    ELSE 'In Stock'
END AS Stock_Status
FROM zepto_v2;

select * from zepto_v2;

ALTER TABLE zepto_v2
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY;

DESCRIBE zepto_v2;

select outOfStock, count(sku_id) from zepto_v2
group by outOfStock;

-- product names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto_v2
group by name
having count(sku_id) > 1
Order by Count(sku_id) DESC;

-- data cleaning
-- products with price = 0
select * from zepto_v2 where mrp = 0 or discountedSellingPrice = 0;

DELETE FROM zepto_v2
WHERE sku_id IN (
    SELECT sku_id
    FROM (
        SELECT sku_id
        FROM zepto_v2
        WHERE mrp = 0
    ) temp
);

-- convert paise to rupees
UPDATE zepto_v2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0
WHERE sku_id > 0;

select mrp, discountedSellingPrice from zepto_v2;

-- Q1 : find the top 10 best value products based on the discount percentage.
		SELECT 
    distinct name, mrp, discountPercent
FROM
    zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;
        
-- Q2 : What are the products with high MRP but Out Of Stock.

select name, mrp from zepto_v2 where outOfStock = 'TRUE' and mrp > 300
order by mrp desc;

-- Q3 :Calculated Estimated revenue for each category.
SELECT
Category,
SUM(discountedSellingPrice * quantity) AS estimated_revenue
FROM zepto_v2
GROUP BY Category
ORDER BY estimated_revenue DESC;

-- Q4 :Find all the products where MRP is greater than Rs.500 and discount is less than 10%.
SELECT
name,
mrp,
discountPercent
FROM zepto_v2
WHERE mrp > 500
AND discountPercent < 10;

-- Q5 :Identify the top 5 categories offering the highest average discount percentage.

SELECT
Category,
AVG(discountPercent)
AS avg_discount
FROM zepto_v2
GROUP BY Category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6 :Find the price per gram for products above 100g and sort best value.

SELECT
name,
weightInGms,
discountedSellingPrice,
discountedSellingPrice / weightInGms
AS price_per_gram
FROM zepto_v2
WHERE weightInGms >100
ORDER BY price_per_gram ASC;

-- Q7 :Group the products into categories like Low, Medium, Bulk.

SELECT
name,
weightInGms,
CASE
WHEN weightInGms <500
THEN 'Low'
WHEN weightInGms BETWEEN 500 AND 2000
THEN 'Medium'
ELSE 'Bulk'
END AS product_category
FROM zepto_v2;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
