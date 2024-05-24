-- create database
CREATE DATABASE IF NOT EXISTS aliendb;


SELECT 'DATABASE CREATED ...' as 'INFO';

-- active database 
USE aliendb;

-- create tables 

SELECT 'CREATING TABLES ...' as 'INFO';

CREATE TABLE department(
		DEPT_ID INT NOT NULL,
		DEPT_NAME VARCHAR(30) NOT NULL,
		LOCATION VARCHAR(30) NOT NULL,
		PRIMARY KEY(DEPT_ID)
);

CREATE TABLE course(
	COURSE_ID INT NOT NULL,
	COURSE_NAME VARCHAR(30) NOT NULL,
	COURSE_DURATION INT NOT NULL,
	COURSE_FEE DOUBLE NOT NULL,
	PRIMARY KEY(COURSE_ID)
);

CREATE TABLE student(
	ID INT NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	SECTION CHAR(1) NOT NULL,
	DEPT_ID INT NOT NULL,
	COURSE_ID INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(DEPT_ID) REFERENCES department(DEPT_ID),
	FOREIGN KEY(COURSE_ID) REFERENCES course(COURSE_ID)
);


SELECT 'TABLES CREATED ...' as 'INFO';


SELECT 'INSERTING DATA ...' as 'INFO';

-- insert the data into the tables 
-- Inserting values into department table
INSERT INTO department (DEPT_ID, DEPT_NAME, LOCATION)
VALUES 
  (1, 'Computer Science', 'Building A, Room 101'),
  (2, 'Electrical Engineering', 'Building B, Room 202'),
  (3, 'Mechanical Engineering', 'Building C, Room 303'),
  (4, 'Mathematics', 'Building D, Room 404'),
  (5, 'Physics', 'Building E, Room 505');

-- Inserting values into course table
INSERT INTO course (COURSE_ID, COURSE_NAME, COURSE_DURATION, COURSE_FEE)
VALUES 
  (101, 'Introduction to Programming', 10, 500.00),
  (102, 'Digital Circuits', 12, 600.00),
  (103, 'Mechanics and Dynamics', 15, 700.00),
  (104, 'Calculus I', 8, 400.00),
  (105, 'Classical Mechanics', 14, 800.00);

-- Inserting values into student table
INSERT INTO student (ID, NAME, SECTION, DEPT_ID, COURSE_ID)
VALUES 
  (201, 'John Smith', 'A', 1, 101),
  (202, 'Jane Doe', 'B', 2, 102),
  (203, 'Bob Johnson', 'A', 3, 103),
  (204, 'Alice Brown', 'B', 4, 104),
  (205, 'Charlie White', 'A', 5, 105);


SELECT 'INSERTION COMPLETED ...' as 'INFO';
