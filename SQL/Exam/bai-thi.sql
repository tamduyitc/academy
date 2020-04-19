-- Question a
-- drop and create database
DROP DATABASE IF EXISTS Managementstudent;
CREATE DATABASE Managementstudent;
USE Managementstudent;

-- create tab Student
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
		RN				NVARCHAR(10) PRIMARY KEY,
        `Name`			NVARCHAR(40) NOT NULL,
        Age				DATE NOT NULL,
        Gender			ENUM ('0', '1') NULL
);

-- create tab Subject
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`(
		sID				MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        sName			NVARCHAR(40) NOT NULL
);

-- create tab StudentSubject
DROP TABLE IF EXISTS StudentSubject;
CREATE TABLE StudentSubject(
		RN 				NVARCHAR(10),
		sID				MEDIUMINT UNSIGNED,
        Mark			DECIMAL UNSIGNED NULL,
        `Date`			DATE NULL,
        FOREIGN KEY(sID) REFERENCES `Subject`(sID),
        FOREIGN KEY(RN) REFERENCES Student(RN)
);

-- Insert database
INSERT INTO Student			(RN,				`Name`, 			Age, 				Gender)
VALUE						('A1',				'Hồng',				'2000/05/06',		'1'),
							('A2',				'Hương',			'2000/07/07',		'0'),
							('A3',				'Thịnh',			'2000/05/06',		'1');
                            
INSERT INTO `Subject`		(sID,				`sName`)
VALUE						('1',				'Tiếng Việt'),
							('2',				'Tiếng Anh'),
							('3',				'Toán'),
                            ('4',				'Hóa'),
                            ('5',				'Lịch Sử'),
							('6',				'Vật Lý');
                            
 INSERT INTO StudentSubject	(RN,				sID, 				Mark, 				`Date`)
VALUE						('A1',				'1',				'10',				'2020/04/11'),
							('A2',				'1',				'8.5',				'2020/04/10'),
							('A3',				'3',				NULL,				NULL),
                            ('A2',				'1',				'8',				'2020/04/10'),
                            ('A1',				'5',				NULL,				NULL),
                            ('A2',				'2',				'2',				'2020/04/10');


-- Question b 
	-- Question b-a: Viet lenh de lay ra tat ca cac mon hoc khong co diem nao
SELECT s.`sName`
FROM `Subject` s
JOIN StudentSubject st ON s.sID = st.sID
WHERE st.Mark IS NULL;


	-- Question b-b: Lay danh sach cac mon hoc co it nhat 2 diem
SELECT COUNT(1), s.`sName`
FROM `Subject` s
JOIN StudentSubject st ON s.sID = st.sID
GROUP BY s.`sName`
HAVING COUNT(*) > 2;

-- Question C: Tao studentinfo view co cac thong tin hoc sinh gom: RN, sID, Name, Age, Gender, Mark, Date 
-- voi cot Gender Show Male de thay the cho 0, Female thay the cho 1 va Unknow thay the cho null
-- delete view
DROP VIEW IF EXISTS studentinfo;
CREATE VIEW studeninfo AS
SELECT stj.RN, stj.sID, s.`Name`, s.Age, s.Gender, stj.Mark, stj.`Date`
FROM StudentSubject stj
JOIN `Subject` sj ON stj.sID = sj.sID
JOIN Student s ON stj.RN = s.RN;

-- Question d: Tao Trigger
-- d-a 
DROP TRIGGER IF EXISTS Casupdate;
DELIMITER $$
	CREATE TRIGGER Casupdate
    BEFORE UPDATE ON StudentSubject
    FOR EACH ROW
    BEGIN
		UPDATE
        FROM StudentSubject
		WHERE sID = NEW.sID
	END $$
DELIMITER ;





