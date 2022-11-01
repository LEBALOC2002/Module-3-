use QUANLYBANHANG ;
-- câu2:Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
alter table sanpham
add GHICHU varchar(20);


-- câu3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
alter table KHACHHANG 
ADD LOAIKH TINYINT ;

-- cau4
select MASP , TENSP 
FROM SANPHAM 
WHERE NUOCSX in ('TRUNG QUOC' ,'VIET NAM ') AND (GIA >= 2000 AND GIA <= 30000) ;

-- câu5 : Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
alter table SANPHAM
DROP COLUMN GHICHU ;

-- câu 6 : Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang ai”, “Thuong xuyen”, “Vip”, …
alter table KHACHHANG
MODIFY COLUMN LOAIKH VARCHAR (100);

-- câu 7 :  Đơn vị tính của sản phẩm chỉ có thể là (“cây”,”hộp”,”cái”,”quyển”,”chục”)
alter table sanpham 
add constraint check_DVT check (DVT = "cây" or DVT = "hộp" or DVT = "cái" or DVT = "quyền" or DVT = "chục") ;

-- câu 8 : Giá bán của sản phẩm từ 500 đồng trở lên.
alter table sanpham
add constraint check_gia check (gia > 500) ;

-- câu 9 : Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.




-- câu 10 : Ngày gia nhập của khách hàng thành viên phải lớn hơn ngày sinh của người đó.
alter table khachhang
add constraint CHECK_NgayDangKi check (NgayDangKi>ngaysinh);

-- câu 11 : Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).


-- truy vấn
-- BÀI 1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất.
select MaSp , TenSP , NuocSX
from sanpham
where NuocSX = 'TRUNG QUOC' ;

-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.
select MaSp , TenSP , DVT
from sanpham
where DVT ="CAY" OR  DVT="QUYEN";

-- BÀI 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MaSP , TenSP 
from sanpham 
where MaSp like 'B_%01';

-- bài 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 2000 đến 10000.
select MaSP , TenSP , NuocSX , gia
FROM sanpham 
where NuocSX = 'Trung Quoc ' and  
( gia >=2000 and gia <=100000 );

-- bài 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ
-- 2000 đến 10000.
select MaSP , TenSP , NuocSX , gia
FROM sanpham 
where NuocSX = 'thai lan ' and  
( gia >=2000 and gia <=100000 );

-- bài 6 In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select SoHoadon , NgayMuaHang
from hoadon
where NgayMuaHang =  "2007-01-01"
   or NgayMuaHang = "2007-01-02";

-- bài 7  In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của óa đơn (giảm dần).

select SOHOADON , NgayMuaHang , TriGia
from HOADON
where NgayMuaHang =  "2007-01-01"
order by trigia;

-- bài 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

select kh.MaKH, kh.HoTen,P.Tensp,Hd.TriGia,ct.MaSP
from khachhang kh
join hoadon hd on kh.MaKH = hd.MaKH
join cthd ct on ct.SoHD = hd.SoHoaDon  
join sanpham p on p.MaSP = ct.MaSP 
where hd.NgayMuaHang = '2007-01-01';


-- bài 9: In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong háng 10/2006 , nhân số lượng  với sản phẩm .  
SELECT s.MASP, s.TENSP, ct.SoLuong, s.Gia , ct.Soluong * s.gia as "tiền "
FROM SANPHAM s
JOIN CTHD ct ON s.MASP = ct.MASP
JOIN HOADON hd ON hd.SoHoaDon = ct.SoHD
JOIN KHACHHANG kh ON kh.MaKH  = hd.MaKH
WHERE kh.HOTEN = 'Nguyen Van A' AND hd.NgayMuaHang like '2006-10-%';


-- 10. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong ngày 10/10/2006.
select sohoadon ,NgayMuaHang,nv.HOTEN , TRIGIA
from hoadon H
join nhanvien NV on NV.MaNV = H.MaNV 
WHERE NV.HOTEN = "Nguyễn Văn B" and H.NgayMuaHang like "2006-10-10" ;

-- BÀI 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT * 
FROM HOADON HD
JOIN cthd ct on ct.soHd = HD.SoHoaDon 
WHERE MaSP = "BB01" OR MaSP = "BB02";

-- bài 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT * 
FROM HOADON HD
JOIN cthd ct on ct.soHd = HD.SoHoaDon 
WHERE (MaSP = "BB01" OR MaSP = "BB02") and
(ct.soluong between 10 and 20);

-- bài 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT * 
FROM HOADON HD
JOIN cthd ct ON hd.SoHoaDon = ct.SoHD
	WHERE ct.MaSP = 'BB01'
	and (ct.SoLuong between 10 and 20)
    and hd.SoHoaDon IN (SELECT hd.SoHoaDon FROM HOADON hd
		JOIN cthd ct ON hd.SoHoaDon = ct.SoHD
		WHERE ct.MaSP = 'BB02');

-- bài 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
select SP.MaSP , SP.TenSP , HD.NgayMuaHang
from sanpham SP
join cthd CT on SP.MaSP = CT.MaSP
join hoadon HD on HD.SOHOADON = CT.SoHD 
WHERE (NuocSX = "TRUNG QUOC") or (NgayMuaHang like "2007-01-01");

-- bài 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT sp.MASP, sp.TENSP 
FROM SANPHAM sp 
WHERE sp.MASP NOT IN (SELECT ct.MASP FROM cthd ct);

-- bài 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT MASP, TENSP 
FROM  SANPHAM
WHERE MASP NOT IN ( SELECT A.MASP
FROM  CTHD A, HOADON B
WHERE A.SOHD=B.sohoadon AND YEAR(NgayMuaHang) like '2006%');

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.
SELECT MASP, TENSP
FROM  SANPHAM
WHERE NUOCSX='TRUNG QUOC' AND
  MASP NOT IN ( SELECT A.MASP
     FROM  CTHD A, HOADON B
     WHERE A.SOHD=B.SOhoadon AND YEAR(NgayMuaHang)=2006);
     
