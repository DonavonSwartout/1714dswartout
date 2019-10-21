-- Donavon Swartout
-- Exercise 2A: 2-table queries
-- PropertyManager db

-- 2A.1)
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

-- 2A.2)
SELECT        Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC

-- 2A.3)
SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC

-- 2A.4)
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate

-- 2A.5)
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum

-- 2A.6)
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFirstName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Apartment.BuildingId, TenantLastName, TenantFirstName

-- 2A.7)
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

-- 2A.8)
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Garage') OR (LineItem.Description LIKE N'Rent%')
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

-- 2A.9)
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceId