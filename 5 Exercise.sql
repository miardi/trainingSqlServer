1. Buat tabel untuk mencatat perubahan data pelanggan dengan menggunakan konsep audit trail, lalu tuliskan query untuk melihat riwayat perubahan data untuk pelanggan tertentu.

SELECT 
    OldValue,
    NewValue,
    ChangedBy,
    ChangedDateTime
FROM 
    CustomerAudit
WHERE 
    CustomerID = 1
ORDER BY 
    ChangedDateTime ASC;
