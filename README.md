# sql_work
SQL bases content 
1)
Student-School Data Analysis Using SQL
This project contains SQL scripts for performing data analysis on a student-school-teacher database. The dataset includes students, schools, teachers.

Dataset Structure:
The database consists of the following tables:

School: Stores information about different schools.
Teacher: Stores details of teachers and the subjects they teach.
Student: Stores student details, including grade and school information.

Key SQL Queries Included:
✔️ Total number of students per school
✔️ Average age of students per school
✔️ Number of teachers in each school
✔️ Student list along with their school and teachers
✔️ Schools with more than 3 students
✔️ count of schools
✔️ avereage age of student


2) # Movie Database Analysis

This repository contains SQL scripts for creating and analyzing a movie database. The database includes tables for actors, films, directors, producers, and cameramen, along with relationships between them.

## 📂 File Overview
- **movie_analysis.sql** – SQL script to create tables, insert sample data, and perform queries for data analysis.

## 📌 Database Schema
The database consists of the following tables:
- **Actor1**: Stores details of actors (ActorID, Name, Age, Nationality)
- **Film**: Stores movie details (FilmID, Title, ReleaseYear, DirectorID, ProducerID, CameramanID)
- **Director**: Stores director details (DirectorID, Name, ExperienceYears)
- **Producer**: Stores producer details (ProducerID, Name, Company)
- **Cameraman**: Stores cameraman details (CameramanID, Name, Specialization)
- **ActorFilm**: Relationship table linking actors to films (ActorID, FilmID)

## 🔧 Setup Instructions
1. Install MySQL or any SQL database management system.
2. Clone this repository:
3. Open MySQL and create a new database:
   ```sql
   CREATE DATABASE MovieDB;
   USE MovieDB;
   ```
4. Run the SQL script:
   ```sh
   mysql -u your_username -p MovieDB < movie_analysis.sql
   ```

## 📊 SQL Queries for Data Analysis
Some useful queries to analyze the database:

1. **List all films and their directors:**
   ```sql
   SELECT f.Title AS Film, d.Name AS Director
   FROM Film f
   JOIN Director d ON f.DirectorID = d.DirectorID;
   ```

2. **Find all actors and the films they acted in:**
   ```sql
   SELECT a.Name AS Actor, f.Title AS Film
   FROM ActorFilm af
   JOIN Actor1 a ON af.ActorID = a.ActorID
   JOIN Film f ON af.FilmID = f.FilmID;
   ```

3. **Count the number of films directed by each director:**
   ```sql
   SELECT d.Name AS Director, COUNT(f.FilmID) AS NumberOfFilms
   FROM Director d
   LEFT JOIN Film f ON d.DirectorID = f.DirectorID
   GROUP BY d.Name
   ORDER BY NumberOfFilms DESC;
   ```

## 📜 License
This project is open-source and free to use. Feel free to modify and improve it!

## 🙌 Contributing
If you would like to contribute, fork the repository and submit a pull request. Any improvements or additional queries are welcome!

---
⭐ **Don't forget to star the repository if you found it useful!** ⭐


