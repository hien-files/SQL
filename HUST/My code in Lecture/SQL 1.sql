-- UNIQUE
-- CHECK
-- SELECT CƠ BẢN
-- SELECT CÓ ĐIỀU KIỆN
-- INSERT
-- UPDATE
-- DELETE
-- ORDER BY
-- AND, OR, NOT, IN?
-- ALIAS
-- DISTINCT
-- COUNT? 


CREATE DATABASE Quan_Ly_SV 
GO
USE Quan_Ly_SV
GO

CREATE TABLE Student (
    ID INT IDENTITY(1,1) CONSTRAINT id_sv UNIQUE,
    Name NVARCHAR(255),
    Class NVARCHAR(255),
    AGE INT  CONSTRAINT check_age CHECK(AGE >= 18)
)
GO

SELECT * FROM Student
GO
 
INSERT INTO Student 
    VALUES 
    (N'Lò Văn Hiền','BTEC_D02',18),
    (N'Nguyên Văn Minh Cường','BTEC_D02',18),
    (N'Nguyễn Quỳnh Nga','BTEC_D02',18)
GO

UPDATE Student SET Name = N'Phùng Thị Minh Huệ' WHERE Name = N'Nguyên Văn Minh Cường'
GO
 
DELETE Student WHERE Name = N'Phùng Thị Minh Huệ'
GO

SELECT * FROM Student ORDER BY(ID) DESC
GO

SELECT Name AS N'Họ Và Tên' FROM Student
GO

INSERT INTO Student 
    VALUES 
    (N'Dương Đức Mạnh','BTEC_D03',18),
    (N'Nguyễn Lê Lợi','BTEC_D04',18),
    (N'NUyễn Thanh Lâm','BTEC_D02',18)
GO

SELECT DISTINCT(Class) FROM Student
GO

SELECT COUNT(*) FROM Student
GO