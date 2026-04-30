-- 1. Total orders, revenue and AOV by quarters.

SELECT
    CASE
        WHEN order_month IN (1, 2, 3) THEN 'Q1'
        WHEN order_month IN (4, 5, 6) THEN 'Q2'
        WHEN order_month IN (7, 8, 9) THEN 'Q3'
        WHEN order_month IN (10, 11, 12) THEN 'Q4'
    END AS quarter,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(revenue_eur_cleaned) / COUNT(order_id), 2) AS aov_eur
FROM fact_orders
WHERE revenue_eur_cleaned IS NOT NULL
GROUP BY quarter
ORDER BY quarter;

-- 2. Monthly total orders, revenue and AOV.

SELECT
    order_month,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(revenue_eur_cleaned) / COUNT(order_id), 2) AS aov_eur
FROM fact_orders
WHERE revenue_eur_cleaned IS NOT NULL
GROUP BY order_month
ORDER BY order_month;

-- 3. Return rates and total revenue refunded by product category.

SELECT
    p.product_category_cleaned,
    COUNT(o.order_id) AS total_orders,
    SUM(o.is_refunded_cleaned) AS total_returns,
    ROUND(SUM(o.is_refunded_cleaned) * 100.0 / COUNT(o.order_id), 2) AS return_rate_pct,
    ROUND(SUM(CASE WHEN o.is_refunded_cleaned = 1 THEN o.revenue_eur_cleaned ELSE 0 END), 2) AS refunded_revenue_eur
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
GROUP BY p.product_category_cleaned
ORDER BY refunded_revenue_eur DESC;


-- 4. Return rates and total revenue for a whole year.

SELECT
    COUNT(order_id) AS total_orders,
    SUM(is_refunded_cleaned) AS total_returns,
    ROUND(SUM(is_refunded_cleaned) * 100.0 / COUNT(order_id), 2) AS return_rate_pct,
    ROUND(SUM(CASE WHEN is_refunded_cleaned = 1 THEN revenue_eur_cleaned ELSE 0 END), 2) AS total_refunded_revenue_eur
FROM fact_orders
WHERE revenue_eur_cleaned IS NOT NULL;

-- 5. Total orders, revenue and AOV by countries.

SELECT
    country_cleaned,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(revenue_eur_cleaned) / COUNT(order_id), 2) AS aov_eur
FROM fact_orders
WHERE revenue_eur_cleaned IS NOT NULL
    AND country_cleaned IS NOT NULL
GROUP BY country_cleaned
ORDER BY total_revenue_eur DESC;

-- 6. Top SKUs by revenue.

SELECT
    p.SKU,
    p.product_name_cleaned,
    p.product_category_cleaned,
    p.brand_cleaned,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(o.revenue_eur_cleaned) / COUNT(o.order_id), 2) AS aov_eur
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
WHERE o.revenue_eur_cleaned IS NOT NULL
GROUP BY p.SKU, p.product_name_cleaned, p.product_category_cleaned, p.brand_cleaned
ORDER BY total_revenue_eur DESC
LIMIT 10;

-- 7. Top return rates by SKU - minimal orders 10 and minimal return rate 50%.

SELECT
    p.SKU,
    p.product_name_cleaned,
    p.product_category_cleaned,
    o.country_cleaned,
    COUNT(o.order_id) AS total_orders,
    SUM(o.is_refunded_cleaned) AS total_returns,
    ROUND(SUM(o.is_refunded_cleaned) * 100.0 / COUNT(o.order_id), 2) AS return_rate_pct,
    ROUND(SUM(CASE WHEN o.is_refunded_cleaned = 1 THEN o.revenue_eur_cleaned ELSE 0 END), 2) AS refunded_revenue_eur
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
GROUP BY p.SKU, p.product_name_cleaned, p.product_category_cleaned, o.country_cleaned
HAVING COUNT(o.order_id) >= 10
    AND ROUND(SUM(o.is_refunded_cleaned) * 100.0 / COUNT(o.order_id), 2) >= 50
ORDER BY return_rate_pct DESC, refunded_revenue_eur DESC;

-- 8. Total revenue by product categories and their % of total revenue.

