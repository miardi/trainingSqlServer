1.Buatlah sebuah CTE untuk menghitung total penjualan bulanan dari tabel Sales dan mencari bulan dengan total penjualan tertinggi. Tampilkan kolom:
Bulan
Total Penjualan Bulanan
Indikasi apakah bulan tersebut memiliki penjualan tertinggi ("Ya" atau "Tidak").
WITH penjualanBulanan AS (
	SELECT 	FORMAT(SaleDate,'MM-yyyy') AS bulan, 
			SUM(Amount) AS totalPenjualan FROM Sales
	GROUP BY FORMAT(SaleDate,'MM-yyyy')
),
maxP AS (
	SELECT 	MAX(totalPenjualan) AS maxPenjualan
	FROM penjualanBulanan
)
SELECT 	*,
		CASE 
			WHEN totalPenjualan = (SELECT maxPenjualan FROM maxP) THEN 'YA'
			ELSE 'TIDAK'
		END AS penjualanTertinggi
FROM penjualanBulanan


2.Buatlah sebuah query untuk menghitung total penjualan per karyawan, termasuk hanya karyawan yang memiliki penjualan lebih besar dari rata-rata semua penjualan.




--TAMBAHAN SOAL DARI EXERCIRE 3 :
5. CTE: Buat query untuk menghitung total stok per kategori menggunakan CTE.
	WITH StokPerKategori AS (
		SELECT Kategori, SUM(Stok) AS TotalStok FROM Produk
		GROUP BY Kategori
	)
	SELECT * FROM StokPerKategori

6. CTE dan Join: Gunakan CTE untuk menghitung penjualan per produk, lalu gabungkan dengan tabel produk untuk menampilkan nama produk, kategori.
	WITH penjualanTiapProduk(
		SELECT ProdukID, SUM(JumlahTerjual) AS totalPenjualan
		FROM Penjualan
		GROUP BY ProdukID
	)
	SELECT NamaProduk, totalPenjualan
	FROM penjualanTiapProduk p
	JOIN Produk ON p.ProdukID = Produk.ProdukID