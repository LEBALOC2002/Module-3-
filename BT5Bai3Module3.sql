use QUANLYBANHANG ;
-- cau4
select MASP , TENSP 
FROM SANPHAM 
WHERE NUOCSX in ('TRUNG QUOC' ,'VIET NAM ')AND (GIA >= 2000 AND GIA <= 30000) ;


-- select kh.MaKH, kh.HoTen,P.Tensp,Hd.TriGia,ct.MaSP
-- from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
-- inner join cthd ct on hd.hoadon inner join sanpham p on p.MaSP = ct.MaSP 
-- where hd.NgayMuaHang = '2007-01-01';

-- select kh.MaKH, kh.HoTen, sp.TenSP, sp.Gia
-- from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
-- join cthd ct on ct.SoHD = hd.SoHoaDon join sanpham sp on sp.MaSP = ct.MaSP
-- where hd.NgayMuaHang = '2007-01-01';


-- In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong háng 10/2006.
SELECT s.MASP, s.TENSP FROM SANPHAM s
JOIN CTHD ct ON s.MASP = ct.MASP
JOIN HOADON hd ON hd.SoHoaDon = ct.SoHD
JOIN KHACHHANG kh ON kh.MaKH  = hd.MaKH
WHERE kh.HOTEN = 'Nguyen Van A' AND hd.NgayMuaHang like '2006-10-%';

--   Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu? 
-- câu 20
select ROUND( avg (hoadon.trigia))
from hoadon
where NgayMuaHang like '2006-%-%' ;
 
-- câu 26 :In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức giá thấp nhất (của tất cả các sản phẩm).
select *
from sanpham
where NuocSX = 'Trung Quoc'
order by Gia asc
limit 0,3;
