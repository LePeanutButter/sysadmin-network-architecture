<?php
/**
 * School Grades Management Script
 *
 * This script connects to a MariaDB database, checks if a student exists,
 * inserts the student if not, and then records their grades for a given course.
 *
 * Workflow:
 * 1. Connect to the database
 * 2. Retrieve and sanitize form input
 * 3. Check if student exists, insert if necessary
 * 4. Insert grades for the student
 * 5. Close the database connection
 *
 * @package SchoolGrades
 * @author  LePeanutButter, Lanapequin
 * @version 1.0
 */

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/** @var string $host Database host */
$host = "localhost";

/** @var string $dbname Database name */
$dbname = "school_grades_db";

/** @var string $user Database username */
$user = "santiago";

/** @var string $password Database password */
$password = "peanut123";

/**
 * Establish a connection to MariaDB using mysqli.
 *
 * @var mysqli $conn Database connection object
 */
$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

$message = '';
$status_type = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    /**
     * Retrieve and sanitize form data.
     *
     * @var string $name   Student name from POST data
     * @var string $course Course name from POST data
     * @var float  $p1     Grade part 1 (defaults to 0 if not provided)
     * @var float  $p2     Grade part 2 (defaults to 0 if not provided)
     * @var float  $p3     Grade part 3 (defaults to 0 if not provided)
     */
    $name   = isset($_POST['student_name']) ? $_POST['student_name'] : '';
    $course = isset($_POST['course_name']) ? $_POST['course_name'] : '';
    $p1     = isset($_POST['grade_part1']) ? $_POST['grade_part1'] : 0;
    $p2     = isset($_POST['grade_part2']) ? $_POST['grade_part2'] : 0;
    $p3     = isset($_POST['grade_part3']) ? $_POST['grade_part3'] : 0;


    /**
     * Check if the student exists in the database.
     *
     * @var int|null $student_id Student ID if found or newly created
     */
    $student_id = null;
    $stmt_select = $conn->prepare("SELECT student_id FROM students WHERE student_name = ?");
    $stmt_select->bind_param("s", $name);
    $stmt_select->execute();
    $result = $stmt_select->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $student_id = $row['student_id'];
    } else {
        /**
         * Insert a new student if not found.
         */
        $stmt_insert_student = $conn->prepare("INSERT INTO students (student_name) VALUES (?)");
        $stmt_insert_student->bind_param("s", $name);
        $stmt_insert_student->execute();
        $student_id = $conn->insert_id;
        $stmt_insert_student->close();
    }
    $stmt_select->close();

    /**
     * Insert grades for the student if a valid student ID exists.
     */
    if ($student_id) {
        $stmt_insert_grades = $conn->prepare("
            INSERT INTO grades (student_id, course_name, grade_part1, grade_part2, grade_part3)
            VALUES (?, ?, ?, ?, ?)
        ");

        $stmt_insert_grades->bind_param("isddd", $student_id, $course, $p1, $p2, $p3);
        
        if ($stmt_insert_grades->execute()) {
            $status_type = 'success';
            $message = "Grades saved successfully for **" . htmlspecialchars($name) . "**!";
        } else {
            $status_type = 'error';
            $message = "Error inserting grades: " . $stmt_insert_grades->error;
        }
        $stmt_insert_grades->close();
    } else {
        $status_type = 'error';
        $message = "Error: Could not retrieve or create student ID.";
    }
}

/**
 * Fetch all grades
 */
$grades_result = $conn->query("
    SELECT s.student_name, g.course_name, g.grade_part1, g.grade_part2, g.grade_part3
    FROM grades g
    JOIN students s ON g.student_id = s.student_id
    ORDER BY s.student_name, g.course_name
");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Grades Management</title>
    <link rel="stylesheet" href="ec2_grades.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>School Grades Management</h1>
            <p>Enter student grades for a course</p>
        </header>
        
        <?php if ($message): ?>
            <div class="message <?= $status_type == 'error' ? 'error' : 'success' ?>">
                <?= $message ?>
            </div>
        <?php endif; ?>

        <form action="ec2_grades.php" method="POST" class="form">
            <div class="form-group">
                <label for="student_name">Student Name</label>
                <input type="text" id="student_name" name="student_name" required>
            </div>

            <div class="form-group">
                <label for="course_name">Course Name</label>
                <input type="text" id="course_name" name="course_name" required>
            </div>

            <div class="form-group">
                <label for="grade_part1">Grade Part 1</label>
                <input type="number" id="grade_part1" name="grade_part1" step="0.01" min="0" required>
            </div>
            
            <div class="form-group">
                <label for="grade_part2">Grade Part 2</label>
                <input type="number" id="grade_part2" name="grade_part2" step="0.01" min="0" required>
            </div>
            
            <div class="form-group">
                <label for="grade_part3">Grade Part 3</label>
                <input type="number" id="grade_part3" name="grade_part3" step="0.01" min="0" required>
            </div>

            <button type="submit" class="submit-btn">Save Grades</button>
        </form>
        <div class="grades-table-container">
            <h2>All Student Grades</h2>
            <table class="grades-table">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Grade 1</th>
                        <th>Grade 2</th>
                        <th>Grade 3</th>
                        <th>Average</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($grades_result && $grades_result->num_rows > 0): ?>
                        <?php while($row = $grades_result->fetch_assoc()): ?>
                            <tr>
                                <td><?= htmlspecialchars($row['student_name']) ?></td>
                                <td><?= htmlspecialchars($row['course_name']) ?></td>
                                <td><?= number_format($row['grade_part1'], 2) ?></td>
                                <td><?= number_format($row['grade_part2'], 2) ?></td>
                                <td><?= number_format($row['grade_part3'], 2) ?></td>
                                <td><?= number_format(($row['grade_part1']+$row['grade_part2']+$row['grade_part3'])/3, 2) ?></td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="6" style="text-align:center;">No grades recorded yet.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
<?php
/** Close connection at the very end of the script */
$conn->close();
?>