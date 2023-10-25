USE dwlatihan;


# Star schema *
SELECT * FROM customer;

SELECT * FROM product;

SELECT * FROM supplier;

SELECT * FROM orders;

SELECT * FROM orderitem;

SELECT
    CONCAT(customer.FirstName, ' ' , customer.LastName) AS nama,
    customer.city AS kota, orders.OrderNumber, orders.OrderDate, product.ProductName
FROM customer
    INNER JOIN orders ON customer.Id=orders.CustomerId
    INNER JOIN orderitem ON orders.Id=orderitem.OrderId
    INNER JOIN product ON product.Id=orderitem.ProductId;

SELECT month(orders.OrderDate) AS bulan,
       year(orders.OrderDate) AS tahun,orders.OrderNumber, orders.OrderDate,
       sum(orders.TotalAmount) AS totalorder
FROM orders
         INNER JOIN orderitem ON orders.Id=orderitem.OrderId
         INNER JOIN product ON product.Id=orderitem.ProductId
GROUP BY orders.OrderNumber
ORDER BY orders.OrderNumber;

SELECT customer.Country as negara,
       SUM(orders.TotalAmount) as totalorder
FROM customer INNER JOIN orders ON customer.Id=orders.CustomerId
GROUP BY customer.Country
ORDER BY totalorder;

# Skema: Ingin menampilkan data customer, nama barang yang dibeli, quantity, dan total harga.

SELECT
    CONCAT(customer.FirstName, ' ' , customer.LastName) AS nama,
    product.ProductName AS nama_produk, orderitem.Quantity AS kuantitas,
    orderitem.UnitPrice AS harga_per_unit,
    orderitem.Quantity * orderitem.UnitPrice AS totalharga
FROM customer
    INNER JOIN orders ON customer.Id=orders.CustomerId
    INNER JOIN orderitem ON orders.Id=orderitem.OrderId
    INNER JOIN product ON orderitem.ProductId = product.Id
ORDER BY totalharga DESC
LIMIT 10;



