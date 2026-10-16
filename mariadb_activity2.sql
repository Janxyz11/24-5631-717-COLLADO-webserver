--To access the school database 
USE school;

--To show all the tables available in school database
SHOW TABLES;

--To create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

--Check the table
DESCRIBE enrollments;

--Add foreign keys
ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

ALTER TABLE enrollment_date
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

--Check the table
DESCRIBE enrollments;

--Display the students records
SELECT * FROM students;
--Display the courses records
SELECT * FROM courses;

--Inserting records to enrollments
INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, 2026-10-07),
(1, 2, 2026-10-07),
(2, 1, 2026-10-07),
(3, 3, 2026-10-07);

--Check the table
SELECT * FROM enrollments;

--BASIC JOIN to display the actual students names and courses
SELECT
    students.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id;


--Filter display only students enrolled in a specific course
SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.course_id
JOIN courses
    ON enrollments.courses_id = courses.courses_id
WHERE courses.course_name = 'CC6';

--Sorting results display all enrollments alphabetically by student name
SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.course_id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

--To sort in descending order 
ORDER BY students.name DESC;

--Count the number of students
SELCT COUNT(*) AS total_students
FROM students;

--Count the number of student enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments;

--Count Students per Course
SELECT
    courses.course_name,
    COUNT(enrollments.students_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

--Find the popular course
SELECT
    courses.course_name
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;

--Query that displays student id, student name, course, enrollment date
SELECT 
    students.id AS student_id,
    student.name AS student_name,
    courses.cours_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.students_id = students.course_id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;

--Add atleast 5 students records
INSERT INTO students (name, course, year_level)
VALUES
('Kacey Sangbaan', 'BSIT', 3),
('Ivan Dave Mendiola', 'BSIT', 3),
('Alfred Joseph Baladad', 'BSCS', 2),
('Jeus Klein Medina', 'BSCS', 2),
('Mark Collado', 'BSIT', 1),
('Mark Labiano', 'BSCS', 3),
('Joshua Froi Santos', 'BSIT', 1);

--Add atleast 5 records
INSERT INTO students (name, course, year_level)
VALUES
('CC6', 'Emerging Technologies', 2),
('CIT17', 'WEB INFORMATION SYSTEM', 3),
('SOCSCI103N', 'CONTEMPORARY WORLD', 2),
('CC17', 'MOBILE APPLICATION DESIGN', 3),
('CC3', 'OBJECT ORIENTED PROGRAMMING', 3);

--Add atleast 10 enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(5, 4, '2026-10-10'),
(6, 5, '2026-10-10'),
(7, 6, '2026-10-10'),
(8, 7, '2026-10-10'),
(9, 8, '2026-10-10'),
(10, 8, '2026-10-10'),
(11, 8, '2026-10-10');

--Challenge Queries
--Task 1
--Display all the students enrolled in a particular course.
SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'CC6';

--Task 2
--Display all courses taken by a particular student.
SELECT
    students.name AS student_name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE students.id = 1;

--Task 3
--Count the number of students enrolled in each course.
SELECT
courses.course_name,
COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

--Task 4
--Display the course with the highest number of students.
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC
LIMIT 1;

--Task 5
--Display students alphabetically
SELECT
students.name,
courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

--Task 6
--Display the total number of enrollments.
SELECT COUNT(*) AS total_enrollments
FROM enrollments;