-- Drop and Create database
DROP DATABASE IF EXISTS ManagementAssignment;
CREATE	DATABASE ManagementAssignment;
USE ManagementAssignment;

-- creadte table
DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
    DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			VARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE IF NOT EXISTS `Position` (
    PositionID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName 			VARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account` (
    AccountID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email 					VARCHAR(30) NOT NULL UNIQUE KEY,
    UserName 				VARCHAR(30) NOT NULL UNIQUE KEY,
    FullName 				VARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID 				TINYINT UNSIGNED NOT NULL,
    CreateDate 				DATE NOT NULL, 
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group` (
    GroupID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName 				VARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID 				TINYINT NOT NULL UNIQUE KEY,
    CreateDate 				DATE NOT NULL
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE IF NOT EXISTS GroupAccount (
	GroupID 				TINYINT UNSIGNED NOT NULL,
	AccountID 				TINYINT UNSIGNED NOT NULL,
	JoinDate 				DATE NOT NULL,
    PRIMARY KEY(GroupID,AccountID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE,
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE IF NOT EXISTS TypeQuestion (
    TypeID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 				VARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE IF NOT EXISTS CategoryQuestion (
    CategoryID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName 			VARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Question;
CREATE TABLE IF NOT EXISTS Question (
    QuestionID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content 				VARCHAR(50) NOT NULL,
    CategoryID 				TINYINT UNSIGNED NOT NULL,
    TypeID 					TINYINT UNSIGNED NOT NULL,
    CreatorID 				TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate 				DATE NOT NULL,
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE IF NOT EXISTS Answer (
    AnswerID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content 				VARCHAR(50) NOT NULL,
    QuestionID 				TINYINT UNSIGNED NOT NULL,
    IsCorrect 				ENUM('T', 'F'),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE IF NOT EXISTS Exam (
    ExamID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` 					VARCHAR(20) NOT NULL UNIQUE KEY,
    Title 					VARCHAR(50) NOT NULL,
    CategoryID 				TINYINT UNSIGNED NOT NULL,
    Duration 				TINYINT UNSIGNED NOT NULL,
    CreatorID 				TINYINT UNSIGNED NOT NULL,
    CreateDate 				DATE NOT NULL,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
	FOREIGN KEY (CreatorID) REFERENCES Question(CreatorID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE IF NOT EXISTS ExamQuestion (
    ExamID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    QuestionID 				TINYINT UNSIGNED NOT NULL,
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY(QuestionID) REFERENCES Answer(QuestionID) ON DELETE CASCADE
);


-- Insert data demo
INSERT INTO Department 			(DepartmentName)
VALUES							('Ban Giam doc'),
								('Kinh doanh'),
								('Ky Thuat'),
								('Cong doan'),
								('Nhan su'),
								('Cong doan'),
								('Thiet ke'),
								('Bao ve'),
								('Y te'),
								('Su kien');
    
INSERT INTO `Position` 			(PositionName)
VALUES							('Giam doc'),
								('Truong phong kinh doanh'),
								('Truong phong ky thuat'),
								('Truong phong cong doan'),
								('truong phong nhan su'),
								('truong phong cong doan'),
								('Nhan vien'),
								('Cong nhan'),
								('Truong nhom'),
								('nhan vien bao ve');
    
INSERT INTO `Account` 			(Email	,					UserName,			FullName,						DepartmentID,	PositionID,		CreateDate)
VALUES							('tamdiu@gmail.com',		'Tam',				'nguyen Van tam', 				1,				2,				'2019-01-01'),
								('tbgfd@gmail.com',			'Tinh',				'Nguyen thi Tinh', 				5,				4,				'2020-02-04'),
								('vfvf@gmail.com',			'thing',			'Thing Quang Buu', 				9,				5,				'2020-03-02'),
								('thinh344@gmail.com',		'hoc',				'Nguyen Van hoc', 				10,				6,				'2020-04-08'),
								('small3435@gmail.com',		'ghe',				'Ghe ban tu', 					3,				1,				'2019-04-05'),
								('hero3344@gmail.com',		'hong',				'Hoang Thi Hong', 				7,				10,				'2019-05-05'),
								('kienxu23@gmail.com',		'Kien',				'pham van Kien', 				8,				9,				'2019-05-05'),
								('quang45@gmail.com',		'hue',				'Le thi Hue', 					2,				7,				'2019-06-07'),
								('dewrer@gmail.com',		'hue thuong',		'hoang thi thuong', 			4,				8,				'2016-09-02'),
								('tamnguyen@gmail.com',		'truong',			'nguyen quang truong', 			6,				3,				'2015-10-06');

INSERT INTO `Group` 			(GroupName,					CreatorID,				CreateDate)
VALUES							('Group1',					8,						'2020-04-20'),
								('Group2',					5,						'2020-09-29'),
								('Group3',					1,						'2020-02-21'),
								('Group4',					9,						'2020-01-01'),
								('Group5',					3,						'2019-03-13'),
								('Group6',					2,						'2019-01-11'),
								('Group7',					4,						'2018-05-01'),
								('Group8',					10,						'2019-01-04'),
								('Group9',					7,						'2020-02-21'),
								('Group10',					6,						'2019-02-07');
						
INSERT INTO GroupAccount 		(GroupID,		 AccountID,        	JoinDate)
VALUES							(1,			     1,   				'2020-01-05'),
								(2,			     2,   				'2020-01-06'),
								(3,			     3,   				'2018-04-03'),
								(4,			     4,   				'2020-07-01'),
								(5,			     5,   				'2018-07-12'),
								(6,			     6,   				'2018-09-12'),
								(7,			     7,   				'2019-02-17'),
								(8,			     8,   				'2019-08-22'),
								(9,			     9,   				'2020-11-11'),
								(10,		     10,   				'2020-07-04');
                           

INSERT INTO Question 			(Content,			CategoryID,		TypeID,			CreatorID,	CreateDate		)
VALUES							('s1',				1,				3,				4,			'2020-07-02'	),
								('s2',				3,				2,				5,			'2018-02-07'	),
								('s3',				6,				7,				6,			'2018-02-09'	),
								('s4',				2,				8,				2,			'2020-01-03'	),
								('s5',				8,				6,				1,			'2018-07-25'	),
								('s6',				9,				4,				10,			'2019-11-17'	),
								('s7',				10,				5,				9,			'2019-04-18'	),
								('s8',				4,				10,				7,			'2019-08-19'	),
								('s9',				5,				9,				3,			'2018-05-20'	),
								('s10',				7,				1,				8,			'2019-07-09'	);

INSERT INTO Answer 				(Content,			QuestionID,		IsCorrect	)
VALUES							('Content1',			7,				'y'		),
								('Content2',			4,				'y'		),
								('Content3',			8,				'y'		),
								('Content4',			2,				'n'		),
								('Content5',			6,				'y'		),
								('Content6',			9,				'n'		),
								('Content7',			10,				'n'		),
								('Content8',			7,				'y'		),
								('Content9',			1,				'n'		),
								('Content10',			5,				'n'		);


INSERT INTO ExamQuestion 		(QuestionID)
VALUES							(	10	),
								(	2	),
								(	7	),
								(	3	),
								(	8	),
								(	1	),
								(	4	),
								(	6	),
								(	5	),
								(	9	);
