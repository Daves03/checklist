<?php

session_start();
include('db_connection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $student_number = $_POST["student_number"];
    $password = $_POST["password"];

    $query = $pdo->prepare("SELECT * FROM users_student WHERE student_number = :student_number");
    $query->execute(['student_number' => $student_number]);
    $user = $query->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        $query = $pdo->prepare("UPDATE users_student SET last_login = NOW() WHERE student_number = :student_number");
        $query->execute(['student_number' => $student_number]);

        $query = $pdo->prepare("SELECT CONCAT(UCASE(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2)), ' ', UCASE(LEFT(last_name, 1)), LOWER(SUBSTRING(last_name, 2))) AS student_name FROM users_student WHERE student_number = :student_number");
        $query->execute(['student_number' => $student_number]);
        $student_data = $query->fetch(PDO::FETCH_ASSOC);

        $_SESSION['student_name'] = $student_data['student_name'];
        $_SESSION['student_number'] = $student_number;
        header("Location: checklist.php");
        exit();
    } else {
        $error_message = "Invalid username or password.";
        include("login_form.php");
        exit();
    }
}
?>
