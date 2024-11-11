<?php
include('db_connection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $new_student_number = $_POST["new_student_number"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"]; 
    $new_password = $_POST["new_password"];

    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

    $existing_user_query = $pdo->prepare("SELECT * FROM users_student WHERE student_number = :student_number");
    $existing_user_query->execute(['student_number' => $new_student_number]);
    $existing_user = $existing_user_query->fetch();

    if ($existing_user) {
        $error_message = "Student Number already Exist.";
        include("signup_form.php");
        exit();
    } else {
        $insert_query = $pdo->prepare("INSERT INTO users_student (student_number, first_name, last_name, email, password) 
                            VALUES (:student_number, :first_name, :last_name, :email, :password)");
        $insert_query->execute([
            'student_number' => $new_student_number,
            'first_name' => $first_name,
            'last_name' => $last_name,
            'email' => $email,
            'password' => $hashed_password
        ]);

        header("Location: login_form.php");
        exit();
    }
}
?>
