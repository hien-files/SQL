CREATE DATABASE EXAMPLE;

USE EXAMPLE;

CREATE TABLE CATEGORYS
(
    ID INT IDENTITY(1,1) CONSTRAINT PK_CATEGORY PRIMARY KEY,
    NAME NVARCHAR(255)
);

-- ALTER COLUMN NAME
ALTER TABLE CATEGORYS ALTER COLUMN NAME NVARCHAR(255) NOT NULL;

CREATE TABLE PRODUCTS
(
    ID INT IDENTITY(1,1) CONSTRAINT PK_PRODUCT PRIMARY KEY,
    NAME NVARCHAR(255) NOT NULL,
    ID_CATEGORY INT,
);

-- ADD FOREIGN KEY PRODUCTS 
ALTER TABLE PRODUCTS 
    ADD CONSTRAINT FK_CATEGORY FOREIGN KEY(ID_CATEGORY) REFERENCES CATEGORYS(ID);

-- ADD COLUMN PRICE AND QUANTITY (check)
ALTER TABLE PRODUCTS ADD 
    PRICE BIGINT, 
    QUANTITY INT CONSTRAINT CHECK_QUANTITY_PRODUCT CHECK (QUANTITY > 0);

-- INSERT
INSERT INTO CATEGORYS
    (NAME)
VALUES
    (N'CATEGORY 1'),
    (N'CATEGORY 2'),
    (N'CATEGORY 1');

INSERT INTO PRODUCTS
    (NAME, ID_CATEGORY, PRICE, QUANTITY)
VALUES
    (N'PRODUCT 1', 1, 1500, 10),
    (N'PRODUCT 2', 1, 1200, 10),
    (N'PRODUCT 3', 2, 4500, 8),
    (N'PRODUCT 4', 2, 2500, 7),
    (N'PRODUCT 5', 3, 1800, 11),
    (N'PRODUCT 6', 3, 2000, 8),
    (N'PRODUCT 7', 1, 3100, 11),
    (N'PRODUCT 8', 2, 2100, 12);

-- UPDATE
UPDATE PRODUCTS SET QUANTITY = 20 WHERE ID = 6;
SELECT * FROM PRODUCTS;

DELETE PRODUCTS WHERE ID = 5;
SELECT * FROM PRODUCTS;

-- ORDER BY: DESC, ASC -> default ASC
SELECT * FROM PRODUCTS ORDER BY QUANTITY;

-- COUNTRY FOR PRODUCT
ALTER TABLE PRODUCTS
    ADD COUNTRY NVARCHAR(255);
    
UPDATE PRODUCTS SET COUNTRY = N'TQ' WHERE PRICE <= 2000;
UPDATE PRODUCTS SET COUNTRY = N'JA' WHERE PRICE BETWEEN 2000 AND 3000;
UPDATE PRODUCTS SET COUNTRY = N'VN' WHERE PRICE > 3000;

-- AND, OR, NOT, INT, BETWEEN
SELECT * FROM PRODUCTS WHERE PRICE >= 2000 AND QUANTITY >= 12;

SELECT * FROM PRODUCTS WHERE PRICE >= 3000 OR PRICE <= 2000;

SELECT * FROM PRODUCTS WHERE COUNTRY IN ('JS', 'VN');

SELECT * FROM PRODUCTS WHERE COUNTRY NOT IN ('JS', 'VN');

SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 1500 AND 3100

-- DISTINCT
SELECT DISTINCT(COUNTRY) FROM PRODUCTS;

-- COUNT
SELECT COUNT(*) FROM PRODUCTS;

SELECT COUNT(*) FROM PRODUCTS GROUP BY(COUNTRY);

-- SUM, AVG
SELECT SUM(PRICE) FROM PRODUCTS;

SELECT AVG(PRICE) FROM PRODUCTS;

-- INSERT RECORD
INSERT INTO CATEGORYS
    (NAME)
VALUES
    (N'CATEGORY 5'),
    (N'CATEGORY 6');

INSERT INTO PRODUCTS
    (NAME, PRICE, QUANTITY)
VALUES
    (N'PRODUCT 9', 2700, 19),
    (N'PRODUCT 10', 3800, 11),
    (N'PRODUCT 11', 1800, 13);

SELECT * FROM PRODUCTS;
SELECT * FROM CATEGORYS;

-- INNER JOIN, FULL OUTER JOIN, LEFT - RIGHT JOIN
SELECT P.NAME AS 'PRODUCT NAME', P.PRICE, P.QUANTITY, C.NAME AS 'CATEGORY NAME'
    FROM PRODUCTS AS P INNER JOIN CATEGORYS AS C
    ON P.ID_CATEGORY = C.ID;

-- get all 
SELECT P.NAME AS 'PRODUCT NAME', P.PRICE, P.QUANTITY, C.NAME AS 'CATEGORY NAME'
    FROM PRODUCTS AS P FULL OUTER JOIN CATEGORYS AS C
    ON P.ID_CATEGORY = C.ID;

SELECT P.NAME AS 'PRODUCT NAME', P.PRICE, P.QUANTITY, C.NAME AS 'CATEGORY NAME'
    FROM PRODUCTS AS P LEFT JOIN CATEGORYS AS C
    ON P.ID_CATEGORY = C.ID;

SELECT P.NAME AS 'PRODUCT NAME', P.PRICE, P.QUANTITY, C.NAME AS 'CATEGORY NAME'
    FROM PRODUCTS AS P RIGHT JOIN CATEGORYS AS C
    ON P.ID_CATEGORY = C.ID;






