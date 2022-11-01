use quanlysinhvien ;
insert into class 
values (1,'A1','2008-12-20' ,1 );
insert into class
values (2,'A2','2008-12-22',1);
insert into class
values(33,'B3',current_date,0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
values ('Hung' , 'HA NOI' , '0912113113',1,1);
insert INTO Student (StudentName , address ,Status, ClassId) 
values ('Hoa ', 'HAI PHONG' ,1,1);
insert into Student (StudentName,Address,Phone ,Status , ClassId)
values('Manh' , 'HCM' , '0123123123' , 0 ,2 );

insert into Subject 
values (1,'CF',5,1);
insert INTO Subject 
values(2,'C',6,1);
insert INTO Subject 
values (3,'HDJ' , 5,1);
insert into Subject 
values(4,'LE BA LOC ', 10 ,1);


insert INTO Mark (SudId ,StudentId , Mark , ExamTimes)
values (2,1,8,1),
	   (3,2,10,2),
       (4,1,12,1);
