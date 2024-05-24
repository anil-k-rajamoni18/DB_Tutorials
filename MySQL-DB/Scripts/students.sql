CREATE DATABASE IF NOT EXISTS CourseDB;

SELECT 'CREATING DATABASE courseDB' as 'INFO';

use CourseDB;

SELECT 'CREATING TABLE students' as 'INFO';

CREATE TABLE IF NOT EXISTS students(
	studentId int AUTO_INCREMENT PRIMARY KEY,
	studentName varchar(20) NOT NULL,
	enrolledCourse varchar(20) NOT NULL,
	joinedDate date NOT NULL,
	phoneNumber INTEGER,
	studentAddress VARCHAR(20)
);


SELECT 'INSERTING INTO students table' as 'INFO';

INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("manoj","java","2023-03-03","VA");
	
	
INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("lavanya","ruby","2023-04-03","NJ");
	

INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("avinash","python","2023-10-03","AZ");
	
	
INSERT INTO students (studentName,enrolledCourse,joinedDate,studentAddress)
	values("Muneendra","datascience","2023-08-10","CT");


SELECT 'INSERTION COMPLETED END.' as 'INFO';
	