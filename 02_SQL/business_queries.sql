-- Query 1: Top 10 Products by Revenue

SELECT
    p.product_name,
    SUM(s.revenue) AS total_revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 2: Top 10 Doctors by Prescription Volume

SELECT
    d.doctor_name,
    d.specialization,
    SUM(p.prescription_count) AS total_prescriptions
FROM prescriptions p
JOIN doctors d
ON p.doctor_id = d.doctor_id
GROUP BY d.doctor_name, d.specialization
ORDER BY total_prescriptions DESC
LIMIT 10;

-- Query 3: Top 10 Medical Representatives by Revenue

SELECT
    m.mr_name,
    m.region,
    SUM(s.revenue) AS total_revenue
FROM sales s
JOIN medical_reps m
ON s.mr_id = m.mr_id
GROUP BY m.mr_name, m.region
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 4: Monthly Revenue Trend

SELECT
    substr(sale_date,1,7) AS month,
    ROUND(SUM(revenue),2) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Query 5: Territory Performance Analysis

SELECT
    m.region,
    ROUND(SUM(s.revenue),2) AS total_revenue
FROM sales s
JOIN medical_reps m
ON s.mr_id = m.mr_id
GROUP BY m.region
ORDER BY total_revenue DESC;

-- Query 6: Prescription vs Sales Analysis

SELECT
    d.specialization,
    SUM(p.prescription_count) AS total_prescriptions,
    ROUND(SUM(s.revenue),2) AS total_revenue
FROM prescriptions p
JOIN doctors d
ON p.doctor_id = d.doctor_id
JOIN sales s
ON p.product_id = s.product_id
GROUP BY d.specialization
ORDER BY total_revenue DESC;
