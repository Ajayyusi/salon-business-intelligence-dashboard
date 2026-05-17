-- Salon Business Intelligence Dashboard SQL Examples

-- Monthly Revenue
SELECT 
    DATE_FORMAT(appointment_date, '%Y-%m') AS month,
    SUM(revenue) AS total_revenue
FROM appointments
GROUP BY month
ORDER BY month;

-- Revenue by Service
SELECT 
    service,
    COUNT(appointment_id) AS bookings,
    SUM(revenue) AS total_revenue
FROM appointments
GROUP BY service
ORDER BY total_revenue DESC;

-- Returning Customer Rate
SELECT 
    ROUND(
        COUNT(CASE WHEN visit_count > 1 THEN customer_id END) * 100.0 / COUNT(customer_id), 
        2
    ) AS returning_customer_rate
FROM (
    SELECT customer_id, COUNT(*) AS visit_count
    FROM appointments
    GROUP BY customer_id
) customer_visits;

-- Expenses by Category
SELECT 
    category,
    SUM(amount) AS total_expense
FROM expenses
GROUP BY category
ORDER BY total_expense DESC;
