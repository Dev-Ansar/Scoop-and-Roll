USE ScoopAndRoll;

-- Insert data into Regions table
INSERT INTO Regions (RegionName) VALUES
('New York'),
('Los Angeles'),
('Chicago');

-- Insert data into Ice Cream Van table
INSERT INTO IceCreamVan (RegionID, DriverName) VALUES
(1, 'Alice Johnson'), -- New York
(1, 'Bob Smith'),     -- New York
(2, 'Charlie Brown'), -- Los Angeles
(2, 'Diana Prince'),  -- Los Angeles
(3, 'Edward Green'),  -- Chicago
(3, 'Fiona White'),   -- Chicago
(3, 'George Black'),   -- Chicago
(3, 'Hannah Blue');    -- Chicago

-- Insert data into Promotions table
INSERT INTO Promotions (PromotionName, PromotionType, Description, PromotionValue, IsActive) VALUES
('20% Off Discount', 'discount', 'Get 20% off on your total purchase.', 20.00, 1),
('Flat $10 Off', 'flat-off', 'Flat $10 off on total amount greater than $40.', 10.00, 1),
('Free Toy for Kids', 'free', 'Get a free toy with every purchase for kids.', 0.00, 1);

-- Insert data into Ice Cream Inventory table
INSERT INTO IceCreamInventory (FlavorName, Price, StockLevel) VALUES
('Chocolate', 2.50, 50),
('Vanilla', 2.00, 50),
('Strawberry', 2.75, 50),
('Mint', 3.00, 50);

-- Insert data into Sales table with corrected total amounts
INSERT INTO Sales (SaleDate, Latitude, Longitude, VanID, PromotionID, TotalBeforeDiscount, DiscountAmount, TotalAfterDiscount) VALUES
('2024-10-01', 40.7128, -74.0060, 1, 1, 11.50, 20, 9.20), -- New York, Van 1 with 20% off
('2024-10-02', 34.0522, -118.2437, 3, 2, 45.00, 10, 35.00), -- Los Angeles, Van 3 with $10 off
('2024-10-03', 41.8781, -87.6298, 5, NULL,25.00, 0, 25.00); -- Chicago, Van 5 with no promotion

-- Insert data into Sale Details table with updated values
INSERT INTO SaleDetails (SaleID, FlavorID, Quantity, Price) VALUES
(1, 1, 3, 2.50), -- Sale 1: 3 Chocolate (3 * 2.50 = 7.50)
(1, 2, 2, 2.00), -- Sale 1: 2 Vanilla (2 * 2.00 = 4.00)
(2, 3, 10, 2.75), -- Sale 2: 10 Strawberry (10 * 2.75 = 27.50)
(2, 1, 5, 2.50),  -- Sale 2: 5 Chocolate (5 * 2.50 = 12.50)
(3, 4, 5, 3.00);  -- Sale 3: 5 Mint (5 * 3.00 = 15.00)


-- Insert data into Van Stock Level table
INSERT INTO VanStockLevel (VanID, FlavorID, StockLevel) VALUES
(1, 1, 30),  -- Van 1 (New York) has 30 Chocolate
(1, 2, 20),  -- Van 1 (New York) has 20 Vanilla
(1, 3, 25),  -- Van 1 (New York) has 25 Strawberry
(1, 4, 15),  -- Van 1 (New York) has 15 Mint
(2, 1, 40),  -- Van 2 (New York) has 40 Chocolate
(2, 2, 35),  -- Van 2 (New York) has 35 Vanilla
(2, 3, 20),  -- Van 2 (New York) has 20 Strawberry
(2, 4, 10),  -- Van 2 (New York) has 10 Mint
(3, 1, 25),  -- Van 3 (Los Angeles) has 25 Chocolate
(3, 2, 15),  -- Van 3 (Los Angeles) has 15 Vanilla
(3, 3, 30),  -- Van 3 (Los Angeles) has 30 Strawberry
(3, 4, 5),   -- Van 3 (Los Angeles) has 5 Mint
(4, 1, 20),  -- Van 4 (Los Angeles) has 20 Chocolate
(4, 2, 25),  -- Van 4 (Los Angeles) has 25 Vanilla
(4, 3, 10),  -- Van 4 (Los Angeles) has 10 Strawberry
(4, 4, 5),   -- Van 4 (Los Angeles) has 5 Mint
(5, 1, 50),  -- Van 5 (Chicago) has 50 Chocolate
(5, 2, 50),  -- Van 5 (Chicago) has 50 Vanilla
(5, 3, 40),  -- Van 5 (Chicago) has 40 Strawberry
(5, 4, 20),  -- Van 5 (Chicago) has 20 Mint
(6, 1, 45),  -- Van 6 (Chicago) has 45 Chocolate
(6, 2, 30),  -- Van 6 (Chicago) has 30 Vanilla
(6, 3, 20),  -- Van 6 (Chicago) has 20 Strawberry
(6, 4, 10),  -- Van 6 (Chicago) has 10 Mint
(7, 1, 50),  -- Van 7 (Chicago) has 50 Chocolate
(7, 2, 40),  -- Van 7 (Chicago) has 40 Vanilla
(7, 3, 30),  -- Van 7 (Chicago) has 30 Strawberry
(7, 4, 15),  -- Van 7 (Chicago) has 15 Mint
(8, 1, 35),  -- Van 8 (Chicago) has 35 Chocolate
(8, 2, 25),  -- Van 8 (Chicago) has 25 Vanilla
(8, 3, 20),  -- Van 8 (Chicago) has 20 Strawberry
(8, 4, 10);  -- Van 8 (Chicago) has 10 Mint
