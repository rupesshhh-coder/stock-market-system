<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar Example</title>
    <style>
        /* General styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #333;
            color: white;
            position: relative;
        }

        nav ul {
            list-style-type: none;
        }

        nav ul li {
            position: relative;
            display: inline-block;
        }

        nav ul li a {
            display: block;
            padding: 16px 20px;
            color: white;
            text-decoration: none;
            background-color: #333;
            transition: background-color 0.3s;
        }

        nav ul li a:hover {
            background-color: #575757;
        }

        nav ul li ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #333;
            min-width: 200px;
        }

        nav ul li:hover > ul {
            display: block;
        }

        nav ul li ul li a {
            padding: 12px 20px;
            color: white;
        }

        nav ul li ul li a:hover {
            background-color: #575757;
        }

        /* Styling for the dropdown */
        nav ul li:hover > a {
            background-color: #575757;
        }

        /* Styling for responsive */
        @media screen and (max-width: 768px) {
            nav ul li {
                display: block;
                width: 100%;
            }

            nav ul li ul {
                position: relative;
                top: 0;
                left: 0;
                min-width: 100%;
            }

            nav ul li a {
                padding: 12px;
                text-align: center;
            }
        }

        /* Auth Buttons Styling */
        .auth-buttons {
            position: absolute;  /* Absolute positioning to move to the right */
            right: 20px;  /* Distance from the right edge */
            top: 50%;  /* Center vertically */
            transform: translateY(-50%);  /* Adjust to center exactly */
        }

        .auth-buttons a {
            padding: 8px 16px;
            color: white;
            text-decoration: none;
            background-color: #007bff;
            border-radius: 4px;
            margin-left: 10px;  /* Space between buttons */
            transition: background-color 0.3s;
        }

        .auth-buttons a:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

    <div class="navbar">
        <nav>
            <ul>
                <li><a href="header.jsp">Home</a></li>
                <li><a href="#">Watchlist</a>
                    <ul>
                        <li><a href="watchlist.jsp">watchlist</a></li>
                        <li><a href="mf.jsp">MF</a></li>
                        <li><a href="govt-securities.jsp">Govt-Securities</a></li>
                        <li><a href="ipo.jsp">IPO</a></li>
                        <li><a href="sip.jsp">SIP</a></li>
                        <li><a href="etf.jsp">ETF</a></li>
                        <li><a href="g_sec.jsp">G-Sec</a></li>
                    </ul>
                </li>
                
                              <li><a href="#">Support</a>
                    <ul>
                        <li><a href="fundamentals.jsp">Fundamentals</a></li>
                        <li><a href="technicals.jsp">Technicals</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

                <div class="auth-buttons">
            <a href="login.jsp">login</a>
            <a href="signup.jsp">Signup</a>
        </div>
    </div>

<!-- Back Button -->
<div class="text-center mt-4">
    <button class="btn btn-danger btn-lg d-flex align-items-center mx-auto gap-2" onclick="goBack()">
        <i class="fas fa-arrow-left"></i> Back
    </button>
</div>

<!-- JavaScript for Back Function -->
<script>
    function goBack() {
        window.history.back();
    }
</script>



</body>
</html>
