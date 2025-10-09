<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column; /* ✅ stack vertically */
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .register-link {
            margin-top: 15px;
            display: block;
        }
        .register-link a {
            color: #007bff;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }

        /* === Back to Home Button === */
        .back-home {
            margin-top: 25px; /* space below form box */
            text-align: center;
        }

        .btn-home {
            display: inline-block;
            background: #007bff;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-home:hover {
            background: #0056b3;
        }
    </style>
</head>
<% 
String error = request.getParameter("error");
if ("invalid".equals(error)) { 
%>
    <p style="color:red;"> Invalid username or password!</p>
<% 
} else if ("exception".equals(error)) { 
%>
    <p style="color:red;"> Something went wrong. Please try again.</p>
<% 
} 
%>

<body>
    <div class="container">
        <h2>Login Page</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="submit" value="Login">
        </form>

        <div class="register-link">
            <p>New user? <a href="register.jsp">Register here</a></p>
        </div>
    </div>

    <!-- ✅ Back to Home Button Below Form -->
    <div class="back-home">
        <a href="index.jsp" class="btn-home">Back to Home</a>
    </div>
</body>
</html>