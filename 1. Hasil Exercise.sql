1. Agregasi dengan Fungsi String
Soal:
Gabungkan semua nama karyawan dalam satu departemen.

SELECT 
    UPPER(SUBSTRING(NamaKaryawan, 3, 3)) + '-ACTIVE' AS Hasil
FROM Karyawan
WHERE LEN(NamaKaryawan) > 5;


2. Konversi Format Tanggal
Soal:
Tampilkan TanggalTransaksi dalam format DD-MMM-YYYY HH:MM:SS AM/PM dan hitung jumlah hari hingga tanggal saat ini.
SELECT 	FORMAT(tanggalTransaksi, 'dd-MMM-YYYY HH:mm:ss tt') AS waktu,
		DATEDIFF(DAY, tanggalTransaksi, GETDATE()) AS HariSkr
FROM dbo.Transaksi

3. Kalkulasi dengan Fungsi Waktu
Soal:
Hitung total jam kerja setiap karyawan dalam format XX jam YY menit.
SELECT 	NamaKaryawan,
		DATEDIFF(MINUTE,JamMasuk, JamKeluar)/60 AS Jam, 
		DATEDIFF(MINUTE,JamMasuk, JamKeluar)%60 AS Menit
FROM dbo.Presensi




