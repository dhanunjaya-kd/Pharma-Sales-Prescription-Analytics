CREATE DATABASE pharma_analytics;

USE pharma_analytics;

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    hospital VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE medical_reps (
    mr_id INT PRIMARY KEY,
    mr_name VARCHAR(100),
    region VARCHAR(50),
    experience_years INT,
    joining_date DATE
);

CREATE TABLE sales (
    sales_id INT PRIMARY KEY,
    sale_date DATE,
    mr_id INT,
    doctor_id INT,
    product_id INT,
    units_sold INT,
    revenue DECIMAL(12,2),
    territory VARCHAR(50)
);

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    prescription_date DATE,
    doctor_id INT,
    product_id INT,
    prescription_count INT
);