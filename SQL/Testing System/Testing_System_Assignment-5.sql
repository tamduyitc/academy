-- Question 1: Tao view chua danh sach nhan vien thuoc phong ban sale
-- Drop data view
DROP VIEW IF EXISTS saleview;
CREATE VIEW saleview AS
		SELECT *
        FROM department
		WHERE DepartmentName = 'Sale';
SELECT *
FROM	( 	SELECT *
			FROM department d
			JOIN `account` a ON d.departmentID = a.DepartmentID
            WHERE	DepartmentName = 'Sale') AS saleview;
-- Hien thi view saleview
SELECT *
FROM saleview;

-- Question 2: Tao view chua thong tin account tham gia nhieu group nhat
DROP VIEW IF EXISTS accjoinmax;
CREATE VIEW accjoinmax AS
		SELECT *
		FROM `account` a1
		WHERE AccountID;
        
        
-- Question 3: 