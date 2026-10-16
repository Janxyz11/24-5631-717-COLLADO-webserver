mariadb --version

sudo apt update
sudo apt install mariadb-server mariadb-client -y

mariadb --version

sudo service mariadb status

sudo mariadb

CREATE DATABASE IF NOT EXISTS school;

SHOW DATABASES;

USE school;

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
);

SHOW TABLES;

DESCRIBE students;

INSERT INTO studewnts (name, course, year_level)
VALUES
('Juan Dela Cruz', 'BSIT', 1),
('Maria Santos', 'BSCS', 2),
('Pedro Reyes', 'BSIT', 3);

SELECT * FROM students
WHERE course = 'BSIT';

SELECT * FROM students
WHERE year_level >= 2;

INSERT INTO students (name, coursem year_level)
VALUES ('Collao, John Frank', 'Web Development', 1);

SELECT * FROM students;

UPDATE students
SET year_level = 2
WHERE name = 'Juan Dela Cruz';

SELECT * FROM students;

DELETE FROM students
WHERE name = 'Pedro Reyes';

--Challenge Activity
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    description VARCHAR(100),
    units INT
);

INSERT INTO courses (cours_name, description, units)
VALUES
('CIT6','Capstone 1', 3),
('CC5','Information Management', 3),
('CC2','Introduction to Programming', 3);

SELECT * FROM courses;