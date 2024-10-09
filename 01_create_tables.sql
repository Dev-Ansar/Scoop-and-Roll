CREATE DATABASE ScoopAndRoll;
USE ScoopAndRoll;

-- Create Regions Table
CREATE TABLE Regions (
    RegionID INT IDENTITY(1,1) PRIMARY KEY,    -- Auto-incremented primary key
    RegionName VARCHAR(100) NOT NULL UNIQUE    -- Unique name of the region
);

-- Create Ice Cream Van Table
CREATE TABLE IceCreamVan (
    VanID INT IDENTITY(1,1) PRIMARY KEY,     -- Auto-incremented primary key
    RegionID INT NOT NULL,                   -- Foreign key for Region
    DriverName VARCHAR(100) NOT NULL,        -- Driver name, can't be NULL
    CONSTRAINT FK_Region FOREIGN KEY (RegionID) REFERENCES Regions(RegionID) -- Region FK
);

-- Create Promotions Table
CREATE TABLE Promotions (
    PromotionID INT IDENTITY(1,1) PRIMARY KEY,         -- Auto-incremented primary key
    PromotionName VARCHAR(100) NOT NULL,               -- Name of the promotion
    PromotionType VARCHAR(20) CHECK (PromotionType IN ('Discount', 'Flat-Off', 'Free')) NOT NULL,  -- Type of promotion
    Description TEXT NOT NULL,                         -- Promotion details
    PromotionValue DECIMAL(10, 2) CHECK (PromotionValue >= 0), -- Numeric value for discount (percentage or flat-off amount)
    IsActive BIT NOT NULL                             -- Indicates if the promotion is currently active (1 for active, 0 for inactive)
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,        -- Auto-incremented primary key
    SaleDate DATE NOT NULL,                      -- Date of sale
    Latitude DECIMAL(10, 8),                     -- Location of the sale
    Longitude DECIMAL(11, 8),                    -- Location of the sale
    VanID INT,                                   -- Foreign key for Ice Cream Van
    PromotionID INT NULL,                        -- Foreign key for Promotion (nullable)
    TotalBeforeDiscount DECIMAL(10, 2) CHECK (TotalBeforeDiscount >= 0),  -- Pre-discount total
    DiscountAmount DECIMAL(10, 2) DEFAULT 0 CHECK (DiscountAmount >= 0),  -- Discount applied
    TotalAfterDiscount DECIMAL(10, 2) CHECK (TotalAfterDiscount >= 0),    -- Total after discount
    
    CONSTRAINT FK_Van FOREIGN KEY (VanID) REFERENCES IceCreamVan(VanID),
    CONSTRAINT FK_Promotion FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID)
);

-- Create Ice Cream Inventory Table
CREATE TABLE IceCreamInventory (
    FlavorID INT IDENTITY(1,1) PRIMARY KEY,    -- Auto-incremented primary key
    FlavorName VARCHAR(100) NOT NULL UNIQUE,   -- Unique flavor name
    Price DECIMAL(10, 2) NOT NULL,             -- Price per unit
    StockLevel INT NOT NULL                    -- Inventory count
);

-- Create Sale Details Table
CREATE TABLE SaleDetails (
    SaleDetailID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incremented primary key
    SaleID INT,                                -- Foreign key for Sales
    FlavorID INT,                              -- Foreign key for Ice Cream Flavors
    Quantity INT NOT NULL,                     -- Number of units sold
    Price DECIMAL(10, 2) NOT NULL,             -- Price per unit
    CONSTRAINT FK_Sale FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    CONSTRAINT FK_Flavor FOREIGN KEY (FlavorID) REFERENCES IceCreamInventory(FlavorID)
);

-- Create Van Stock Level Table
CREATE TABLE VanStockLevel (
    VanStockID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented primary key
    VanID INT NOT NULL,                        -- Foreign key for Ice Cream Van
    FlavorID INT NOT NULL,                     -- Foreign key for Ice Cream Flavors
    StockLevel INT NOT NULL,                   -- Inventory count for each flavor in each van

    CONSTRAINT FK_VanStock_Van FOREIGN KEY (VanID) REFERENCES IceCreamVan(VanID),   -- Foreign key reference to Ice Cream Van
    CONSTRAINT FK_VanStock_Flavor FOREIGN KEY (FlavorID) REFERENCES IceCreamInventory(FlavorID)  -- Foreign key reference to Ice Cream Flavors
);



