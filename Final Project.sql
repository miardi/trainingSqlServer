/*
*FINAL PROJECT
*Helmi Yuliardi
*Training SQL SERVER ADVANCE
*/

--TUGAS 1

--1. Buat Database
CREATE DATABASE PerusahaanDBHelmi

--2. Buat Table
CREATE TABLE Employees(
	EmployeeID INT IDENTITY(1,1),
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	DepartmentID INT,
	Salary MONEY,
	HireDate DATE
	CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeID)
)

CREATE TABLE Department(
	DepartmentID INT IDENTITY(1,1),
	DepartmentName VARCHAR(50),
	ManagerID INT,
	CONSTRAINT PK_DepartmentID PRIMARY KEY (DepartmentID)
)

CREATE TABLE Salaries(
	SalaryID INT IDENTITY(1,1),
	EmployeeID INT,
	Amount MONEY,
	SalaryDate DATE
	CONSTRAINT PK_SalaryID PRIMARY KEY (SalaryID)
)

CREATE TABLE Sales(
	SaleID INT IDENTITY(1,1),
	EmployeeID INT,
	SaleAmount MONEY,
	SaleDate DATE
	CONSTRAINT PK_SaleID PRIMARY KEY (SaleID)
)

--3. Insert Data
INSERT INTO Employees VALUES('Employee','02', 1, 4000000, '2022-10-22')
INSERT INTO Employees VALUES('Employee','03', 2, 8000000, '2024-11-12')
INSERT INTO Employees VALUES('Employee','04', 2, 3000000, '2020-10-26')
INSERT INTO Employees VALUES('Employee','05', 3, 10000000, '2013-08-03')
INSERT INTO Employees VALUES('Employee','06', 3, 7000000, '2003-12-25')

INSERT INTO Department VALUES 
('Training Center', 1),
('Human Recruitment', 2),
('People Development', 3);

INSERT INTO Sales VALUES 
(1,9000000, '2024-11-25'),
(6,12000000, '2024-11-25'),
(9,30000000, '2024-11-25'),
(11,22000000, '2024-11-25'),
(12,5000000, '2024-11-25')

INSERT INTO Sales VALUES 
(1,5000000, '2024-10-25'),
(6,66000000, '2024-12-25'),
(9,89000000, '2024-11-25'),
(11,12000000, '2024-09-25'),
(12,53000000, '2024-12-25')

--4. SELECT data
SELECT
	CONCAT(FirstName,' ',LastName) AS FullName,
	DATEDIFF(DAY, HireDate, GETDATE()) AS MasaKejaDalamHari
FROM Employees


--TUGAS 2

--Soal 1
SELECT * FROM Employees
WHERE LastName LIKE 'A%'

--Soal 2
SELECT *,
	CASE 
		WHEN Salary > 10000000 THEN 'HIGH'
		WHEN Salary < 5000000 THEN 'LOW'
		ELSE 'MEDIUM'
	END	AS SalaryRate
FROM Employees

--Soal 3
SELECT * 
FROM Employees e1
WHERE e1.Salary > (
	SELECT AVG(e2.Salary) FROM Employees e2
	WHERE e1.DepartmentID = e2.DepartmentID
)

--TUGAS 3

CREATE TABLE #TempEmployees(
	EmployeeID INT IDENTITY(1,1),
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	DepartmentID INT,
	Salary MONEY,
	HireDate DATE
);
SELECT * INTO #TempEmployees FROM Employees;


WITH totalGajiTiapDept AS (
	SELECT 
		DepartmentID,
		SUM(Salary) AS TotalGaji
	FROM Employees
	GROUP BY DepartmentID
)
SELECT * FROM totalGajiTiapDept

--TUGAS 4

--Soal 1
BEGIN TRANSACTION
DECLARE @Salary INT;
SELECT @Salary = Salary FROM Employees
UPDATE Employees 
SET Salary = @Salary * 0.05
WHERE EmployeeID = 6
IF @@ERROR = 0
	COMMIT
ELSE 
	ROLLBACK 
	
	
--Soal 2
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
SELECT * FROM Employees
COMMIT

--TUGAS 5

--Soal 1
BEGIN TRANSACTION;


COMMIT