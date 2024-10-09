-- Select all data from Regions table
SELECT * FROM Regions;

-- Select all data from Ice Cream Van table
SELECT * FROM IceCreamVan;

-- Select all data from Promotions table
SELECT * FROM Promotions;

-- Select all data from Sales table
SELECT * FROM Sales;

-- Select all data from Ice Cream Inventory table
SELECT * FROM IceCreamInventory;

-- Select all data from Sale Details table
SELECT * FROM SaleDetails;

-- Select all data from VanStockLevel table
SELECT * FROM VanStockLevel;



-- Report 1: Best-selling ice cream
-- Sarah: "Now, let's run a report to see the best-selling ice cream flavors."

SELECT IceCreamInventory.FlavorName, SUM(SaleDetails.Quantity) AS TotalSold
FROM IceCreamInventory
JOIN SaleDetails ON IceCreamInventory.FlavorID = SaleDetails.FlavorID
GROUP BY IceCreamInventory.FlavorName
ORDER BY TotalSold DESC;



-- Report 2: Analyzing Promotion Effectiveness
-- Sarah decided to check the effectiveness of the different promotions. She ran a query to see how many sales were linked to each promotion.

SELECT Promotions.PromotionName, COUNT(Sales.SaleID) AS NumberOfSales, SUM(Sales.TotalAfterDiscount) AS TotalRevenue
FROM Sales
JOIN Promotions ON Sales.PromotionID = Promotions.PromotionID
GROUP BY Promotions.PromotionName
ORDER BY TotalRevenue DESC;



-- Report 3: Sales Trends Over Time
-- To analyze trends, Sarah ran a query to group sales by date and see how sales fluctuate over time

SELECT SaleDate, SUM(TotalAfterDiscount) AS DailySales
FROM Sales
GROUP BY SaleDate
ORDER BY SaleDate;



-- Report 4: Best Performing Vans by Revenue
-- To dive deeper into the financials, Sarah ran a query to see which Vans contributed the most to total revenue.

SELECT IceCreamVan.VanID ,IceCreamVan.DriverName, Regions.RegionName, SUM(Sales.TotalAfterDiscount) AS TotalRevenue
FROM Sales
JOIN IceCreamVan ON Sales.VanID = IceCreamVan.VanID
JOIN Regions ON IceCreamVan.RegionID = Regions.RegionID
GROUP BY IceCreamVan.VanID , IceCreamVan.DriverName, Regions.RegionName
ORDER BY TotalRevenue DESC;

