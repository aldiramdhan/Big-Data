/*
    *********************************
    PRAKTIK BIG DATA - MYSQL ADVANCED
    *********************************
*/

# JOINING TABLES

# Table & Column Aliases
SELECT
    CONCAT_WS(' ', lastName, firstname)
FROM
    employees;

SELECT
    CONCAT_WS(', ', lastName, firstname) AS `full name`
FROM
    employees;

SELECT
    CONCAT_WS(' ', lastName, firstname) AS `full name`
FROM
    employees
ORDER BY
    `full name`;

SELECT
    orderNumber `Order no.`,
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
GROUP BY
    `Order no.`
HAVING
        total > 60000;

# MYSQL alias for tables

SELECT
    customerName,
    COUNT(o.orderNumber) total
FROM
    customers c
        INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY
    customerName
ORDER BY
    total DESC;

SELECT
    customerName,
    COUNT(orders.orderNumber) total
FROM
    customers
        INNER JOIN orders ON customers.customerNumber = orders.customerNumber
GROUP BY
    customerName
ORDER BY
    total DESC;

# Menyiapkan tabel sampel (Modul praktikum halaman 12)

CREATE DATABASE IF NOT EXISTS salesdb;

USE salesdb;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(13,2)
);

CREATE TABLE stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100)
);

CREATE TABLE sales (
    product_id INT,
    store_id INT,
    quantity DECIMAL (13, 2) NOT NULL,
    sales_date DATE NOT NULL,
    PRIMARY KEY (product_id, store_id),
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES stores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO products(product_name, price)
VALUES ('iPhone', 699),
       ('iPad', 599),
       ('Macbook Pro', 1299);

INSERT INTO stores(store_name)
VALUES  ('North'),
        ('South');

INSERT INTO sales (store_id, product_id, quantity, sales_date)
VALUES  (1,1,28,'2017-01-02'),
        (1,2,15, '2017-01-05'),
        (1,3,25, '2017-01-05'),
        (2,1,30, '2017-01-02'),
        (2,2,35, '2017-01-05');