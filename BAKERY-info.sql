-- Lab 5 - BAKERY
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `BAKERY`;
-- Q1
SELECT r.SaleDate, c.FirstName, c.LastName
FROM items AS i1, goods AS g1,
    items AS i2, goods AS g2,
    receipts AS r, customers AS c
WHERE r.Customer = c.CId
    AND i1.Item = g1.GId AND i2.Item = g2.GId
    AND i1.Receipt = r.RNumber
    AND i1.Receipt = i2.Receipt
    AND i1.Ordinal != i2.Ordinal
    AND g1.Flavor = 'Tuile'
    AND g1.Food = 'Cookie'
    AND g2.Food = 'Cookie'
ORDER BY r.SaleDate;


USE `BAKERY`;
-- Q2
SELECT DISTINCT r.SaleDate
FROM customers AS c, receipts AS r, items AS i, goods AS g
WHERE r.Customer = c.CId
    AND i.Receipt = r.RNumber
    AND i.Item = g.GId
    AND ((c.FirstName = 'SHARRON' AND c.LastName = 'TOUSSAND'
            AND i.Ordinal = 5)  -- ordinal 5 means 5 items purchased
        OR (g.Flavor = 'Gongolais' AND g.Food = 'Cookie'))
ORDER BY r.SaleDate;


USE `BAKERY`;
-- Q3
SELECT SUM(g.Price) AS TotalSpent
FROM items AS i, receipts AS r, goods AS g, customers AS c
WHERE i.Receipt = r.RNumber
    AND i.Item = g.GId
    AND r.Customer = c.CId
    AND c.FirstName = 'JULIET' AND c.LastName = 'LOGAN'
    AND r.SaleDate >= '2007-10-01' AND r.SaleDate <= '2007-10-10';


USE `BAKERY`;
-- Q4
SELECT COUNT(DISTINCT r.RNumber) AS CakePurchases
FROM items AS i, receipts AS r, goods AS g
WHERE i.Receipt = r.RNumber
    AND i.Item = g.GId
    AND g.Food = 'Cake';


USE `BAKERY`;
-- Q5
SELECT COUNT(i.Item)
FROM items AS i, receipts AS r, goods AS g
WHERE i.Item = g.GId
    AND i.Receipt = r.RNumber
    AND g.Food = 'Cake';
