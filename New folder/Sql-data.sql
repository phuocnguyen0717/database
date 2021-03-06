CREATE DATABASE SQL1

USE SQL1

Create Table LapTop(
NhomLapTop nvarchar(20)PRIMARY KEY,
TenLapTop nvarchar(20) ,
GiaBan nvarchar(20) NOT NULL,
ThuongHieu nvarchar(20)NOT NULL,
Soluong int NOT NULL,
NgayXB date NOT NULL,
CONSTRAINT PK_NhomLapTop PRIMARY KEY (NhomLapTop,TenLapTop)


)

GO
CREATE Table KhachHang(
MaKH varchar(20),
HoTen nvarchar(50)NOT NULL,
DiaChi nvarchar(20)NOT NULL,
Sdt VARCHAR(12) NOT NULL,
Email nvarchar(50) NOT NULL,
CONSTRAINT PK_MaKH PRIMARY KEY (MaKH)
)

GO
CREATE Table PhongBan(
MaPB nvarchar(20),
TenPB nvarchar(50)NOT NULL,
CONSTRAINT PK_MaPB PRIMARY KEY (MaPB)
)

GO
CREATE TABLE NhanVien(
MaNV nvarchar(20),
TenNV nvarchar(50)NOT NULL,
DiaChi nvarchar(20)NOT NULL,
ChucVu nvarchar(50)NOT NULL,
SDT nvarchar(20)NOT NULL,
CMND VARCHAR(12)NOT NULL,
GioiTinh bit NOT NULL,
CONSTRAINT PK_MaNV PRIMARY KEY (MaNV)
)



GO 
Create Table HoaDon(
MaHD nvarchar(20),
NVxuatHD nvarchar(20)NOT NULL,
NgayXuatHD date NOT NULL,

CONSTRAINT PK_MaHD PRIMARY KEY (MaHD)
)

GO
Create Table Chinhsach(
KhuyenMai nvarchar(20)NOT NULL,
DoiTra nvarchar(20)NOT NULL,
BaoHanh nvarchar(20) NOT NULL,
CONSTRAINT PK_KhuyenMai PRIMARY KEY (KhuyenMai)

)

ALTER TABLE DBO.PhongBan ADD CONSTRAINT FK_PhongBan_MaPB FOREIGN KEY (MAPB) REFERENCES DBO.NhanVien(MaNV)
ALTER TABLE DBO.NhanVien ADD CONSTRAINT PK_NhanVien_MaNV FOREIGN KEY (MaNV) REFERENCES DBO.HoaDon(MaHD)
ALTER TABLE DBO.KhachHang ADD CONSTRAINT PK_KhachHang_MaKH FOREIGN KEY (MaKH) REFERENCES DBO.NhanVien(MaNV)
ALTER TABLE DBO.HoaDon ADD CONSTRAINT PK_HoaDon_MaHD FOREIGN KEY (MaHD) REFERENCES DBO.KhachHang(MaKH)
ALTER TABLE DBO.LapTop ADD CONSTRAINT FK_LapTop_Chinhsach FOREIGN KEY (NhomLapTop) REFERENCES DBO.Chinhsach(KhuyenMai)
ALTER TABLE DBO.LapTop ADD CONSTRAINT FK_LapTop_KhachHang FOREIGN KEY (NhomLapTop) REFERENCES DBO.KhachHang(MaKH)

INSERT INTO PhongBan VALUES (1 ,N'Khu tiếp thị và tư vấn')
INSERT INTO PhongBan VALUES (2,N'Khu giao dịch')
INSERT INTO PhongBan VALUES (3 ,N'Khu bảo hành và lưu trữ')

INSERT INTO NhanVien VALUES(0001,N'Nguyễn Thiện',N'Bình Định',N'Trưởng phòng 1',0354117308,318224735,1)
INSERT INTO NhanVien VALUES(0002,N'Phạm Hồng',N'Hồ Chí Minh',N'Trưởng phòng 2',098347308,311008650,0)
INSERT INTO NhanVien VALUES(0003,N'Phan Tài',N'Tiền Giang',N'Nhân viên bán hàng',0823428688,201574233,1)
INSERT INTO NhanVien VALUES(0004,N'Trần Hí',N'Sóc Trăng',N'Nhân viên tiếp thị',0902246630,402920020,1)
INSERT INTO NhanVien VALUES(0005,N'Nguyễn My',N'Hà Nội',N'Nhân viên',0907773909,201529001,0)
INSERT INTO NhanVien VALUES(0006,N'Nguyễn Tuấn',N'Đắk Lắk',N'Nhân viên',0933310022,201229001,1)
INSERT INTO NhanVien VALUES(0007,N'Nguyễn Long',N'Đắk Lắk',N'Nhân viên',090113220,201221323,1)
INSERT INTO NhanVien VALUES(0008,N'Trần Đức',N'Tiền Giang',N'Nhân viên ',0823428688,124556999,1)


