# School Grades Management System

A simple PHP web application for managing student grades.
The system allows you to add students, record their grades for specific courses, and view all stored grades in a structured table with automatic average calculation.

## Features

- Add students automatically if they don’t already exist
- Record grades for a course (3 grade components)
- Display all students and their grades
- Automatically calculate and display grade averages
- Uses **MariaDB** with prepared statements (mysqli)
- Simple, responsive UI with CSS styling

## Technologies Used

- **PHP**
- **MariaDB / MySQL**
- **HTML5**
- **CSS3**

## Database Schema

Create a database named:

```sql
school_grades_db
```

### `students` table

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);
```

### `grades` table

```sql
CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    grade_part1 DECIMAL(5,2) NOT NULL,
    grade_part2 DECIMAL(5,2) NOT NULL,
    grade_part3 DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

## How It Works

1. User submits the form with:

   - Student name
   - Course name
   - Three grade values

2. The script checks if the student already exists
3. If not, the student is added to the database
4. Grades are inserted and linked to the student
5. All grades are displayed in a table with calculated averages

## Running the Project

1. Install **Apache**, **PHP**, and **MariaDB**
2. Place the project in your web server directory:

   - `htdocs/` (XAMPP)
   - `www/` (WAMP)

3. Import the database schema
4. Open in your browser
