<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #215f3b;
            background-size: cover;
            background-repeat: no-repeat;
        }

        h2 {
            text-align: left;
            color: #e7e2e2;
        }

        h1 {
            text-align: left;
            color: rgb(233, 235, 241);
        }

        .container {
            width: 600px;
            margin: 0 auto;
            padding: 90px;
            background-color: #215f3b;
            border-radius: 20px;
            box-shadow: 0 0px 0px rgba(0, 0, 0, 0.1);
            position: absolute;
            top: 35%;
            left: 25%;
            transform: translate(-50%, -50%);
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: rgb(233, 235, 241);

        }

        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="password"] {
            width: 60%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .button-container {
            display: flex;
            gap: 10px; /* Optional: Adds space between the buttons */
        }

        button[type="submit"],
        .signup-link {
            display: inline-block;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

        button[type="submit"]:hover,
        .signup-link:hover {
            background-color: #0056b3;
        }

        .signup-link a {
            color: #fff;
            text-decoration: none;
        }

        .signup-link a:hover {
            color: #fff; /* Keeps the text color on hover */
        }

    </style>
</head>
<body>
    <div>
        <h1>WELCOME</h1>
    </div>
    <div class="container">
        <h2>Login</h2>
        <form action="home" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required autofocus/><br/>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required/><br/>
            <div class="button-container">
                <button type="submit">Login</button>
                <button type="submit" class="signup-link"><a href="register">Sign Up</a></button>
            </div>
            
        </form>
    </div>
</body>
</html>