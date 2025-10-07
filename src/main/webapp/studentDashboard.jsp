<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.dao.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student Dashboard</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
<h2>Welcome, <%= session.getAttribute("username") %> 🎉</h2>
    <p>You are now logged in to the Hostel Management System.</p>
    <br>
    <a href="index.jsp">Home</a>
    
    <h3>Book a Room</h3>
<form action="booking.jsp" method="get">
    <input type="submit" value="Book a Room">
</form>
<br><br>
<a href="myBookings.jsp">View my booking</a>
<br><br><br>

<a href="logout.jsp">Logout</a>

</body>
</html>