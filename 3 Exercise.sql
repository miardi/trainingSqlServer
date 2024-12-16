1. Subquery: Tampilkan nama produk dan kategori untuk produk yang memiliki harga lebih tinggi daripada rata-rata harga semua produk.
SELECT 	NamaProduk,
		Kategori
FROM Produk
WHERE Harga > (
	SELECT AVG(Harga) FROM Produk
)


2. Conditional Expression: Tambahkan kolom Ketersediaan (Virtual Column) untuk menampilkan status produk:
Tersedia jika stok lebih dari 10.
Habis jika stok 0.
Terbatas untuk stok antara 1 hingga 10.
SELECT 	*,
		CASE 
			WHEN Stok > 10 THEN 'Tersedia'
			WHEN Stok = 0 THEN 'Habis'
			WHEN Stok > 0 AND Stok < 11 THEN 'Terbatas'
		END
FROM Produk

3. Subquery dan Join: Tampilkan nama produk, kategori, jumlah terjual untuk semua transaksi.
SELECT	NamaProduk,
		Kategori,
		JumlahTerjual
FROM Penjualan
JOIN Produk
	ON Penjualan.ProdukID = Produk.ProdukID

4. Analisis Conditional Expression: Hitung total pendapatan per kategori. 
SELECT 	Kategori,
		SUM(JumlahTerjual * Harga) AS Pendapatan
FROM Penjualan
JOIN Produk
	ON Penjualan.ProdukID = Produk.ProdukID
GROUP BY Kategori

5. CTE: Buat query untuk menghitung total stok per kategori menggunakan CTE.
6. CTE dan Join: Gunakan CTE untuk menghitung penjualan per produk, lalu gabungkan dengan tabel produk untuk menampilkan nama produk, kategori.
