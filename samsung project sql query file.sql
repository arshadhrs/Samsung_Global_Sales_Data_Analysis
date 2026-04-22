SELECT
    COUNT(sale_id) AS total_transactions,
    SUM(units_sold) AS total_units_sold,
    ROUND(SUM(revenue_usd), 2) AS total_revenue_usd,
    ROUND(AVG(revenue_usd), 2) AS avg_revenue_per_sale
FROM samsung_sales;

SELECT
    year,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    COUNT(sale_id) AS total_orders
FROM samsung_sales
GROUP BY year
ORDER BY year;

SELECT
    year,
    quarter,
    ROUND(SUM(revenue_usd), 2) AS quarterly_revenue
FROM samsung_sales
GROUP BY year, quarter
ORDER BY year, quarter;

SELECT
    category,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    SUM(units_sold) AS total_units,
    ROUND(AVG(unit_price_usd), 2) AS avg_price
FROM samsung_sales
GROUP BY category
ORDER BY total_revenue DESC;

SELECT
    product_name,
    category,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    SUM(units_sold) AS total_units
FROM samsung_sales
GROUP BY product_name, category
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    is_5g,
    COUNT(*) AS orders,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    ROUND(AVG(unit_price_usd), 2) AS avg_price
FROM samsung_sales
GROUP BY is_5g;

SELECT
    region,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    COUNT(sale_id) AS orders,
    ROUND(AVG(revenue_usd), 2) AS avg_order_value
FROM samsung_sales
GROUP BY region
ORDER BY total_revenue DESC;

SELECT
    country,
    region,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    COUNT(sale_id) AS orders
FROM samsung_sales
GROUP BY country, region
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    country,
    region,
    ROUND(SUM(revenue_usd), 2) AS total_revenue
FROM samsung_sales
GROUP BY country, region
ORDER BY total_revenue ASC
LIMIT 5;

SELECT
    sales_channel,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    COUNT(sale_id) AS orders,
    ROUND(AVG(discount_pct), 2) AS avg_discount
FROM samsung_sales
GROUP BY sales_channel
ORDER BY total_revenue DESC;

SELECT
    customer_segment,
    payment_method,
    COUNT(*) AS orders
FROM samsung_sales
GROUP BY customer_segment, payment_method
ORDER BY customer_segment, orders DESC;


SELECT
    sales_channel,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN return_status = 'Returned' THEN 1 ELSE 0 END) AS returned,
    ROUND(
        SUM(CASE WHEN return_status = 'Returned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS return_rate_pct
FROM samsung_sales
GROUP BY sales_channel
ORDER BY return_rate_pct DESC;

SELECT
    customer_segment,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    ROUND(AVG(customer_rating), 2) AS avg_rating,
    COUNT(sale_id) AS orders
FROM samsung_sales
GROUP BY customer_segment
ORDER BY total_revenue DESC;

SELECT
    customer_age_group,
    category,
    COUNT(*) AS orders,
    ROUND(SUM(revenue_usd), 2) AS total_revenue
FROM samsung_sales
GROUP BY customer_age_group, category
ORDER BY customer_age_group, orders DESC;

SELECT
    previous_device_os,
    category,
    COUNT(*) AS purchases
FROM samsung_sales
WHERE previous_device_os != 'Unknown'
GROUP BY previous_device_os, category
ORDER BY previous_device_os, purchases DESC;

WITH yearly AS (
    SELECT
        category,
        year,
        SUM(revenue_usd) AS revenue
    FROM samsung_sales
    GROUP BY category, year
)
SELECT
    category,
    year,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (PARTITION BY category ORDER BY year)) * 100.0 /
        LAG(revenue) OVER (PARTITION BY category ORDER BY year), 2
    ) AS yoy_growth_pct
FROM yearly
ORDER BY category, year;

WITH monthly AS (
    SELECT
        month,
        month_num,
        SUM(revenue_usd) AS monthly_revenue
    FROM samsung_sales
    WHERE year = 2023
    GROUP BY month, month_num
)
SELECT
    month,
    month_num,
    ROUND(monthly_revenue, 2) AS monthly_revenue,
    ROUND(SUM(monthly_revenue) OVER (ORDER BY month_num), 2) AS running_total
FROM monthly
ORDER BY month_num;

SELECT
    region,
    country,
    ROUND(SUM(revenue_usd), 2) AS revenue,
    RANK() OVER (PARTITION BY region ORDER BY SUM(revenue_usd) DESC) AS rank_in_region
FROM samsung_sales
GROUP BY region, country
ORDER BY region, rank_in_region;

-- Q19. Average discount vs average rating
SELECT
    discount_pct,
    ROUND(AVG(customer_rating), 2) AS avg_rating,
    COUNT(*) AS orders
FROM samsung_sales
GROUP BY discount_pct
ORDER BY discount_pct;

WITH monthly_revenue AS (
    SELECT
        year,
        month,
        month_num,
        ROUND(SUM(revenue_usd), 2) AS revenue
    FROM samsung_sales
    GROUP BY year, month, month_num
),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY year ORDER BY revenue DESC) AS rnk
    FROM monthly_revenue
)
SELECT year, month, revenue
FROM ranked
WHERE rnk = 1
ORDER BY year;