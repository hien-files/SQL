-- TRUY VẤN LỒNG (SUB QUERY)
-- GROUP BY
-- SLECT INTO
-- INTO INSER SELECT
CREATE DATABASE SinhVien
GO

USE SinhVien
GO

CREATE TABLE Lop (
    IDLOP CHAR(10) CONSTRAINT id_lop PRIMARY KEY,
    TENLOP NVARCHAR(255)    
)
GO

CREATE TABLE SV (
    IDSV CHAR(10) CONSTRAINT id_sv PRIMARY KEY,
    TENSV NVARCHAR(255),
    IDLOP CHAR(10) CONSTRAINT FK_id_lop FOREIGN KEY REFERENCES Lop(IDLOP),
    TUOI INT
)
GO

INSERT INTO Lop
    VALUES
    ('D01','BTEC_D001'),
    ('D02','BTEC_D002'),
    ('D03','BTEC_D003')
GO


INSERT INTO SV
    VALUES
    ('SV001',N'Lò Văn Hiền','D02',20),
    ('SV002',N'Vu Long An','D01',19),
    ('SV003',N'Phùng Thị Minh Huệ','D03',18),
    ('SV004',N'Nguyễn Quỳnh Nga','D02',20),
    ('SV005',N'Lù Hồng Ngọc','D01',21),
    ('SV006',N'Nguyễn Minh Cường','D02',22),
    ('SV007',N'Dương Đức Mạnh','D03',19)
GO

-- ********** TRUY VẤN LỒNG (SUB QUERY)
SELECT * FROM SV AS S 
    WHERE S.IDLOP = (
        SELECT L.IDLOP FROM Lop AS L WHERE L.TENLOP = 'BTEC_D002'
    ) 
GO

-- ********** GROUP BY **********
-- tổng tuổi của SV các lớp
SELECT l.TENLOP, SUM(S.TUOI) FROM Lop AS l
    INNER JOIN SV AS S on s.IDLOP =l.IDLOP
    GROUP BY L.TENLOP
GO

-- tổng tuổi của SV các lớp lớn hơn giá trị trung bình
DECLARE @trung_binh INT;
SET @trung_binh = 40;
SELECT l.TENLOP, SUM(S.TUOI) FROM Lop AS l
    INNER JOIN SV AS S on s.IDLOP =l.IDLOP
    GROUP BY L.TENLOP 
    HAVING SUM(S.TUOI) >= @trung_binh
GO

-- ********** UNION *********
-- lấy ra id và tên của lớp và sinh viên
SELECT S.IDSV AS 'ID', S.TENSV AS 'Tên' FROM SV AS S
UNION
SELECT l.IDLOP AS 'ID', l.TENLOP AS 'Tên' FROM Lop AS l
GO

--*********** Backup Data ****
-- SELECT  INTO (tự động tạo ra 1 table mới vào copy dữ liệu sang)
SELECT * INTO SV_Backup FROM SV

SELECT * FROM SV_Backup
GO

-- INSERT INTO (tạo ra một bảng rồi copy data từ bảng cũ vào bảng mới vừa tạo)
CREATE TABLE Lop_backup (
    TENLOP NVARCHAR(255) UNIQUE
)

INSERT INTO Lop_Backup
SELECT L.TENLOP FROM Lop AS L

SELECT * FROM Lop_Backup
GO