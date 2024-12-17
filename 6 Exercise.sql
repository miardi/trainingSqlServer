Soal 
1.Pencarian Kamar yang Tersedia Tampilkan semua kamar yang saat ini tersedia untuk dipesan.
SELECT * FROM Rooms
WHERE Status = 'Available'

2.Laporan Pemesanan Per Pelanggan Tampilkan laporan daftar pemesanan untuk setiap pelanggan, termasuk nama pelanggan, jenis kamar, tanggal check-in, dan tanggal check-out.
SELECT 	FullName,
		RoomType,
		CheckInDate,
		CheckOutDate
FROM Bookings b 
JOIN Customers cu ON b.CustomerID = cu.CustomerID
JOIN Rooms r ON b.RoomID = r.RoomID

3.Validasi Ketersediaan Kamar Sebelum Pemesanan Tulis query untuk memeriksa apakah kamar tertentu tersedia pada rentang tanggal tertentu.
DECLARE @roomID INT = 1,
		@checkInDate DATE = '2024-12-24',
		@checkOutDate DATE = '2024-12-26';

WITH dateRanges AS (
	SELECT @checkInDate AS date
	UNION ALL
	SELECT DATEADD(DAY, 1, date)
	FROM dateRanges
	WHERE DATEADD(DAY, 1, date) <= @checkOutDate 
),
bookedRoom AS (
	SELECT 	*
	FROM Bookings
	JOIN dateRanges 
	ON date BETWEEN CheckInDate AND CheckOutDate 
	WHERE RoomID = @roomID
)
SELECT 	RoomID = @roomID,
		dR.date,
		CASE 
			WHEN BookingStatus = 'Active' THEN 'BOOKED'
			ELSE 'AVAILABLE'
		END AS status,
		*
FROM bookedRoom bR
RIGHT JOIN dateRanges dR
ON bR.date = dR.date