SELECT * FROM NhanVien WHERE ChucVu=N'Nhân viên'
--KhachHang
INSERT INTO KhachHang VALUES(1111,'NGUYEN T',N'TP Hồ Chí Minh',01236788,'quanp504@gmail.com')
INSERT INTO KhachHang VALUES(0112,N'Nguyễn Anh Tuấn',N'TP Hồ Chí Minh',01234567,'anhtuan@gmail.com')
INSERT INTO KhachHang VALUES(2111,'VO SY KHA',N'TP Hồ Chí Minh ',014345767,'sykha113@gmail.com')
INSERT INTO KhachHang VALUES(3111,'NGUYEN ANH TUAN',N'TP Hồ Chí Minh',01234587,'anhtuan2@gmail.com')
INSERT INTO KhachHang VALUES(4111,'NGUYEN ANH CHANCEL',N'TP Đà Nẵng',01234567,'anhtuan3@gmail.com')
INSERT INTO KhachHang VALUES(5111,'NGUYEN TUAN JSOO',N'TP Buôn Mê Thuột',012345557,'anhtuan4@gmail.com')
INSERT INTO KhachHang VALUES(6111,'NGUYEN T QUI',N'TP Đà Nẵng',012344447,'thanhqui4@gmail.com')
INSERT INTO KhachHang VALUES(7111,'NGUYEN Thanh QUI',N'TP Đà Nẵng',0123333347,'thanhqui504@gmail.com')
INSERT INTO KhachHang VALUES(8111,'NGUYEN QUI',N'TP Buôn Mê Thuột',0111111117,'thanhqui0504@gmail.com')
INSERT INTO KhachHang VALUES(9111,'NGUYEN Q PHUOC',N'TP Buôn Mê Thuột',0123333347,'quanphuoc504@gmail.com')


--hoadon
INSERT INTO HoaDon VALUES ('LT1','VO SY KHA','2020-02-02')
INSERT INTO HoaDon VALUES ('LT2','VO  KHA','2020-02-03')
INSERT INTO HoaDon VALUES ('LT3','NGUYEN ANH TUAN','2020-02-04')
INSERT INTO HoaDon VALUES ('LT4','NGUYEN ANH ','2020-02-05')
INSERT INTO HoaDon VALUES ('LT5','NGUYEN ANH T','2020-02-06')
INSERT INTO HoaDon VALUES ('LT6','NGUYEN ANH TU','2020-02-07')
INSERT INTO HoaDon VALUES ('LT7','VO SY ','2020-02-08')
INSERT INTO HoaDon VALUES ('LT8',' SY KHA','2020-02-09')
INSERT INTO HoaDon VALUES ('LT9','VOHA','2020-02-10')
INSERT INTO HoaDon VALUES ('LT10','VO SY HA','2020-02-011')

insert into LapTop values (N'Sinh viên-văn phòng','VivoBook 14 A412FA ',10000000, 'ASUS', 2, '2001-02-18' )
insert into LapTop values (N'Sinh viên-văn phòng','Inspiron 3580',13000000, 'DELL', 3, '2019-04-18' )
insert into LapTop values (N'Gaming','Pavilion 15',20000000, 'HP', 2, '2010-05-08' )
insert into LapTop values (N'Gaming','OMEN 15',40000000, 'HP', 4, '2020-05-18' )
insert into LapTop values (N'Đồ họa','Nitro 5 ',30000000, 'ACER', 2, '2019-07-10' )
insert into LapTop values (N'Đồ họa','Nitro 10 ',40000000, 'ACER', 3, '2020-06-17' )
insert into LapTop values (N'Mini','Pavilion X360  ',22000000, 'HP', 5, '2020-07-13' )
insert into LapTop values (N'Mini','VivoBook X407MA',18000000, 'ASUS', 1, '2020-09-09' )
insert into LapTop values (N'Gaming','Legion Y7000 ',29000000, 'LENOVO', 4, '2020-10-10' )
insert into LapTop values (N'văn phòng','Aspire 3 A315',13000000, 'ACER', 2, '2019-08-07' )

