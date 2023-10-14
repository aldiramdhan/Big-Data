# LEFT JOIN

# Menggabungkan dua tabel dengan menggunakan LEFT JOIN
SELECT
    customers.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers
LEFT JOIN orders ON
    orders.customerNumber = customers.customerNumber;

SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber;

SELECT
    customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers
LEFT JOIN orders USING (customerNumber);

# Menemukkan

SELECT
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.status
FROM
    customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;

# Menggabungkan 3 tabel dengan menggunakan left join

SELECT
    lastName,
    firstName,
    customerName,
    checkNumber,
    amount
FROM
    employees
LEFT JOIN customers ON
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON
    payments.customerNumber = customers.customerNumber
ORDER BY
    customerName,
    checkNumber;

# Kondisi dalam klausa WHERE vs klausa ON

SELECT
    o.orderNumber,
    customerNumber,
    productCode
FROM
    orders o
LEFT JOIN orderDetails
    USING (orderNumber)
WHERE
    orderNumber = 10123;

SELECT
    o.orderNumber,
    customerNumber,
    productCode
FROM
    orders o
LEFT JOIN orderDetails d
    ON o.orderNumber = d.orderNumber AND
       o.orderNumber = 10123;