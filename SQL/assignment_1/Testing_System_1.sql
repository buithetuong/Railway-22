DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department,
					Position,
                    `Account`,
                    `Group`,
                    Group_Account,
                    Type_Question,
                    Category_Question,
                    Question,
                    Answer,
                    Exam,
                    Exam_Question;
                    
                    
CREATE TABLE Department
(
	Department_ID			INT AUTO_INCREMENT PRIMARY KEY,
	Department_Name			VARCHAR(100)
);

CREATE TABLE Position
(
	Position_ID				INT AUTO_INCREMENT PRIMARY KEY,		
	Position_Name			ENUM("Dev", "Test", "Scrum Master", "PM")
);

CREATE TABLE `Account`
(
	Account_ID				INT AUTO_INCREMENT PRIMARY KEY,
	 Email					VARCHAR(100),
     Username				VARCHAR(100),
     FullName				VARCHAR(100),
     Department_ID			INT,
     Position_ID			INT,
     CreateDate				DATE
);

CREATE TABLE `Group`
(
	Group_ID				INT AUTO_INCREMENT PRIMARY KEY,
	Group_Name				VARCHAR(100),
    Creator_ID				INT,
    Create_Date				DATE
);

CREATE TABLE Group_Account
(
	Group_ID				INT,
	Account_ID				INT,
	Join_Date				DATE
);

CREATE TABLE Type_Question
(
	Type_ID					INT AUTO_INCREMENT PRIMARY KEY,
	Type_Name				ENUM("Essay", "Multiple-Choice")
);

CREATE TABLE  Category_Question
(
	Category_ID				INT AUTO_INCREMENT PRIMARY KEY,
	Category_Name			VARCHAR(100)
);

CREATE TABLE Question
(
	Question_ID 			INT AUTO_INCREMENT PRIMARY KEY,
	Content					TEXT,
    Category_ID				INT,
    Type_ID					INT,
    Creator_ID				INT,
    Create_Date				DATE
);

CREATE TABLE   Answer
(
	Answer_ID				INT AUTO_INCREMENT PRIMARY KEY,	
	Content					TEXT,
    Question_ID				INT,
    is_Correct				ENUM("True", "False")
);

CREATE TABLE Exam
(
	Exam_ID					INT AUTO_INCREMENT PRIMARY KEY,	
	`Code`					CHAR(10),
	Title 					VARCHAR(100),
    Category_ID				INT,
    Duration				INT,
    Creator_ID				INT,
    Create_Date				DATE
);

CREATE TABLE   Exam_Question
(
	ExamID					INT AUTO_INCREMENT PRIMARY KEY,	
    Question_ID				INT
);
