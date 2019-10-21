-- Donavon Swartout
-- Exercise 2B: Summary Queries
-- PropertyManager db

-- 2B.1)
SELECT        COUNT(BuildingId) AS Expr1
FROM            Building

-- 2B.2)
SELECT        COUNT(BuildingId) AS Expr1
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

-- 2B.3)
SELECT        AVG(Rent) AS Expr1
FROM            Apartment

-- 2B.4)
SELECT        SUM(Rent) AS Expr1
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

-- 2B.5)
SELECT        MIN(Rent) AS Expr1
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

-- 2B.6)
SELECT        MIN(SquareFeet) AS Expr1, AVG(SquareFeet) AS Expr2, MAX(SquareFeet) AS Expr3
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

-- 2B.7)
SELECT        MIN(Amount) AS Expr1
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

-- 2B.8)
SELECT        SUM(Amount) AS Expr1
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

-- 2B.9)
SELECT        SUM(Amount) AS [Total October Rent]
FROM            LineItem
GROUP BY Description
HAVING        (Description LIKE N'%October%')