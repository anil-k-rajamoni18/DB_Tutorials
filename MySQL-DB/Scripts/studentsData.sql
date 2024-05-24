CREATE DATABASE IF NOT EXISTS SQLPYTHON;

use SQLPYTHON;

CREATE TABLE IF NOT EXISTS students(
	studentId int AUTO_INCREMENT PRIMARY KEY,
	studentName varchar(20) NOT NULL,
	enrolledCourse varchar(20) NOT NULL,
	joinedDate date NOT NULL,
	phoneNumber INTEGER,
	studentAddress VARCHAR(20)
);

INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("manoj","java","03-03-2023","VA");
	
	
INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("lavanya","ruby","04-03-2023","NJ");
	

INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("avinash","python","10-03-2023","AZ");
	
	
INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("Muneendra","datascience","03-04-2023","CT");
	
	
