-- Donavon Swartout
-- Exercise 2C: Summary queries, groups, joins
-- PropertyManger db

-- 2C.1)
SELECT        State, City, COUNT(BuildingId) AS Expr1
FROM            Building
GROUP BY State, City

-- 2C.2)
SELECT        City, COUNT(BuildingId) AS Expr1
FROM            Building
WHERE        (State = N'MN')
GROUP BY City

-- 2C.3)
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS Expr1
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

-- 2C.4)
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS Expr1
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')

-- 2C.5)
SELECT        Building.City, MIN(Apartment.Rent) AS Expr1
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

-- 2C.6)
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Average Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona') AND (Apartment.TenantId IS NULL)
GROUP BY Building.BuildingName

-- 2C.7)
SELECT        MIN(LineItem.Amount) AS [Cheapest Garage Sep2018]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))

-- 2C.8)
SELECT        Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amount]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))
GROUP BY Invoice.InvoiceId