-- 18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?

SELECT DISTINCT SOHD
FROM  CTHD A
WHERE NOT EXISTS(SELECT *
    FROM  SANPHAM B
    WHERE NUOCSX='SINGAPORE' AND
      NOT EXISTS(SELECT *
        FROM  CTHD C
        WHERE C.MASP=B.MASP AND C.SOHD=A.SOHD));
        
-- 19. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select max(trigia) from HOADON ;
select min(trigia) FROM hoadon ;



-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?

select ROUND( avg (hoadon.trigia))
from hoadon
where NgayMuaHang like '2006%' ;

-- 21. Tính doanh thu bán hàng trong năm 2006.SELECT COUNT(DISTINCT MASP)
SELECT COUNT(DISTINCT MASP)
FROM  HOADON A, CTHD B
WHERE A.SOHOADON =B.SOHD AND YEAR(NGAYMUAHANG)=2006;

-- 22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
use quanlybanhang;
SELECT max (hd.trigia) as "Hóa đơn có giá trị cao nhất năm 2006 "
from hoadon hd
where ngaymuahang = "2006%";
-- 23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT AVG(TRIGIA)
FROM  HOADON
WHERE YEAR(NGAYMUAHANG)=2006;


-- 24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
select MaKH,HOTEN, DOANHSO
FROM KHACHHANG 
ORDER BY DOANHSO DESC 
LIMIT 0,3 ;

-- 25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select Masp , TenSP , Gia
from sanpham 
order by gia desc 
limit 0 , 3 ; 

-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của tất cả các sản phẩm).
select MaSP, TenSP, Gia, NuocSX
from sanpham
where NuocSX = "Trung Quoc" and Gia in (select distinct Gia
from sanpham
order by  Gia desc
);
select Gia from sanpham 
where NuocSX = "Trung Quoc" 
order by Gia
limit 0,3;

select sp.MaSP, sp.TenSP, sp.Gia from sanpham sp
inner join (
	select distinct * from sanpham where NuocSX = "Trung Quoc" order by Gia limit 0,3
	) as spMin 
	on sp.Gia = spMin.Gia
where sp.NuocSX = "Trung Quoc";

-- 27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).

select sp.MaSP, sp.TenSP, sp.Gia from sanpham sp
inner join (
	select distinct * from sanpham where NuocSX = "Trung Quoc" order by Gia limit 0,3
	) as spMin 
	on sp.Gia = spMin.Gia
where sp.NuocSX = "Trung Quoc";

-- 28. * In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
select  rank() over (order by kh.DoanhSo desc) MaKH, HoTen, DoanhSo
from khachhang kh
order by DoanhSo desc
limit 0,3;

-- 29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.
select count(MaSP)
from sanpham
where NuocSX = "Trung Quoc";

-- 30. Tính tổng số sản phẩm của từng nước sản xuất.
select NuocSX, count(MaSP)
from sanpham
group by NuocSX;


-- 31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select NuocSX, max(Gia), min(Gia), avg(Gia)
from sanpham
group by NuocSX;

-- 32. Tính doanh thu bán hàng mỗi ngày.
select NgayMuaHang, sum(TriGia) DoanhThu
from hoadon
group by NgayMuaHang;

-- 33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.
select * from 
hoadon hd inner join cthd ct on hd.SoHoaDon = ct.SoHD
where NgayMuaHang = "2006-10-28";

select MaSP, sum(SoLuong)
from hoadon hd, cthd ct
where ct.SoHD = hd.SoHoaDon and (NgayMuaHang = "2006-10-28")
group by MaSP;

-- 34. Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(NgayMuaHang), sum(hd.TriGia) DoanhThu
from hoadon hd
where year(NgayMuaHang) = "2006"
group by month(NgayMuaHang);

-- 35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select hd.MaKH, kh.HoTen
from hoadon hd , khachhang kh
where hd.MaKH is not null and hd.MaKH = kh.MaKH
group by hd.MaKH, kh.HoTen
order by count(hd.MaKH) desc
limit 1;

-- 36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select ct.MaSP, sp.TenSP, sum(SoLuong) as Tong
from cthd ct inner join hoadon hd on ct.SoHD = hd.SoHoaDon
inner join sanpham sp on ct.MaSP = sp.MaSP
where year(NgayMuaHang) = "2006"
group by MaSP
order by Tong                                                   
limit 3;


-- 37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?
select min(doanhso)
from khachhang kh
join hoadon hd on kh.makh = hd.makh 
where ngaymuahang like '2006%';



-- 38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.

SELECT SP.NUOCSX, SP.MASP, SP.TENSP, SP.GIA FROM SANPHAM SP
WHERE GIA IN (SELECT MAX(GIA) FROM SANPHAM GROUP BY NUOCSX)
GROUP BY SP.NUOCSX

-- 39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

SELECT HD.MAKH, KH.HOTEN, COUNT(HD.MAKH) FROM HOADON HD 
JOIN (SELECT MAKH, HOTEN, DOANHSO FROM KHACHHANG 
ORDER BY DOANHSO DESC LIMIT 0,10) AS MAXDOANHSO
ON HD.MAKH  = MAXDOANHSO.MAKH
JOIN KHACHHANG KH
ON HD.MAKH = KH.MAKH
GROUP BY HD.MAKH ORDER BY COUNT(HD.MAKH) DESC LIMIT 0,1

-- 40. *Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
SELECT NUOCSX
FROM  SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA)>=3
