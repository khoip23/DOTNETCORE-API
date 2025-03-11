INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'STING',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'NUMBER1',1,14000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'PEPSI',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'COCACOLA',1,12000)

UPDATE SAN_PHAM
SET giaBan = giaBan + giaBan * 20 / 100
WHERE maSP % 2 = 0

DECLARE @chietKhau INT = 0.2

DELETE
FROM SAN_PHAM
WHERE maSP % 2 = 1

INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'STING',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'NUMBER1',1,14000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'PEPSI',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'COCACOLA',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'STING',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'NUMBER1',1,14000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'PEPSI',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'COCACOLA',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'STING',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'NUMBER1',1,14000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'PEPSI',1,12000)
INSERT INTO SAN_PHAM(tenSP,soLuong,giaBan) VALUES(N'COCACOLA',1,12000)

DELETE
FROM SAN_PHAM
WHERE maSP >= 6

SELECT maSP, giaBan
From SAN_PHAM

SELECT *
FROM SAN_PHAM

SELECT *
FROM SAN_PHAM
WHERE maSP % 2 = 0

SELECT maSP AS 'Mã sản phẩm', tenSP as 'Tên sản phẩm', soLuong as 'Số lượng', giaBan as 'Gía bán'
FROM SAN_PHAM
WHERE tenSP LIKE 'S%'

SELECT maSP AS 'Mã sản phẩm', tenSP as 'Tên sản phẩm', soLuong as 'Số lượng', giaBan as 'Gía bán'
FROM SAN_PHAM
WHERE tenSP LIKE N'%caco%'

SELECT maSP AS 'Mã sản phẩm', tenSP as 'Tên sản phẩm', soLuong as 'Số lượng', giaBan as 'Gía bán'
FROM SAN_PHAM
ORDER BY giaBan

SELECT maSP AS 'Mã sản phẩm', tenSP as 'Tên sản phẩm', soLuong as 'Số lượng', giaBan as 'Gía bán'
FROM SAN_PHAM
ORDER BY giaBan DESC

DECLARE @pageCount INT = 5
DECLARE @pageSize INT = 10
DECLARE @pageIndex INT = 1

SELECT maSP AS 'Mã sản phẩm', tenSP as 'Tên sản phẩm', soLuong as 'Số lượng', giaBan as 'Gía bán'
FROM SAN_PHAM
ORDER BY giaBan DESC
OFFSET 0 ROW FETCH NEXT 10 ROW ONLY;

-- Tạo bảng phòng ban
CREATE TABLE PhongBan (
    MaPhongBan INT PRIMARY KEY identity,
    TenPhongBan VARCHAR(100) NOT NULL
);

-- Tạo bảng nhân viên với khóa ngoại tham chiếu đến bảng phòng ban
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY identity,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh nvarchar(50) NOT NULL,
    MaPhongBan INT,
    FOREIGN KEY (MaPhongBan) REFERENCES PhongBan(MaPhongBan)
);

-- Thêm dữ liệu vào bảng phòng ban
INSERT INTO PhongBan (TenPhongBan) VALUES
('Phòng Kỹ Thuật'),
('Phòng Kinh Doanh'),
('Phòng Nhân Sự');

-- Thêm 20 nhân viên vào bảng nhân viên
INSERT INTO NhanVien (HoTen, NgaySinh, GioiTinh, MaPhongBan) VALUES
('Nguyễn Văn A', '1990-05-10', 'Nam', 1),
('Trần Thị B', '1992-07-15', 'Nữ', 2),
('Lê Văn C', '1985-12-20', 'Nam', 3),
('Phạm Thị D', '1993-04-03', 'Nữ', 1),
('Hoàng Văn E', '1988-09-30', 'Nam', 2),
('Võ Thị F', '1995-02-14', 'Nữ', 3),
('Bùi Văn G', '1991-06-25', 'Nam', 1),
('Đỗ Thị H', '1994-11-11', 'Nữ', 2),
('Ngô Văn I', '1987-08-19', 'Nam', 3),
('Dương Thị J', '1996-01-23', 'Nữ', 1),
('Cao Văn K', '1993-03-17', 'Nam', 2),
('Lý Thị L', '1990-10-08', 'Nữ', 3),
('Tạ Văn M', '1986-05-29', 'Nam', 1),
('Hồ Thị N', '1997-12-02', 'Nữ', 2),
('Khương Văn O', '1989-07-22', 'Nam', 3),
('Văn Thị P', '1992-09-14', 'Nữ', 1),
('Trịnh Văn Q', '1995-06-05', 'Nam', 2),
('Hứa Thị R', '1991-11-27', 'Nữ', 3),
('Kiều Văn S', '1988-04-12', 'Nam', 1),
('Phùng Thị T', '1993-08-09', 'Nữ', 2);

SELECT MaPhongBan, COUNT(*), (
    SELECT MaNhanVien, HoTen, NgaySinh, GioiTinh
    FROM NhanVien NV2
    WHERE NV1.MaPhongBan = NV2.MaPhongBan
    FOR JSON PATH
) AS ThongTinNhanVien
FROM NhanVien NV1
GROUP BY MaPhongBan

SELECT *
FROM PhongBan

SELECT GioiTinh, COUNT(*)
FROM NhanVien
GROUP BY GioiTinh
HAVING GioiTinh = 'Nam'

/*YÊU CẦU
CHO BIẾT THÔNG TIN NHÂN VIÊN BAO GỒM: MÃ, TÊN, GIỚI TÍNH, NGÀY SINH,TÊN PHÒNG BAN NHÂN VIÊN ĐÓ LÀM VIỆC
*/

SELECT *
FROM NhanVien NV 
FULL OUTER JOIN PhongBan PB 
ON NV.MaPhongBan = PB.MaPhongBan

SELECT NV.*, PB.TenPhongBan
FROM NhanVien NV
INNER JOIN PhongBan PB
ON NV.MaPhongBan = PB.MaPhongBan

go

CREATE PROCEDURE SELECT_TABLE
    @tableName NVARCHAR(50)
AS
BEGIN
    set nocount on;
    SELECT *
    FROM NhanVien
END;

DECLARE @ten_bang NVARCHAR(128) = 'NhanVien'

exec SELECT_TABLE @ten_bang