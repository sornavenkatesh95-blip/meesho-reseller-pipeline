SELECT 
    STRFTIME('%Y-%m', o.order_date) AS month_code,
    CASE STRFTIME('%m', o.order_date)
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
    END AS month,
    o.category,
    ROUND(SUM(o.quantity * o.unit_price), 2) AS revenue,
    COUNT(*) AS n_orders
FROM orders o
GROUP BY month, o.category
ORDER BY STRFTIME('%m', o.order_date) ASC, o.category ASC;

SELECT 
    r.region,
    ROUND(SUM(o.quantity * o.unit_price), 2) AS total_revenue,
    COUNT(o.order_id) AS order_count
FROM resellers r
LEFT JOIN orders o ON r.reseller_id = o.reseller_id
GROUP BY r.region
ORDER BY total_revenue DESC;
