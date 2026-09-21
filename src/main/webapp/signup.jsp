<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4e73df;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            padding: 12px;
            font-size: 16px;
            border: 2px solid #ddd;
            border-radius: 6px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
            border-color: #4e73df;
        }

        input[type="submit"] {
            background-color: #4e73df;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #224abe;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .form-footer a {
            color: #4e73df;
            text-decoration: none;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            .container {
                padding: 20px;
                width: 90%;
            }

            h2 {
                font-size: 24px;
            }

            input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Signup</h2>
        <form action="SignupServlet" method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="email" name="email" placeholder="Enter Email" required><br>
            <input type="submit" value="Register">
        </form>

        <div class="form-footer">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

</body>
</html>