insert into Chinhsach values('15%',N'30 ngày sau khi mua',N'1 năm') 
insert into Chinhsach values('25%',N'1 đổi 1 do lỗi sx','2 năm') 
insert into Chinhsach values('35%',N'mua phụ kiện',N'1 năm') 


Select * FROM PhongBan
Select * FROM NhanVien
Select * From HoaDon
Select * From KhachHang
Select * From LapTop
Select * From Chinhsach

--xuất thông tin các nhân viên có chức vụ chỉ là nhân viên
SELECT * FROM NhanVien WHERE ChucVu=N'Nhân viên'
--Xuất mã nhân viên, tên nhân viên , giới tính nam và thay đổi cột giới tính thành nam từ bảng NhanVien
SELECT MaNV, TenNV, GioiTinh As N'Nam' From NhanVien Where GioiTinh ='1' 
--xuất ra số nhân viên nữ trong bảng NhanVien
Select COUNT(GioiTinh) as N'Nữ' from NhanVien NV  where GioiTinh= '0'
--Số lượng máy  còn hàng và giá trên 15 triệu
SELECT SUM(Soluong) As N'Sản phẩm trên 15 triệu' From LapTop WHERE GiaBan>15000000 
--Xuất dữ liệu các sản phẩm dành cho sinh viên 
SELECT * FROM LapTop WHERE NhomLapTop=N'Sinh viên-văn phòng'
--Xuất dữ liệu đồ họa hoặc gaming
SELECT * FROM LapTop WHERE NhomLapTop=N'Gaming' or NhomLapTop=N'Đồ họa'
--Xuất chính sách duy trình 1 năm cho người dùng
SELECT * FROM Chinhsach WHERE BaoHanh = N'1 năm'
--Xuất tên laptop thuộc top 3 đắt tiền 
SELECT TOP 3 TenLapTop, ThuongHieu,GiaBan From LapTop Order by GiaBan desc, TenLapTop
--xuất ra nhân viên bán hàng thuộc khu Khu tiếp thị và tư vấn
SELECT TenNV,DiaChi ,ChucVu, PB.TenPB  FROM NhanVien NV,PhongBan PB WHERE TenPB=N'Khu tiếp thị và tư vấn' and ChucVu=N'Nhân viên tiếp thị'
--- xuất tất cả thông tin khách hàng 
SELECT  HoTen ,  DiaChi, Sdt    FROM KhachHang    WHERE DiaChi = N'TP Hồ Chí Minh'
SELECT  HoTen ,  DiaChi, Sdt  ,Email   MaKH   FROM KhachHang    WHERE DiaChi = N'TP Hồ Chí Minh'
SELECT  HoTen ,  DiaChi, Sdt  ,Email   MaKH   FROM KhachHang    WHERE DiaChi = N'TP Buôn Mê Thuột'
SELECT  HoTen ,  DiaChi, Sdt    FROM KhachHang    WHERE DiaChi = N'TP Buôn Mê Thuột'
SELECT  HoTen ,  DiaChi, Sdt  ,Email   MaKH   FROM KhachHang    WHERE DiaChi = N'TP Đà Nẵng'  
SELECT  HoTen ,  DiaChi, Sdt    FROM KhachHang    WHERE DiaChi = N'TP Đà Nẵng'
--- xuất số lượng  laptop các loại còn hàng nhiều hơn 2 
SELECT Soluong,COUNT(*) AS 'số lượng máy '  FROM LapTop  GROUP BY Soluong  HAVING COUNT(*) > 2
--- xuất số lượng  laptop các loại còn hàng bằng 1 
SELECT Soluong,COUNT(*) AS 'số lượng máy '  FROM LapTop  GROUP BY Soluong  HAVING COUNT(*) = 1
---xuất nhân viên có họ là Nguyễn 
SELECT MaNV ,TenNV
FROM NhanVien
WHERE MaNV IN (
SELECT MaNV
FROM NhanVien NV
WHERE NV.TenNV LIKE N'%Nguyễn%'
)
--Xuất ra những nhân viên có sđt dưới 10 chữ số 
SELECT *
FROM NHANVIEN
WHERE SDT > ANY (
SELECT SDT
FROM NHANVIEN
WHERE SDT < 100000000
)
--Xuất ra các hóa đơn trong 5 ngày đầu tiên 
SELECT Top 5 MaHD,NgayXuatHD
FROM HoaDon
Order by NgayXuatHD asc, MaHD

