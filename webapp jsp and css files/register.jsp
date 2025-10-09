<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hostel Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            text-align: center;
            width: 400px;
        }
        h2 {
            margin-bottom: 25px;
            color: #007bff;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"],
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="submit"]:hover,
        button:hover {
            background-color: #0056b3;
        }
        .back-button {
            margin-top: 12px;
        }
        .message {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 6px;
            font-weight: bold;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Hostel Registration Form</h2>

        <% 
        String status = request.getParameter("status");
        if ("success".equals(status)) { 
        %>
            <div class="message success">✅ Registration successful! You can now <a href="login.jsp">login</a>.</div>
        <% 
        } else if ("failed".equals(status)) { 
        %>
            <div class="message error">❌ Registration failed. Please try again.</div>
        <% 
        } else if ("error".equals(status)) { 
        %>
            <div class="message error">⚠️ Something went wrong. Please try later.</div>
        <% 
        } 
        %>

        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Register">
        </form>

        <div class="back-button">
            <form action="index.jsp" method="get">
                <button type="submit">Back to Home</button>
            </form>
        </div>
    </div>
</body>
</html>