SELECT
    p.product_category_cleaned,
    ROUND(SUM(o.revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(o.revenue_eur_cleaned) * 100.0 / SUM(SUM(o.revenue_eur_cleaned)) OVER (), 2) AS revenue_share_pct
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
WHERE o.revenue_eur_cleaned IS NOT NULL
GROUP BY p.product_category_cleaned
ORDER BY total_revenue_eur DESC;

-- 9. Total revenue by quarters for top 3 countries.

SELECT
    o.country_cleaned,
    CASE
        WHEN o.order_month IN (1, 2, 3) THEN 'Q1'
        WHEN o.order_month IN (4, 5, 6) THEN 'Q2'
        WHEN o.order_month IN (7, 8, 9) THEN 'Q3'
        WHEN o.order_month IN (10, 11, 12) THEN 'Q4'
    END AS quarter,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(o.revenue_eur_cleaned) / COUNT(o.order_id), 2) AS aov_eur
FROM fact_orders o
WHERE o.revenue_eur_cleaned IS NOT NULL
    AND o.country_cleaned IN ('DE', 'FR', 'PL')
GROUP BY o.country_cleaned, quarter
ORDER BY o.country_cleaned, quarter;

-- 10. Refund reasons breakdown.

SELECT
    refund_reason_cleaned,
    COUNT(order_id) AS total_returns,
    ROUND(COUNT(order_id) * 100.0 / SUM(COUNT(order_id)) OVER (), 2) AS share_pct
FROM fact_orders
WHERE is_refunded_cleaned = 1
    AND refund_reason_cleaned IS NOT NULL
GROUP BY refund_reason_cleaned
ORDER BY total_returns DESC;

-- 11. Total revenue, orders and AOV by channel.

SELECT
    channel_cleaned,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(revenue_eur_cleaned) / COUNT(order_id), 2) AS aov_eur
FROM fact_orders
WHERE revenue_eur_cleaned IS NOT NULL
GROUP BY channel_cleaned
ORDER BY total_revenue_eur DESC;

-- 12. Total revenue, orders, AOV and return rate by brand.

SELECT
    p.brand_cleaned,
    p.product_category_cleaned,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(o.revenue_eur_cleaned) / COUNT(o.order_id), 2) AS aov_eur,
    ROUND(SUM(o.is_refunded_cleaned) * 100.0 / COUNT(o.order_id), 2) AS return_rate_pct
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
WHERE o.revenue_eur_cleaned IS NOT NULL
GROUP BY p.brand_cleaned, p.product_category_cleaned
ORDER BY total_revenue_eur DESC
LIMIT 20;

-- 13. Return rate by quarter per category.

SELECT
    CASE
        WHEN o.order_month IN (1, 2, 3) THEN 'Q1'
        WHEN o.order_month IN (4, 5, 6) THEN 'Q2'
        WHEN o.order_month IN (7, 8, 9) THEN 'Q3'
        WHEN o.order_month IN (10, 11, 12) THEN 'Q4'
    END AS quarter,
    p.product_category_cleaned,
    COUNT(o.order_id) AS total_orders,
    SUM(o.is_refunded_cleaned) AS total_returns,
    ROUND(SUM(o.is_refunded_cleaned) * 100.0 / COUNT(o.order_id), 2) AS return_rate_pct,
    ROUND(SUM(CASE WHEN o.is_refunded_cleaned = 1 THEN o.revenue_eur_cleaned ELSE 0 END), 2) AS refunded_revenue_eur
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
GROUP BY quarter, p.product_category_cleaned
ORDER BY quarter, refunded_revenue_eur DESC;

-- 14. Total gross margin by product category.

SELECT
    p.product_category_cleaned,
    ROUND(SUM(o.revenue_eur_cleaned), 2) AS total_revenue_eur,
    ROUND(SUM(p.cogs_unit_eur * o.quantity_cleaned), 2) AS total_cogs_eur,
    ROUND(SUM(o.revenue_eur_cleaned) - SUM(p.cogs_unit_eur * o.quantity_cleaned), 2) AS gross_profit_eur,
    ROUND(
        (SUM(o.revenue_eur_cleaned) - SUM(p.cogs_unit_eur * o.quantity_cleaned))
        * 100.0 / SUM(o.revenue_eur_cleaned), 2
    ) AS gross_margin_pct
FROM fact_orders o
JOIN fact_product p ON o.product_id = p.product_id
WHERE o.revenue_eur_cleaned IS NOT NULL
    AND o.is_refunded_cleaned = 0
GROUP BY p.product_category_cleaned
ORDER BY gross_profit_eur DESC;