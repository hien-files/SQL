CREATE DATABASE ASSIGNMENT
GO

USE ASSIGNMENT
GO

CREATE TABLE Staffs (
    Name NVARCHAR (255) NOT NULL,
    ID_sf CHAR(10) CONSTRAINT PK_id_sf PRIMARY KEY,
    Date_obd DATE NOT NULL,
    Phone_sf VARCHAR(255) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    City NVARCHAR(255) NOT NULL,
    District NVARCHAR(255) NOT NULL,
    Ward NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE Customers (
    Name NVARCHAR (255) NOT NULL,
    ID_ctm CHAR(10) CONSTRAINT PK_id_ctm PRIMARY KEY,
    Phone_ctm VARCHAR(255) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    City NVARCHAR(255) NOT NULL,
    District NVARCHAR(255) NOT NULL,
    Ward NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE ProductType (
    Name NVARCHAR(255) NOT NULL,
    ID_prt CHAR (10) CONSTRAINT PK_id_prt PRIMARY KEY
)
GO

CREATE TABLE Manufacturers (
    Name NVARCHAR(255) NOT NULL,
    ID_mf CHAR(10) CONSTRAINT PK_id_mf PRIMARY KEY,
    Phone_mf VARCHAR(255) UNIQUE NOT NULL
)
GO

CREATE TABLE Products (
    Name NVARCHAR(255) NOT NULL,
    ID_prd CHAR(10) CONSTRAINT PK_id_prd PRIMARY KEY,
    ID_prt CHAR(10), 
    CONSTRAINT FK_id_prt FOREIGN KEY(ID_prt) REFERENCES ProductType(ID_prt),
    ID_mf CHAR(10),
    CONSTRAINT FK_id_mf FOREIGN KEY(ID_mf) REFERENCES Manufacturers(ID_mf)
)
GO

CREATE TABLE Warehouses (
    Name NVARCHAR(255) NOT NULL,
    ID_wh CHAR(10) CONSTRAINT PK_id_wh PRIMARY KEY,
    City NVARCHAR(255) NOT NULL,
    District NVARCHAR(255) NOT NULL,
    Ward NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE ProductManagement (
    ID_wh CHAR(10),
    CONSTRAINT FK_id_wh FOREIGN KEY (ID_wh) REFERENCES Warehouses(ID_wh),
    ID_prd CHAR (10),
    CONSTRAINT FK_id_prd FOREIGN KEY (ID_prd) REFERENCES Products(ID_prd),
    Quantity INT CHECK(Quantity >=0)
)
GO

CREATE TABLE ShipMethod (
    Name NVARCHAR(255) NOT NULL,
    ID_smt CHAR(10) CONSTRAINT PK_id_smt PRIMARY KEY
)
GO

DROP TABLE Orders
CREATE TABLE Orders (
    ID_od CHAR(10) CONSTRAINT PK_id_od PRIMARY KEY,
    ID_sf CHAR(10),
    CONSTRAINT FK_id_sf FOREIGN KEY(ID_sf) REFERENCES Staffs(ID_sf),
    ID_ctm CHAR(10),
    CONSTRAINT FK_id_ctm FOREIGN KEY(ID_ctm) REFERENCES Customers(ID_ctm),
    ID_smt CHAR(10),
    CONSTRAINT FK_id_smt FOREIGN KEY(ID_smt) REFERENCES ShipMethod(ID_smt),
    Date_cr CHAR(10) NOT NULL
)
GO

CREATE TABLE OrdersDetaill (
    ID_od CHAR(10), 
    ID_prd CHAR(10),
    Quantity INT CONSTRAINT check_quantyti CHECK(QuantItY > 0),
    Price INT CONSTRAINT check_price CHECK(Price > 0)
)
GO

INSERT INTO dbo.Staffs
VALUES
    (N'Nguy???n V??n A','SF001','19980908','0323567890','nguyenvana@gmail.com',N'H?? N???i',N'Ho??ng Mai',N'?????i Kim'),
    (N'Nguy???n V??n B','SF002','19990920','0323333390','nguyenvanb@gmail.com',N'H?? N???i',N'Hai B?? Tr??ng',N'B??ch khoa'),
    (N'Nguy???n V??n C','SF003','19981018','0333667890','nguyenvanc@gmail.com',N'H?? N???i',N'Ho??ng Mai',N'Mai ?????ng'),
    (N'Nguy???n V??n D','SF004','20001011','0398667890','nguyenvand@gmail.com',N'H?? N???i',N'C???u Gi???y',N'D???ch V???ng'),
    (N'Nguy???n V??n E','SF005','19971112','0363667890','nguyenvane@gmail.com',N'H?? N???i',N'?????ng ??a',N'Kim Li??n')
GO

INSERT INTO dbo.Customers
VALUES
    (N'Nguy???n C??ng Ph?????ng','CTM001','0323567890','nguyencongphuong@gmail.com',N'H?? N???i',N'Ho??ng Mai',N'Y??n Ngh??a'),
    (N'Nguy???n Quang H???i','CTM002','0323333390','nguyenquanghai@gmail.com',N'H?? N???i',N'Hai B?? Tr??ng',N'?????ng T??m'),
    (N'??o??n V??n H???u','CTM003','0333667890','doanvanhau@gmail.com',N'H?? N???i',N'Ho??ng Mai',N'?????i T???'),
    (N'Qu??? Ng???c H???i','CTM004','0398667890','quengochai@gmail.com',N'H?? N???i',N'?????ng ??a',N'Ng?? T?? S???'),
    (N'Nguy???n V??n To??n','CTM005','0363667890','nguyevantoan@gmail.com',N'H?? N???i',N'?????ng ??a',N'L??ng H???')
GO

INSERT INTO dbo.ProductType
VALUES 
    ('Windows','PRT001'),
    ('Doors','PRT002')
GO

INSERT INTO dbo.Manufacturers 
VALUES
    (N'Vi???t ?????c','MF001','0232224479'),
    (N'Vi???t Nh???t','MF002','023222880')
GO

INSERT INTO dbo.Products
VALUES 
    (N'Windows 01','PRD001','PRT001','MF001'),
    (N'Windows 02','PRD002','PRT001','MF002'),
    (N'Doors 01','PRD003','PRT002','MF001'),
    (N'Doors 02','PRD004','PRT002','MF002'),
    (N'Windows 03','PRD005','PRT001','MF001')
GO

INSERT INTO dbo.Warehouses
VALUES 
    (N'Nh?? Kho 1','WH001',N'H?? N???i','Ho??ng Mai',N'?????i T???'),
    (N'Nh?? Kho 2','WH002',N'H?? N???i','Hai B?? Tr??ng',N'B??ch Khoa')
GO

INSERT INTO ProductManagement 
VALUES
    ('WH001','PRD001',300),
    ('WH001','PRD002',150),
    ('WH002','PRD003',300),
    ('WH002','PRD004',250),
    ('WH001','PRD005',270),
    ('WH002','PRD002',500)
GO

INSERT INTO dbo.ShipMethod
VALUES 
    (N'V???n Chuy???n Nhanh','SMT001'),
    (N'V???n Chuy???n Th?????ng','SMT002'),
    (N'Giao H??ng Ti???t ki???m','SMT003')
GO


INSERT INTO dbo.Orders
VALUES
    ('OD001','SF001','CTM002','SMT001','20220310'),
    ('OD002','SF001','CTM003','SMT002','20220309'),
    ('OD003','SF003','CTM001','SMT002','20220311'),
    ('OD004','SF002','CTM005','SMT001','20220317'),
    ('OD005','SF004','CTM002','SMT001','20220319')
GO

INSERT INTO dbo.OrdersDetaill
VALUES
    ('OD001','PRD003',10,1000000),
    ('OD002','PRD001',15,3000000),
    ('OD003','PRD004',20,1400000),
    ('OD004','PRD005',21,4200000),
    ('OD005','PRD002',23,6900000)
GO

CREATE PROCEDURE INSERT_Product (
    @name NVARCHAR(255),
    @id_prd CHAR(10),
    @id_prt CHAR(10),
    @id_mf CHAR(10)
)AS 
BEGIN
    INSERT INTO dbo.Products (
        Name, ID_prd, ID_prt, ID_mf
        )
    VALUES (
        @name,
        @id_prd,
        @id_prt,
        @id_mf
    )
END;
GO

EXEC INSERT_Product 
    @name = N'Doors 03',
    @id_prd = 'PRD006',
    @id_prt = 'PRT002',
    @id_mf = 'MF002'
GO

SELECT * FROM Products
GO

UPDATE dbo.ShipMethod SET Name = N'V???n Chuy???n H???a T??c'
    WHERE ID_smt = 'SMT003'
GO

SELECT * FROM ShipMethod
GO

CREATE PROCEDURE UPDATE_Products (
    @id_prd CHAR(10),
    @name NVARCHAR(255),
    @id_prt CHAR(10),
    @id_mf CHAR(10)
)AS
BEGIN
    UPDATE dbo.Products SET 
        Name = @name, 
        ID_prt = @id_prt,  
        ID_mf = @id_mf 
    WHERE ID_prd = @id_prd
END;
GO

EXEC UPDATE_Products
    @id_prd = 'PRD003',
    @name = N'Windows 04',
    @id_prt = 'PRT001', 
    @id_mf = 'MF002'
GO

SELECT * FROM Products
GO

INSERT INTO dbo.Customers
VALUES
    (N'?????ng V??n L??m','CTM006','0325467890','dangvanlam@gmail.com',N'H?? N???i',N'Ho??ng Mai',N'Y??n Ngh??a'),
    (N'????? Duy M???nh','CTM007','0323883390','doduymanh@gmail.com',N'H?? N???i',N'Hai B?? Tr??ng',N'?????ng T??m'),
    (N'Nguy???n Ti???n Linh','CTM008','0983667890','nguyentienlinh@gmail.com',N'H?? N???i',N'Ho??ng Mai',N'?????i T???')
GO

DELETE dbo.ShipMethod WHERE ID_smt = 'SMT003'
GO

SELECT * FROM ShipMethod
GO

CREATE PROCEDURE DELETE_Customers (
    @id_ctm CHAR(10)
)AS 
BEGIN
    DELETE FROM dbo.Customers
        WHERE @id_ctm = ID_ctm
END;
GO

EXEC DELETE_Customers 'CTM006';
GO

SELECT * FROM dbo.Customers
GO

SELECT * FROM dbo.Orders
GO

SELECT O.ID_od AS 'Order ID', O.Date_cr AS 'Date creation',
    S.Name AS 'Staff name', C.Name AS 'Customer name'
    FROM  Orders AS O INNER JOIN Staffs AS S
    ON O.ID_sf = S.ID_sf 
    INNER JOIN Customers AS C
    ON O.ID_ctm = C.ID_ctm
GO

CREATE PROCEDURE FIND_Product (
    @id_prd CHAR(10)
)AS 
BEGIN
    SELECT Prd.Name AS 'Product name', Pmg.Quantity AS 'Quantity Of Product', W.Name AS 'Warehouse name'
        FROM ProductManagement AS Pmg INNER JOIN Products AS Prd
        ON Pmg.ID_prd = Prd.ID_prd
        INNER JOIN Warehouses AS W
        ON Pmg.ID_wh = W.ID_wh
    WHERE Prd.ID_prd = @id_prd
END;
GO

EXEC FIND_Product @id_prd = 'PRD004';
GO

INSERT INTO dbo.Products
VALUES 
    (N'Doors 04','PRD008','PRT002','MF002')
GO

SELECT * FROM dbo.Products
GO

UPDATE dbo.Products SET ID_mf = 'MF001' WHERE ID_prd = 'PRD004'
GO

DELETE dbo.Products WHERE ID_prd = 'PRD008'
GO

SELECT Pmg.ID_prd AS 'Product ID', Pmg.Quantity AS 'Quantity of Product',
    Pmg.ID_wh AS 'Warehouse ID'
    FROM dbo.ProductManagement AS Pmg
    WHERE Pmg.Quantity > 250
GO

SELECT * FROM ProductManagement
SELECT * FROM Products

INSERT INTO ProductManagement 
VALUES
    ('WH002','PRD006',70),
    ('WH001','PRD004',200)
GO

--// c??? ?? ch??n d??? li???u l???i ????? ki???m r??ng b???c check (b???ng ProductManagement)
INSERT INTO ProductManagement 
VALUES
    ('WH001','PRD003',-1)
GO

SELECT * FROM OrdersDetaill
SELECT * FROM Orders

--// c??? ?? ch??n d??? li???u l???i ????? ki???m tra kh??a ngo???i (T??? b???ng ProductManagement tham chi???u ?????n Product)
INSERT INTO ProductManagement 
VALUES ('WH001','PRD013',100)
GO

--// c??? ?? ch??n d??? li???u l???i ????? ki???m tra kh??a ch??nh c???a b???ng Orders
INSERT INTO dbo.Orders
VALUES (NULL,'SF001','CTM001','SMT002','20020304')
GO

--// c??? ?? ch??n d??? li???u l???i ????? ki???m tra kh??a ngo???i (T??? b???ng 0rder tham chi???u ?????n Staffs)
INSERT INTO dbo.Orders
VALUES ('OD006','SF100','CTM001','SMT002','20020304')
GO

--// c??? ?? ch??n d??? li???u l???i ????? ki???m tra kh??a ngo???i (T??? b???ng 0rder tham chi???u ?????n Staffs)
INSERT INTO dbo.Orders
VALUES ('OD006','SF001','CTM100','SMT002','20020304')
GO



-- s??? d???ng trigger ????? theo d??i l???ch s??? c??c s???n ph???m ???? ???????c th??m v??o s???n ph???m
CREATE TABLE ProductTracking (
    ACTION TEXT
)
GO


CREATE??TRIGGER??Product_Tracking??????
ON??dbo.Products????
FOR??INSERT????
AS????
BEGIN????
????DECLARE??@Id??CHAR(10)????
????SELECT??@Id??=??ID_prd??FROM INSERTED
????INSERT??INTO??ProductTracking????
????VALUES??('New??Product??with??Id??=??'??+??CAST(@Id??AS??VARCHAR(10))??
            +??'??is??added??at??'??+??CAST(Getdate()??AS??VARCHAR(22) ) )????
END??
GO

INSERT INTO dbo.Products
VALUES 
    (N'Dros 07','PRD011','PRT002','MF001')
GO


