# RIGHT JOIN

# Contoh Sederhana RIGHT JOIN
SELECT
    employeeNumber,
    customerNumber
FROM
    customers
RIGHT JOIN employees
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY
    employeeNumber;

# Menggunaan RIGHT JOIN untuk menemukan baris yang tidak cocok
SELECT
    employeeNumber,
    customerNumber
FROM
    customers
RIGHT JOIN employees ON
        salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;