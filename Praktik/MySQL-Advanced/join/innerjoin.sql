# INNER JOIN

SELECT
    productCode,
    productName,
    textDescription
FROM
    products t1
INNER JOIN  productlines t2
    ON t1.productline = t2.productLine;


SELECT
    productCode,
    productName,
    textDescription
FROM
    products
        INNER JOIN productlines USING (productLine);


# MySQL INNER JOIN dengan contoh klausa GROUP BY

SELECT
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
        INNER JOIN orderdetails t2
                   ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;


SELECT
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
        INNER JOIN orderdetails USING(orderNumber)
GROUP BY orderNumber;


# MySQL INNER JOIN – gabungkan tiga tabel contoh

SELECT
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
        INNER JOIN
    orderdetails USING (orderNumber)
        INNER JOIN
    products USING (productCode)
ORDER BY
    orderNumber,
    orderLineNumber;


# MySQL INNER JOIN – gabungkan empat tabel contoh

SELECT
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
        INNER JOIN orderdetails
                   USING (orderNumber)
        INNER JOIN products
                   USING (productCode)
        INNER JOIN customers
                   USING (customerNumber)
ORDER BY
    orderNumber,
    orderLineNumber;


# MySQL INNER JOIN menggunakan operator lain

SELECT
    orderNumber,
    productName,
    msrp,
    priceEach
FROM
    products p
    INNER JOIN orderdetails o
    ON p.productcode = o.productcode
    AND p.msrp > o.priceEach
WHERE
        p.productcode = 'S10_1678';