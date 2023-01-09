USE Chinook

-- 1. Get all even number of CustomerId in Customer table. Sort result by CustomerId in ascending order
SELECT *
FROM Customer
WHERE CustomerId % 2 = 0;

-- 2. Get First Name, Last Name of customers who have address is not Av. Paulista, 2022
SELECT FirstName, LastName, Address
FROM Customer
WHERE Address != 'Av. Paulista, 2022';

-- 3. Get postal Code, Phone, Fax, Email of customers who have data about company
SELECT PostalCode, Phone, Fax, Email, Company
FROM Customer
WHERE Company IS NOT NULL;

-- 4. Get all of information of customers who have email contain @yahoo
SELECT *
FROM Customer
WHERE Email LIKE '_%@yahoo%';

-- 5. Get First Name, Last Name, Title, HireDate of employees who have been recruited in 2002
SELECT FirstName, LastName, Title, HireDate
FROM Employee
WHERE YEAR(HireDate) = '2002';

-- 6. Get all information of invoice in the third quarter of 2010, Hint: Use year & datepart function
SELECT *
FROM Invoice
WHERE YEAR(InvoiceDate) = '2010' and (MONTH(InvoiceDate) BETWEEN 7 and 9);

-- 7. Get all information of invoice from 2009 January to 2012 December
SELECT *
FROM Invoice
WHERE InvoiceDate BETWEEN '2009-01-1' AND '2012-12-31';

-- 8. Get all information of invoices in USA OR Germany, AND these invoices have Total = 1.98 OR 3.96
SELECT *
FROM Invoice
WHERE (BillingCountry = 'USA' OR BillingCountry = 'Germany') AND (Total BETWEEN 1.98 AND 3.96)

-- 9. With specific country in Invoice table, counting how many cities belong to that country 
-- Note: data return unique values, removing duplicate values
SELECT BillingCountry, COUNT(DISTINCT(BillingCity))
FROM Invoice
GROUP BY(BillingCountry)

-- 10. Get the highest value of invoice in 2012 January -- try two different way
-- Hint: Use MAX, Order By, Top to solve this question
-- dùng max
SELECT MAX(Total) AS 'Total'
FROM Invoice
WHERE YEAR(InvoiceDate) = '2012' AND MONTH(InvoiceDate) = '01';

-- Order By và Top 
SELECT TOP(1) Total
FROM Invoice
WHERE YEAR(InvoiceDate) = '2012' AND MONTH(InvoiceDate) = '01'
ORDER BY(Total) DESC;