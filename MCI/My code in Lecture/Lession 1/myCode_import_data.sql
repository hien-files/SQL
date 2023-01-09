CREATE DATABASE MCI_SQL_COURSE  
ON   
( NAME = Sales_dat,  
    FILENAME = 'D:\Hoc\LapTrinh\DS ML AI\SQL\data warehousea\MCI_SQL_COURSE.mdf',  
    SIZE = 1024MB,  
    MAXSIZE = 1024MB,  
    -- mỗi lần mở rộng
    FILEGROWTH = 64MB 
)  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'D:\Hoc\LapTrinh\DS ML AI\SQL\data warehousea\MCI_SQL_COURSE.ldf',  
    SIZE = 1024MB,  
    MAXSIZE = 1024MB,  
    FILEGROWTH = 64MB 
);  
GO  

USE MCI_SQL_COURSE;
GO

-- ==== albun table =====
CREATE TABLE album (
    ID INT CONSTRAINT PK_id_album PRIMARY KEY,
    title nvarchar(255),
    artist_id int
);

BULK INSERT album from 'D:\Hoc\LapTrinh\DS ML AI\SQL\MCI\My code in Lecture\Lession 1\album.csv' 
WITH(
    FIRSTROW = 2,  -- lấy data từ dòng thứ 2
    FIELDTERMINATOR  = ',', -- các cột ngăn cách với nhau bởi dấu ","
    ROWTERMINATOR = '\n', -- phân biệt các hàng bởi xống dòng
    FORMAT = 'CSV'
);
GO

DROP TABLE Orders
CREATE TABLE Orders (
    OrderID INT CONSTRAINT PK_id_orders PRIMARY KEY,
    CustomerID NVARCHAR(255),
    EmployeeID INT,
    OrderDate DATETIME,
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia INT,
    Freight float,
    ShipName nvarchar(255),
    ShipAddress nvarchar(255),
    ShipCity nvarchar(255),
    ShipRegion nvarchar(255),
    ShipPostalCode nvarchar(255),
    ShipCountry  nvarchar(255),
);

BULK INSERT Orders from 'D:\Hoc\LapTrinh\DS ML AI\SQL\MCI\My code in Lecture\Lession 1\Orders.csv' 
WITH(
    FIRSTROW = 2,  -- lấy data từ dòng thứ 2
    FIELDTERMINATOR  = ',', -- các cột ngăn cách với nhau bởi dấu ","
    ROWTERMINATOR = '\n', -- phân biệt các hàng bởi xống dòng
    FORMAT = 'CSV'
);
GO

SELECT * FROM Orders