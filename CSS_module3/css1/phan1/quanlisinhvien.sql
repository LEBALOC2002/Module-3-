SELECT * FROM quanlydiemthi.bangdiem ;
create database QuanLySinhVien ;


use QuanLySinhVien ;


create table class (
ClassID  int not null primary key auto_increment,
ClassclassName varchar(60) not null ,
StartDate datetime  not null,
Status bit
);

create table Student (
StudentID int not null primary key auto_increment,
StudentName varchar(30) not null,
Address varchar (50),
Phone varchar (20),
Status bit ,
ClassID int not null
);

create table Subject (
SudID int not null primary key auto_increment,
SudName varchar(30) not null ,
Credit tinyint not null default 1 check (Credit >= 1 ),
Status bit default 1  
);

create table Mark (
MarkID int not null primary key auto_increment,
SudId int not null  unique key ,
StudentID int not null ,
Mark float default 0 check ( Mark between 0 AND 100 ),
ExamTimes tinyint default 1 ,
unique (SudID , StudentId ),
foreign key (SudID ) references Sud(SudID),
foreign key(StudentID) references student (StudentId)
);