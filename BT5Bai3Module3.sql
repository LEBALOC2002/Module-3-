USE QuanLySinhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject 
where  credit = (SELECT MAX(credit) FROM subject); 

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject 
WHERE sudID = (
SELECT sudID FROM mark 
WHERE Mark = (SELECT MAX(Mark) FROM Mark)
);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần.
SELECT *, AVG(m.mark) FROM student s 
INNER JOIN mark m ON s.studentID = m.studentID
GROUP BY s.studentID
ORDER BY AVG(m.mark) DESC;