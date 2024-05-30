CREATE DATABASE IF NOT EXISTS maytrainingdb24;

SELECT 'CREATING DATABASE courseDB' as 'INFO';

use maytrainingdb24;

SELECT 'CREATING TABLE students' as 'INFO';

CREATE TABLE IF NOT EXISTS students(
	studentId int AUTO_INCREMENT PRIMARY KEY,
	studentName varchar(255) NOT NULL,
	enrolledCourse varchar(255) NOT NULL,
	joinedDate date NOT NULL,
	phoneNumber BIGINT(255),
	studentAddress VARCHAR(20)
);


SELECT 'INSERTING INTO students table' as 'INFO';

INSERT INTO students (studentName, enrolledCourse, joinedDate, phoneNumber, studentAddress)
VALUES
('Aarav Sharma', 'Computer Science', '2023-01-15', 9876543210, 'Mumbai'),
('Vihaan Verma', 'Electrical Engineering', '2022-07-20', 9123456789, 'Delhi'),
('Siya Patel', 'Mechanical Engineering', '2021-09-10', 9988776655, 'Ahmedabad'),
('Ananya Singh', 'Civil Engineering', '2022-05-30', 9876543211, 'Bangalore'),
('Aditya Gupta', 'Information Technology', '2023-03-25', 9123456788, 'Kolkata'),
('Ishaan Pandey', 'Biotechnology', '2021-12-05', 9988776644, 'Chennai'),
('Aadhya Iyer', 'Chemical Engineering', '2022-08-15', 9876543212, 'Hyderabad'),
('Krishna Rao', 'Aerospace Engineering', '2023-04-18', 9123456787, 'Pune'),
('Saanvi Nair', 'Data Science', '2021-11-22', 9988776633, 'Jaipur'),
('Vivaan Kulkarni', 'Mathematics', '2022-06-12', 9876543213, 'Nagpur');

INSERT INTO students (studentName, enrolledCourse, joinedDate, phoneNumber, studentAddress)
VALUES
('Rohan Mehta', 'Electronics', '2022-04-10', 9123456786, 'Surat'),
('Mira Bose', 'Physics', '2021-10-05', 9988776622, 'Lucknow'),
('Kabir Desai', 'Chemistry', '2023-02-20', 9876543214, 'Vadodara'),
('Anaya Raj', 'Architecture', '2022-09-12', 9123456785, 'Coimbatore'),
('Tara Reddy', 'Software Engineering', '2023-05-15', 9988776611, 'Visakhapatnam'),
('Ayaan Chatterjee', 'Artificial Intelligence', '2021-08-30', 9876543215, 'Patna'),
('Sara Malhotra', 'Cybersecurity', '2022-11-25', 9123456784, 'Indore'),
('Yash Jain', 'Robotics', '2023-03-10', 9988776600, 'Thane'),
('Devika Khanna', 'Environmental Science', '2021-07-18', 9876543216, 'Bhopal'),
('Ira Goswami', 'Marine Engineering', '2022-10-20', 9123456783, 'Guwahati'),
('Aryan Dutta', 'Astronomy', '2023-01-28', 9988776599, 'Ranchi'),
('Nisha Rao', 'Business Administration', '2022-05-22', 9876543217, 'Mysore'),
('Rudra Singh', 'Economics', '2021-09-14', 9123456782, 'Raipur'),
('Sneha Kapoor', 'Finance', '2022-08-05', 9988776588, 'Chandigarh'),
('Arjun Thakur', 'Marketing', '2023-04-12', 9876543218, 'Noida'),
('Pooja Bhatt', 'Human Resources', '2021-12-30', 9123456781, 'Gurgaon'),
('Kunal Mishra', 'Supply Chain Management', '2022-07-28', 9988776577, 'Bhubaneswar'),
('Nidhi Ahuja', 'Hospitality Management', '2023-02-18', 9876543219, 'Vijayawada'),
('Riya Yadav', 'Event Management', '2022-06-10', 9123456780, 'Madurai'),
('Raghav Pillai', 'Tourism', '2021-11-25', 9988776566, 'Jamshedpur');




SELECT 'INSERTION COMPLETED END.' as 'INFO';
	