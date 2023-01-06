CREATE DATABASE PHONG_VAN
GO

USE PHONG_VAN
GO

-- ***** Create tables *****
CREATE TABLE Customer (
    ID INT IDENTITY(1,1) CONSTRAINT PK_ctm PRIMARY KEY,
    NAME VARCHAR(255),
)
GO

CREATE TABLE Product (
    ID INT IDENTITY(1,1) CONSTRAINT PK_prd PRIMARY KEY,
    NAME VARCHAR(255),
)
GO

CREATE TABLE PurchaseOrder (
    ID INT IDENTITY(1,1) CONSTRAINT PK_pco PRIMARY KEY,
    Submit_Date DATE,
    Customer_ID INT FOREIGN KEY REFERENCES Customer(ID),
    Product_ID INT FOREIGN KEY REFERENCES Product(ID)
)
GO

-- ***** insert data *****
INSERT INTO Customer(NAME)
    VALUES 
        (N'Mary'),
        (N'Noah'),
        (N'Anna'),
        (N'Elizabeth')
GO

INSERT INTO Product(NAME)
    VALUES 
        (N'Laptop'),
        (N'Web Cam'),
        (N'Keyboard')
GO

INSERT INTO PurchaseOrder(Submit_Date, Customer_ID, Product_ID)
    VALUES 
        ('20190204', 1, 1),
        ('20190205', 1, 2),
        ('20190206', 2, 2),
        ('20190207', 3, 1),
        ('20190213', 1, 2)
GO

-- ***** create procedure *****
-- 1.1 How do you obtain the list of client IDs that purchased product 2 (Web Cam) in SQL?
-- lấy danh sách ID khách hàng đã mua sản phẩm 2 (Web Cam) trong SQL?
CREATE PROCEDURE BY_product2
    @idPrd INT
AS
    SELECT DISTINCT(Customer_ID) FROM PurchaseOrder 
        WHERE Product_ID = @idPrd 
GO;

EXEC BY_product2 @idPrd = 2;
GO

-- 1.2 How do obtain the list of client IDs that did not purchase product 2 (Web Cam) in SQL?
-- lấy danh sách ID khách hàng không mua sản phẩm 2 (Web Cam) trong SQL?
CREATE PROCEDURE NotBY_product2
    @idPrd INT
AS
    SELECT DISTINCT(P.Customer_ID) FROM PurchaseOrder AS P
        WHERE P.Product_ID != @idPrd
GO;
EXEC NotBY_product2 @idPrd = 2;
GO

-- 1.3 How do you obtain a report with the number of purchase orders for each client ordered with the best clients first in SQL?
-- số lượng đơn đặt hàng cho mỗi khách hàng đã đặt hàng 
CREATE PROCEDURE get_Number_of_purchase
AS
    SELECT C.NAME, COUNT(P.Customer_ID) AS N'Số đơn hàng'
        FROM Customer AS C INNER JOIN PurchaseOrder AS P
        on C.ID = P.Customer_ID
        GROUP BY (C.NAME) ORDER BY COUNT(P.Customer_ID) DESC
GO;
EXEC get_Number_of_purchase;
GO