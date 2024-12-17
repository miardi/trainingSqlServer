Soal 1: Membuat Stored Procedure
Buat stored procedure bernama GetTotalSalaryByDepartment yang menghitung total gaji semua karyawan di sebuah departemen.

Jalankan stored procedure ini untuk Departemen IT (@DepartmentID = 3)

CREATE PROCEDURE GetTotalSalaryByDepartmentMiardi 
@DepartmentID INT
AS
BEGIN
	SELECT	DepartmentID,
		SUM(Salary) AS totalGaji 
	FROM Employees
	WHERE DepartmentID = @DepartmentID
	GROUP BY DepartmentID
END

EXEC GetTotalSalaryByDepartmentMiardi
@DepartmentID = 3;


Soal 2: Membuat Stored Procedure untuk Update Data
Buat stored procedure UpdateEmployeeSalary untuk memperbarui gaji karyawan berdasarkan EmployeeID.

Ubah gaji karyawan dengan EmployeeID = 100 menjadi 20.000.000.

CREATE PROCEDURE gantiGajiMiardi
@EmployeeID INT,
@Salary INT
AS
BEGIN
	UPDATE Employees 
	SET Salary = @Salary
	WHERE EmployeeID = @EmployeeID
END

SELECT * FROM Employees
WHERE EmployeeID = 13

EXEC gantiGajiMiardi
@EmployeeID = 13,
@Salary = 1000000;


Soal 3: Membuat Trigger untuk Audit
Buat trigger trg_AfterEmployeeUpdate untuk mencatat perubahan gaji ke tabel EmployeeAudit.

Ubah gaji karyawan dengan EmployeeID = 200 menjadi 25.000.000 dan periksa tabel EmployeeAudit.

CREATE TRIGGER trg_AfterEmployeeUpdateMiardi
ON Employees
AFTER OF UPDATE 
AS
BEGIN
	INSERT INTO EmployeeAudit(EmployeeID, ChangeDate ,OldSalary, NewSalary)
	SELECT inserted.EmployeeID, GETDATE(), deleted.Salary, inserted.Salary
	FROM inserted
	JOIN deleted
	ON inserted.EmployeeID = deleted.EmployeeID	
END

DECLARE @salary INT = 25000000,
	@employeeID INT = 55;
UPDATE Employees 
SET Salary = @salary
WHERE EmployeeID = @employeeID

SELECT * FROM EmployeeAudit ea 

Soal 4: Membuat INSTEAD OF Trigger
Buat trigger trg_CheckSalary untuk memastikan gaji tidak boleh lebih dari 100 juta.

Coba masukkan data karyawan baru dengan gaji 120 juta dan amati error-nya.


3. Gabungan Stored Procedure dan Trigger
Buat stored procedure GetHighEarnerEmployees untuk mendapatkan daftar karyawan dengan gaji di atas rata-rata per departemen.

Jalankan:

Tambahkan trigger trg_AfterEmployeeInsert untuk mencatat data karyawan baru yang ditambahkan ke tabel log khusus.







