<?php
session_start();
include('db_connection.php');

function getSemesterStats($pdo, $student_number, $semester, $year) {
    try {
        $gpa_query = $pdo->prepare("SELECT ROUND(AVG(CAST(final_grade AS FLOAT)), 2) AS average_grade FROM $year WHERE final_grade <> 'S' AND semester = :semester AND student_number = :student_number");
        $gpa_query->execute(['student_number' => $student_number, 'semester' => $semester]);
        $gpa_result = $gpa_query->fetch(PDO::FETCH_ASSOC);
        $average_grade = $gpa_result ? $gpa_result['average_grade'] : 0;

        $passed_query = $pdo->prepare("SELECT COUNT(*) AS passed_count FROM $year WHERE student_number = :student_number AND semester = :semester AND (final_grade >= 1 AND final_grade < 3 OR final_grade = 'S')");
        $passed_query->execute(['student_number' => $student_number, 'semester' => $semester]);
        $passed_result = $passed_query->fetch(PDO::FETCH_ASSOC);
        $total_passed = $passed_result ? $passed_result['passed_count'] : 0;

        $total_query = $pdo->prepare("SELECT COUNT(course_code) AS total_count FROM $year WHERE student_number = :student_number AND semester = :semester");
        $total_query->execute(['student_number' => $student_number, 'semester' => $semester]);
        $total_result = $total_query->fetch(PDO::FETCH_ASSOC);
        $total_course = $total_result ? $total_result['total_count'] : 0;

        return [
            'average_grade' => $average_grade,
            'total_passed' => $total_passed,
            'total_course' => $total_course
        ];
    } catch (PDOException $e) {
        error_log("Database Error: " . $e->getMessage());
        return null;
    }
}

$first_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'],'First sem', 'firstyear');
$second_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'],'second sem', 'firstyear');

$sec_first_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'],'First sem', 'secondyear');
$sec_second_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'],'second sem', 'secondyear');

$third_first_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'],'First sem','thirdyear');
$third_second_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'],'second sem','thirdyear');

$fourth_first_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'], 'First sem', 'fourthyear');
$fourth_second_semester_stats = getSemesterStats($pdo, $_SESSION['student_number'], 'second sem', 'fourthyear');

