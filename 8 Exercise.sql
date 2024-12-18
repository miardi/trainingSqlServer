1.Dirty Read Buat transaksi yang menunjukkan data dibaca sebelum di-commit oleh transaksi lain.
BEGIN TRANSACTION;
UPDATE Orders 
SET Status = 'Processing'
WHERE OrderID = 48

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT * FROM Orders
WHERE OrderID = 48

ROLLBACK;

2. Non-repeatable Read Tunjukkan perbedaan hasil baca karena transaksi lain melakukan perubahan.

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
SELECT * FROM Orders
WHERE OrderID = 48

BEGIN TRANSACTION;
UPDATE Orders 
SET Status = 'Shipped'
WHERE OrderID = 48
COMMIT;

SELECT * FROM Orders
WHERE OrderID = 48
ROLLBACK 


3. Phantom Read Demonstrasikan transaksi yang membaca hasil berbeda karena ada penyisipan data oleh transaksi lain.

4. Serializable Tunjukkan isolasi penuh sehingga transaksi lain tidak dapat menyisipkan data pada rentang yang sedang diakses.

5. Snapshot Tunjukkan bagaimana snapshot isolation memberikan konsistensi tanpa mengunci data.

