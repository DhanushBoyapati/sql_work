
use s1;
-- Drop tables if they already exist
DROP TABLE IF EXISTS Student, School, Teacher;

-- Create School table
CREATE TABLE School (
    school_id INT PRIMARY KEY,
    school_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Insert sample data into School
INSERT INTO School (school_id, school_name, city, state) VALUES
(1, 'Greenwood High', 'New York', 'NY'),
(2, 'Sunnyvale School', 'San Francisco', 'CA'),
(3, 'Riverside Academy', 'Chicago', 'IL');

-- Create Teacher table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100),
    subject VARCHAR(50),
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES School(school_id)
);

-- Insert sample data into Teacher
INSERT INTO Teacher (teacher_id, teacher_name, subject, school_id) VALUES
(1, 'Alice Johnson', 'Mathematics', 1),
(2, 'Bob Smith', 'Physics', 1),
(3, 'Charlie Brown', 'English', 2),
(4, 'David Wilson', 'Chemistry', 2),
(5, 'Emma Davis', 'History', 3);

-- Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    grade CHAR(2),
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES School(school_id)
);

-- Insert sample data into Student
INSERT INTO Student (student_id, student_name, age, grade, school_id) VALUES
(1, 'John Doe', 15, '10', 1),
(2, 'Jane Smith', 16, '11', 1),
(3, 'Mike Johnson', 14, '9', 1),
(4, 'Emily Davis', 15, '10', 2),
(5, 'Chris Brown', 16, '11', 2),
(6, 'Sarah Wilson', 17, '12', 2),
(7, 'Daniel Lee', 14, '9', 3),
(8, 'Sophia Kim', 15, '10', 3),
(9, 'Ethan Martinez', 16, '11', 3),
(10, 'Olivia Taylor', 17, '12', 3);


select max(age) from student;


select count(student_name) from student;


select s.student_name,sc.school_name,sc.school_id from student as s
join  school as sc on sc.school_id=s.school_id;

-- to find total students in each school
select s.school_name,count(student_id) from school as s
join   student as st on st.school_id=s.school_id
group by s.school_name;
-- avg age of each students from each school

select s.school_name,avg(st.age) from school as s
join student as st on st.school_id=s.school_id
group by s.school_name;

-- Find the number of teachers in each school
select s.school_name,count(t.teacher_id) as teacher_count from school as s
join teacher as t on t.school_id=s.school_id
group by s.school_name;

-- Listing students along with their school and assigned teachers
select st.student_name,s.school_name,t.teacher_name from school as s
join student as st on st.school_id=s.school_id
join teacher as t on t.school_id=s.school_id
group by st.student_name,s.school_name,t.teacher_name;

-- schools more than 3 students
select s.school_name,count(student_id) from school as s
join student as st on st.school_id=s.school_id
group by school_name
having count(student_id) >3;



