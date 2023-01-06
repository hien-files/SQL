-- DECLARE PARAMETER
-- BEGIN – END
-- IF – ELSE
-- VIEW
CREATE DATABASE BAI22
GO
USE BAI22
GO

CREATE TABLE DONHANG (
    NAME NVARCHAR(255),
    ID CHAR(10),
    SoLuong_SP INT,
    ID_KH CHAR(10)
)
GO

CREATE TABLE KhachHang (
    Name NVARCHAR(255),
    ID_KH CHAR(10) CONSTRAINT id_kh PRIMARY KEY,
)
GO

ALTER TABLE DONHANG
    ADD CONSTRAINT FK_id_kh FOREIGN KEY(ID_KH) REFERENCES KhachHang(ID_KH)
GO

INSERT INTO KhachHang
    VALUES 
    (N'Lò Văn Hiền','KH001'),
    (N'Lù Hồng Ngọc','KH002'),
    (N'Nguyễn Quỳnh Nga','KH003'),
    (N'Phùng Thị Minh Huệ','KH004'),
    (N'Đàm Minh Thuận','KH005')
GO

INSERT INTO DONHANG
    VALUES
    (N'Đơn hàng 1','DH001',100,'KH001'),
    (N'Đơn hàng 2','DH002',500,'KH002'),
    (N'Đơn hàng 3','DH003',300,'KH003'),
    (N'Đơn hàng 4','DH004',200,'KH004'),
    (N'Đơn hàng 5','DH005',900,'KH005')
GO

SELECT * FROM DONHANG AS D RIGHT JOIN KhachHang AS K
    ON D.ID_KH = K.ID_KH
GO

-- *********  DECLARE PARAMETER ************
-- Khai báo biến và sử dụng biến
DECLARE @max AS INT;
SET @max = 500;
SELECT * FROM DONHANG
    WHERE SoLuong_SP <= @max
GO

-- Lưu trữ câu truy vấn vào biến
DECLARE @a AS INT;
SET @a = (
    SELECT 
        D.SoLuong_SP 
    FROM 
        DONHANG AS D
    WHERE D.ID_KH = 'KH003'
);
SELECT * FROM DONHANG AS D
    WHERE D.SoLuong_SP > @a
GO

-- Gán giá trị vào biến ở lệnh SELECT
DECLARE @id CHAR(10);
SELECT @id = D.ID_KH
    FROM DONHANG AS D
    WHERE
        D.SoLuong_SP = 500;
SELECT * FROM KhachHang AS K WHERE K.ID_KH = @id
GO


-- *********** BEGIN-END và IF - ELSE***********
BEGIN 
    DECLARE @max AS INT,
            @name AS NVARCHAR(255);
    SET @max = 900;

    SELECT 
        D.SoLuong_SP 
    FROM 
        DONHANG AS D
    WHERE 
        D.SoLuong_SP = @max

    IF @@ROWCOUNT = 0
        BEGIN
            PRINT N'Không Tìm Thấy đơn hàng nào'
        END

    ELSE
        BEGIN
            SET @name = (
                SELECT 
                    D.NAME
                FROM 
                    DONHANG AS D
                WHERE 
                    D.SoLuong_SP = @max
            )
            PRINT N'Tìm Thấy '+@name
        END
END
GO

------------------------
CREATE PROCEDURE TimDH (
    @sl AS INT
)
AS
BEGIN
    SELECT D.NAME AS N'Tên ĐH', D.ID_KH AS N'Mã ĐH', D.SoLuong_SP AS N'Số Lượng SP' 
    FROM DONHANG AS D WHERE D.SoLuong_SP = @sl;

    IF @@ROWCOUNT = 0
    BEGIN
        PRINT N'Không tìm thấy giá trị phù hợp'
    END;
END;
GO

EXEC TimDH 500;
GO

-- *********** VIEW
CREATE VIEW XEMDH
AS 
SELECT D.NAME AS N'Tên ĐH', D.ID AS N'Mã ĐH', D.ID_KH AS 'Mã KH' 
    FROM DONHANG AS D
GO

SELECT * FROM XEMDH
GO
