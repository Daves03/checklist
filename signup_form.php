<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f2f2f2;
        }

        .signup-container {
            position: relative;
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        .signup-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            cursor: pointer;
            color: blue;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"]
         {
            width: 92%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"]
        {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="signup-container">
    <h2>Create Account</h2>
    <?php if (isset($error_message)) { ?>
        <p style="color: red;"><?php echo $error_message; ?></p>
    <?php } ?>
    <form class="signup-form" method="post" action="create_account.php">
        <label for="new_student_number">Student Number</label>
        <input type="text" id="new_student_number" name="new_student_number" placeholder="Enter Student Number" required pattern="[0-9]+" title="Please enter only numbers">


        <label for="first_name">First Name</label>
        <input type="text" id="first_name" name="first_name" placeholder="Enter First Name" required>

        <label for="last_name">Last Name</label>
        <input type="text" id="last_name" name="last_name" placeholder="Enter Last Name" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter Email" required>

        <label for="new_password">Password</label>
        <input type="password" id="new_password" name="new_password" placeholder="Enter Password" required>

        <input type="submit" value="Create Account">
    </form>
    <br>
    <a href="login_form.php">Back to Login</a>
</div>

</body>
</html>
