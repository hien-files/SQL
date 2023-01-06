-- FUNCTION
USE Quan_Ly_SV
GO 

-- Tạo FUNCTION
CREATE FUNCTION TinhTong (
    @a INT, 
    @b INT 
)
RETURNS INT 
AS
BEGIN 
    RETURN @a * @b;
END;
GO

SELECT dbo.TinhTong(2,3)
GO

-- Sửa FUNCTION
ALTER FUNCTION dbo.TinhTong (
    @a INT,
    @b INT,
    @c INT
)
RETURNS INT 
AS 
BEGIN
    RETURN @a * @b + @c;
END
GO

SELECT dbo.TinhTong(2,3,4)
GO

--Xóa FUNCTION
DROP FUNCTION TinhTong
GO

