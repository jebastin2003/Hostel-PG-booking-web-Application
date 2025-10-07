<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add room</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
    .message {
        text-align: center;
        font-weight: bold;
        margin-bottom: 15px;
    }
    .success { color: green; }
    .error { color: red; }
</style>
</head>
<body>
<h3>Add a New Room</h3>

<% 
    String status = request.getParameter("status");
    if ("success".equals(status)) { 
%>
    <p class="message success">✅ Room added successfully!</p>
<% 
    } else if ("failed".equals(status)) { 
%>
    <p class="message error">❌ Failed to add room.</p>
<% 
    } else if ("error".equals(status)) { 
%>
    <p class="message error">❌ Error: <%= request.getParameter("message") %></p>
<% } %>

<form action="AddRoomServlet" method="post">
    <label>Room Number:</label>
    <input type="text" name="room_number" required>
    <br><br>
    <label>Capacity:</label>
    <input type="number" name="capacity" required>
    <br><br>
    <input type="submit" value="Add Room">
</form>
<br>
<a href="adminDashboard.jsp">⬅ Back to Admin Dashboard</a>

</body>
</html>
