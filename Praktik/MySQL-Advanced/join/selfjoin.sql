# SELF JOIN

# Menggunakan INNER JOIN clause
SELECT
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON
    m.employeeNumber = e.reportsTo
ORDER BY
    Manager;

# Menggunakan LEFT JOIN clause
SELECT
    IFNULL(CONCAT(m.lastname, ', ', m.firstname), 'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON
    m.employeeNumber = e.reportsto
ORDER BY
    manager DESC;

# Menggunakan SELF JOIN untuk membandingkan baris yang berurutan
SELECT
    c1.city,
    c1.customerName,
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY
    c1.city;