create database Quanlydiemthi ;
create table HocSinh (
MaHS varchar (20) primary key ,
TenHS varchar (50),
NgaySinh datetime,
Lop varchar (20),
GT varchar(20)
);

create table MonHoc (
MaMH varchar(20) primary key,
TenMH varchar (50)
);

create table BangDiem (
MaHS varchar(20) ,
MaMH varchar (20) ,
DiemThi int ,
NgayKT datetime,
primary key (MaHS,MaMH ),
foreign key(MaHs) references hocsinh (MaHS) ,
foreign key(MaMH) references monhoc (MaMH)
) ;


create table GiaoVien (
MaGV varchar (20) primary key,
TenGV varchar (20),
SDT varchar (10)
);

 alter table monhoc add MaGV varchar(20);
alter table monhoc add constraint FK_MaGV foreign key (MaGV) references giaovien (MaGV);
