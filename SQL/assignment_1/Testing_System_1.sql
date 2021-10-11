DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department,
					`Position`,
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
	Department_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Department_Name			VARCHAR(100) NOT NULL
);

CREATE TABLE `Position`
(
	Position_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,		
	Position_Name			ENUM("Dev", "Test", "Scrum Master", "PM") DEFAULT "Dev"
);

CREATE TABLE `Account`
(
	Account_ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	 Email					VARCHAR(100) UNIQUE NOT NULL,
     Username				VARCHAR(100) UNIQUE NOT NULL,
     FullName				VARCHAR(100) NOT NULL,
     gender 			    BIT DEFAULT 1,
     Department_ID			TINYINT UNSIGNED,
     Position_ID			TINYINT UNSIGNED,
     Create_Date			DATE,
     FOREIGN KEY(Department_ID) REFERENCES Department(Department_ID),
     FOREIGN KEY(Position_ID) REFERENCES `Position`(Position_ID)
);

CREATE TABLE `Group`
(
	Group_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Group_Name				VARCHAR(100) NOT NULL,
    Creator_ID				INT UNSIGNED,
    Create_Date				DATE,
    FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

CREATE TABLE Group_Account
(
	Group_ID				TINYINT UNSIGNED,
	Account_ID				INT UNSIGNED,
	Join_Date				DATE,
    PRIMARY KEY(Group_ID, Account_ID),
    FOREIGN KEY(Group_ID) REFERENCES `Group`(Group_ID),
    FOREIGN KEY(Account_ID) REFERENCES `Account`(Account_ID)
);

CREATE TABLE Type_Question
(
	Type_ID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Type_Name				ENUM("Essay", "Multiple-Choice") DEFAULT "Multiple-Choice"
);	

CREATE TABLE  Category_Question
(
	Category_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Category_Name			VARCHAR(100) NOT NULL
);

CREATE TABLE Question
(
	Question_ID 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content					TEXT,
    Category_ID				TINYINT UNSIGNED,
    Type_ID					TINYINT UNSIGNED,
    Creator_ID				INT UNSIGNED,	
    Create_Date				DATE,
    FOREIGN KEY(Type_ID) REFERENCES Type_Question(Type_ID),
    FOREIGN KEY(Category_ID) REFERENCES Category_Question(Category_ID),
    FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

CREATE TABLE   Answer
(
	Answer_ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,	
	Content					TEXT,
    Question_ID				INT UNSIGNED,
    is_Correct				ENUM("True", "False") DEFAULT "True",
    FOREIGN KEY(Question_ID) REFERENCES Question(Question_ID)
);

CREATE TABLE Exam
(
	Exam_ID					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,	
	`Code`					CHAR(10) UNIQUE NOT NULL,
	Title 					VARCHAR(100)NOT NULL,
    Category_ID				TINYINT UNSIGNED,
    Duration				TINYINT UNSIGNED,
    Creator_ID				INT UNSIGNED,
    Create_Date				DATE,
    FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

CREATE TABLE   Exam_Question
(
	Exam_ID					INT UNSIGNED,
    Question_ID				INT UNSIGNED,
    PRIMARY KEY(Exam_ID,Question_ID),
    FOREIGN KEY(Exam_ID) REFERENCES Exam(Exam_ID),
    FOREIGN KEY(Question_ID) REFERENCES Question(Question_ID)
);
