-- Question 1: Danh sach nhan vien va thong tin phong ban
SELECT *
FROM account a 
JOIN department d on a.departmentID = d.departmentID;

-- Question 2: Thong tin account duoc tao sau ngay 20/12/2010
SELECT *
FROM account
WHERE CreateDate > '2010/12/20';

-- Question 3: Lay thong tin tat ca developer
SELECT *
FROM `account` a
INNER JOIN position p 
ON a.PositionID = p.PositionID
WHERE p.PositionName = 'Developer';

-- Question 4: Danh sach phong ban co so nhan vien >3
SELECT DepartmentName, COUNT(1)
FROM `Account` a 
INNER JOIN department d 
ON a.DepartmentID = d.DepartmentID
GROUP BY a.DepartmentID
HAVING COUNT(*) > 3;

-- Question 5: Danh sach cau hoi duoc su dung nhieu trong de thi
SELECT e.QuestionID AS 'Ma de', COUNT(e.QuestionID) AS SoLanSuDung
FROM Question q
INNER JOIN ExamQuestion e
ON q.QuestionID = e.QuestionID
GROUP BY q.QuestionID 
HAVING COUNT(q.QuestionID) AND COUNT(q.QuestionID) >= 2
ORDER BY COUNT(q.QuestionID) DESC;

-- Question 6: Thong ke Category question duoc su dung trong bao nhieu question
SELECT c.CategoryID, c.CategoryName, COUNT(c.CategoryID) AS 'Số câu hỏi'
FROM CategoryQuestion c 
INNER JOIN Question q 	ON c.CategoryID = q.CategoryID
GROUP BY c.CategoryID 
HAVING COUNT(c.CategoryID)
ORDER BY COUNT(c.CategoryID) DESC;

-- Question 7: Thong ke moi Question duoc su dung trong bao nhieu Exam
