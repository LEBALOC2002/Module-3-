select * 
from Student ;

select * 
from Student 
where Status = true ;

select * 
from Subject 
where Credit <10 ;

select S.StudentId,S.StudentName , C.ClassName   
from Student S join class C ON S.ClassId = C.ClassID;   

select S.StudentId , S.StudentName ,C.ClassName 
from Student S join class C ON S.ClassId = C.ClassId 
where C.ClassName = 'A1';

select S.StudentId , S.StudentName,Sud.SudName, M.Mark 
from Student S JOIN  Mark M on S.StudentId = M.StudentId join Subject Sud on M.SudId = Sud.SudID ;

select S.StudentId , S.StudentName,Sud.SudName, M.Mark 
from Student S JOIN  Mark M on S.StudentId = M.StudentId join Subject Sud on M.SudId = Sud.SudID 
WHERE Sud.SudName = 'CF'; 
       
