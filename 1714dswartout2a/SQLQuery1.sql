-- Donavon Swartout
-- Exercise 2A: 2-table queries
-- PropertyManager db

-- 2A.1) Building, Apartment tables, Sort by BuildingId, ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

-- 2A.2)