//first year
$first_semester_courses = [];
if (isset($_POST['search_term_first'])) {
    $searchTerm = '%' . $_POST['search_term_first'] . '%';
    $studentNumber = $_SESSION['student_number'];

    $query = $pdo->prepare("SELECT * FROM firstyear_firstsem WHERE student_number = :student_number AND (course_code LIKE :search_term OR course_title LIKE :search_term)");
    $query->execute(['student_number' => $studentNumber, 'search_term' => $searchTerm]);
    $first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);

} else {
    $query = $pdo->prepare("SELECT * FROM firstyear_firstsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

$second_semester_courses = [];
if (isset($_POST['search_term_second'])) {
    $searchTerm = '%' . $_POST['search_term_second'] . '%';
    $studentNumber = $_SESSION['student_number'];

    $query = $pdo->prepare("SELECT * FROM firstyear_secondsem WHERE student_number = :student_number AND (course_code LIKE :search_term OR course_title LIKE :search_term)");
    $query->execute(['student_number' => $studentNumber, 'search_term' => $searchTerm]);
    $second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);

    
} else {
    $query = $pdo->prepare("SELECT * FROM firstyear_secondsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

//second year
$sec_first_semester_courses = [];
if (isset($_POST['search_second_first'])) {
    $search_term = '%' . $_POST['search_second_first'] . '%';
    $student_number = $_SESSION['student_number'];

    $query = $pdo->prepare("SELECT * FROM secondyear_firstsem WHERE student_number = :student_number AND (course_code LIKE :search_second_first OR course_title LIKE :search_second_first)");
    $query->execute(['student_number' => $student_number, 'search_second_first' => $search_term]);
    $sec_first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = $pdo->prepare("SELECT * FROM secondyear_firstsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $sec_first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

$sec_second_semester_courses = [];
if (isset($_POST['search_second_second']) && !empty($_POST['search_second_second'])) {
    $search_term = '%' . $_POST['search_second_second'] . '%';
    $query = $pdo->prepare("SELECT * FROM secondyear_secondsem WHERE student_number = :student_number AND (course_code LIKE :search_second_second OR course_title LIKE :search_second_second)");
    $query->execute(['student_number' => $_SESSION['student_number'], 'search_second_second' => $search_term]);
    $sec_second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = $pdo->prepare("SELECT * FROM secondyear_secondsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $sec_second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

//third year
$third_first_semester_courses = [];
if (isset($_POST['search_third_first'])) {
    $search_term = '%' . $_POST['search_third_first'] . '%';
    $student_number = $_SESSION['student_number'];

    $query = $pdo->prepare("SELECT * FROM thirdyear_firstsem WHERE student_number = :student_number AND (course_code LIKE :search_third_first OR course_title LIKE :search_third_first)");
    $query->execute(['student_number' => $student_number, 'search_third_first' => $search_term]);
    $third_first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = $pdo->prepare("SELECT * FROM thirdyear_firstsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $third_first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

$third_second_semester_courses = [];
if (isset($_POST['search_third_second']) && !empty($_POST['search_third_second'])) {
    $search_term = '%' . $_POST['search_third_second'] . '%';
    $query = $pdo->prepare("SELECT * FROM thirdyear_secondsem WHERE student_number = :student_number AND (course_code LIKE :search_third_second OR course_title LIKE :search_third_second)");
    $query->execute(['student_number' => $_SESSION['student_number'], 'search_third_second' => $search_term]);
    $third_second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = $pdo->prepare("SELECT * FROM thirdyear_secondsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $third_second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

//fourth year
$fourth_first_semester_courses = [];
if (isset($_POST['search_fourth_first'])) {
    $search_term = '%' . $_POST['search_fourth_first'] . '%';
    $student_number = $_SESSION['student_number'];

    $query = $pdo->prepare("SELECT * FROM fourthyear_firstsem WHERE student_number = :student_number AND (course_code LIKE :search_term OR course_title LIKE :search_term)");
    $query->execute(['student_number' => $student_number, 'search_term' => $search_term]);
    $fourth_first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = $pdo->prepare("SELECT * FROM fourthyear_firstsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $fourth_first_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

$fourth_second_semester_courses = [];
if (isset($_POST['search_fourth_second'])) {
    $search_term = '%' . $_POST['search_fourth_second'] . '%';
    $student_number = $_SESSION['student_number'];

    $query = $pdo->prepare("SELECT * FROM fourthyear_secondsem WHERE student_number = :student_number AND (course_code LIKE :search_term OR course_title LIKE :search_term)");
    $query->execute(['student_number' => $student_number, 'search_term' => $search_term]);
    $fourth_second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = $pdo->prepare("SELECT * FROM fourthyear_secondsem WHERE student_number = :student_number");
    $query->execute(['student_number' => $_SESSION['student_number']]);
    $fourth_second_semester_courses = $query->fetchAll(PDO::FETCH_ASSOC);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checklist Dashboard</title>
    <link rel="stylesheet" href="styles.css">

</head>

<body>
    
<div id="navbar">
    <label id="title">CHECKLIST</label>
    <label id="student-label">Student Name:</label>
    <label id="student-name"><?php echo htmlspecialchars($_SESSION['student_name']); ?></label>
    <label id="student-number">Student Number: <?php echo htmlspecialchars($_SESSION['student_number']); ?></label> 
    <div id="navbar-right">
        <a class="active">Home</a>
        <a href="logout.php">Logout</a>
    </div>
</div>
        <!-- First Year-->
    <div class = "devider1" >
        <div class= year-heading>
            <h1>First Year</h1>
        </div>
        <h1>First Semester</h1>
        <div class="search-container">
            <form class="search-form" method="POST">
                <label for="search_term_first">Search:</label>
                <input type="text" id="search_term_first" name="search_term_first" placeholder="Enter course code or title">
                <button type="submit">Search</button>
            </form>
        </div>


        <table id="course-table">
            <tr>
                <th>Course Code</th>
                <th>Course Title</th>
                <th>Credit Unit Lec</th>
                <th>Credit Unit Lab</th>
                <th>Contact Hrs Lec</th>
                <th>Contact Hrs Lab</th>
                <th>Prerequisite</th>
                <th>Year Taken</th>
                <th>Final Grade</th>
                <th>Instructor</th>
                <th>Student Number</th>
            </tr>
            <?php foreach ($first_semester_courses as $course): ?>
                <tr>
                    <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                    <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                    <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                    <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                    <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                    <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                    <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                    <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                    <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                    <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                    <td><?php echo htmlspecialchars($course['student_number']); ?></td>
                </tr>
            <?php endforeach; ?>
         </table>
    
        <div class="stats-container">
            <p>GPA: <?php echo htmlspecialchars($first_semester_stats['average_grade']); ?></p>
            <p>Passed Subjects: <?php echo htmlspecialchars($first_semester_stats['total_passed']); ?></p>
            <p>Total Subjects: <?php echo htmlspecialchars($first_semester_stats['total_course']); ?></p>
        </div>

    </div>

<div class="devider">
    <h1>Second Semester</h1>

    <div class="search-container">
        <form class="search-form" method="POST">
            <label for="search_term_second">Search:</label>
            <input type="text" id="search_term_second" name="search_term_second" placeholder="Enter course code or title">
            <button type="submit">Search</button>
        </form>
    </div>

    <table id="course-table">
        <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th>
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>
            <th>Student Number</th>
        </tr>
        <?php foreach ($second_semester_courses as $course): ?>
            <tr>
                <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                <td><?php echo htmlspecialchars($course['student_number']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
    
    <div class="stats-container">
        <p>GPA: <?php echo htmlspecialchars($second_semester_stats['average_grade']); ?></p>
        <p>Passed Subjects: <?php echo htmlspecialchars($second_semester_stats['total_passed']); ?></p>
        <p>Total Subjects: <?php echo htmlspecialchars($second_semester_stats['total_course']); ?></p>
    </div>
</div>

    <!-- Second Year-->
<div class = "devider" >
    <div class= year-heading>
        <h1>Second Year</h1>
    </div>
    <h1>First Semester</h1>

    <div class="search-container">
    <form class="search-form" method="POST">
        <label for="search_second_first">Search:</label>
        <input type="text" id="search_second_first" name="search_second_first">
        <button type="submit">Search</button>
    </form>
    </div>

    <table id="course-table">
        <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th> 
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>           
            <th>Student Number</th>
        </tr>
        <?php foreach ($sec_first_semester_courses as $course): ?>
            <tr>
                <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                <td><?php echo htmlspecialchars($course['student_number']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
    
    <div class="stats-container">
        <p>GPA: <?php echo htmlspecialchars($sec_first_semester_stats['average_grade']); ?></p>
        <p>Passed Subjects: <?php echo htmlspecialchars($sec_first_semester_stats['total_passed']); ?></p>
        <p>Total Subjects: <?php echo htmlspecialchars($sec_first_semester_stats['total_course']); ?></p>
    </div>
</div>

<div class = "devider" >
    <h1>Second Semester</h1>

    <div class="search-container">
        <form class="search-form" method="POST">
            <label for="search_second_second">Search:</label>
            <input type="text" id="search_second_second" name="search_second_second">
            <button type="submit">Search</button>
        </form>
    </div>

    <table id="course-table">
        <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th>
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>
            <th>Student Number</th>
        </tr>
     <?php foreach ($sec_second_semester_courses as $course): ?>
        <tr>
            <td><?php echo htmlspecialchars($course['course_code']); ?></td>
            <td><?php echo htmlspecialchars($course['course_title']); ?></td>
            <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
            <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
            <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
            <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
            <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
            <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
            <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
            <td><?php echo htmlspecialchars($course['instructor']); ?></td>
            <td><?php echo htmlspecialchars($course['student_number']); ?></td>
        </tr>
    <?php endforeach; ?>
    </table>
    <div class="stats-container">
        <p>GPA: <?php echo htmlspecialchars($sec_second_semester_stats['average_grade']); ?></p>
        <p>Passed Subjects: <?php echo htmlspecialchars($sec_second_semester_stats['total_passed']); ?></p>
        <p>Total Subjects: <?php echo htmlspecialchars($sec_second_semester_stats['total_course']); ?></p>
    </div>
</div>

   <!-- Third Year-->
<div class = "devider" >
    <div class= year-heading>
        <h1>Third Year</h1>
    </div>
    <h1>First Semester</h1>

    <div class="search-container">
    <form class="search-form" method="POST">
        <label for="search_third_first">Search:</label>
        <input type="text" id="search_third_first" name="search_third_first">
        <button type="submit">Search</button>
    </form>
    </div>

    <table id="course-table">
        <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th>
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>
            <th>Student Number</th>
        </tr>
        <?php foreach ($third_first_semester_courses as $course): ?>
            <tr>
                <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                <td><?php echo htmlspecialchars($course['student_number']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
    
    <div class="stats-container">
        <p>GPA: <?php echo htmlspecialchars($third_first_semester_stats['average_grade']); ?></p>
        <p>Passed Subjects: <?php echo htmlspecialchars($third_first_semester_stats['total_passed']); ?></p>
        <p>Total Subjects: <?php echo htmlspecialchars($third_first_semester_stats['total_course']); ?></p>
    </div>
</div>


<div class = "devider" >
    <h1>Second Semester</h1>

    <div class="search-container">
    <form class="search-form" method="POST">
        <label for="search_third_second">Search:</label>
        <input type="text" id="search_third_second" name="search_third_second">
        <button type="submit">Search</button>
    </form>
    </div>

    <table id="course-table">
        <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th>
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>
            <th>Student Number</th>
        </tr>
     <?php foreach ($third_second_semester_courses as $course): ?>
            <tr>
                <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                <td><?php echo htmlspecialchars($course['student_number']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
    <div class="stats-container">
    <p>GPA: <?php echo htmlspecialchars($third_second_semester_stats['average_grade']); ?></p>
    <p>Passed Subjects: <?php echo htmlspecialchars($third_second_semester_stats['total_passed']); ?></p>
    <p>Total Subjects: <?php echo htmlspecialchars($third_second_semester_stats['total_course']); ?></p>
</div>
</div>

<!-- Fourth Year - First Semester -->
<div class="devider">
    <div class= year-heading>
        <h1>Fourth Year</h1>
    </div>
    <h1>First Semester</h1>

    <div class="search-container">
    <form class="search-form" method="POST">
        <label for="search_fourth_first">Search:</label>
        <input type="text" id="search_fourth_first" name="search_fourth_first">
        <button type="submit">Search</button>
    </form>
    </div>

    <table id="course-table">
        <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th>
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>
            <th>Student Number</th>
        </tr>
    <?php foreach ($fourth_first_semester_courses as $course): ?>
        <tr>
                <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                <td><?php echo htmlspecialchars($course['student_number']); ?></td>
            </tr>
    <?php endforeach; ?>
    </table>

    <div class="stats-container">
        <p>GPA: <?php echo htmlspecialchars($fourth_first_semester_stats['average_grade']); ?></p>
        <p>Passed Subjects: <?php echo htmlspecialchars($fourth_first_semester_stats['total_passed']); ?></p>
        <p>Total Subjects: <?php echo htmlspecialchars($fourth_first_semester_stats['total_course']); ?></p>
    </div>
</div>

<!--Second Semester -->
<div class="devider">
    <h1> Second Semester</h1>

    <div class="search-container">
    <form class="search-form" method="POST">
        <label for="search_fourth_second">Search:</label>
        <input type="text" id="search_fourth_second" name="search_fourth_second">
        <button type="submit">Search</button>
    </form>
    </div>

    <table id="course-table">
    <tr>
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Credit Unit Lec</th>
            <th>Credit Unit Lab</th>
            <th>Contact Hrs Lec</th>
            <th>Contact Hrs Lab</th>
            <th>Prerequisite</th>
            <th>Year Taken</th>
            <th>Final Grade</th>
            <th>Instructor</th>
            <th>Student Number</th>
        </tr>
        <?php foreach ($fourth_second_semester_courses as $course): ?>
            <tr>
                <td><?php echo htmlspecialchars($course['course_code']); ?></td>
                <td><?php echo htmlspecialchars($course['course_title']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['credit_unit_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lec']); ?></td>
                <td><?php echo htmlspecialchars($course['contact_hrs_lab']); ?></td>
                <td><?php echo htmlspecialchars($course['prerequisite']); ?></td>
                <td><?php echo htmlspecialchars($course['year_taken']); ?></td>
                <td><?php echo htmlspecialchars($course['final_grade']); ?></td>    
                <td><?php echo htmlspecialchars($course['instructor']); ?></td>
                <td><?php echo htmlspecialchars($course['student_number']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>

    <div class="stats-container">
        <p>GPA: <?php echo htmlspecialchars($fourth_second_semester_stats['average_grade']); ?></p>
        <p>Passed Subjects: <?php echo htmlspecialchars($fourth_second_semester_stats['total_passed']); ?></p>
        <p>Total Subjects: <?php echo htmlspecialchars($fourth_second_semester_stats['total_course']); ?></p>
    </div>
</div>


<script src="script.js"></script>

</body>
</html>
