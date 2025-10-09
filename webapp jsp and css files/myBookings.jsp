<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my booking</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
<%@ page import="java.sql.*, com.dao.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String username = (sessionObj != null) ? (String) sessionObj.getAttribute("username") : null;

    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }

    Connection conn = DBConnection.getConnection();
    String sql = "SELECT b.booking_id, b.room_id, r.room_number, b.num_students, b.start_date, b.end_date, b.booking_date " +
                 "FROM bookings b JOIN rooms r ON b.room_id = r.room_id WHERE b.username=?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();
%>

<h2>My Bookings</h2>
<table border="1" style="border-collapse: collapse; padding: 5px;">
    <tr>
        <th style="padding: 5px;">Booking ID</th>
        <th style="padding: 5px;">Room Number</th>
        <th style="padding: 5px;">Students</th>
        <th style="padding: 5px;">Start Date</th>
        <th style="padding: 5px;">End Date</th>
        <th style="padding: 5px;">Booking Date</th>
        <th style="padding: 5px;">Action</th>
    </tr>
<%
    while (rs.next()) {
%>
    <tr>
        <td style="padding: 5px;"><%= rs.getInt("booking_id") %></td>
        <td style="padding: 5px;"><%= rs.getString("room_number") %></td>
        <td style="padding: 5px;"><%= rs.getInt("num_students") %></td>
        <td style="padding: 5px;"><%= rs.getDate("start_date") %></td>
        <td style="padding: 5px;"><%= rs.getDate("end_date") %></td>
        <td style="padding: 5px;"><%= rs.getTimestamp("booking_date") %></td>
        <td style="padding: 5px;">
            <form action="CancelBookingServlet" method="post">
                <input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
                <input type="hidden" name="num_students" value="<%= rs.getInt("num_students") %>">
                <button type="submit">Cancel</button>
            </form>
        </td>
    </tr>
<%
    }
%>
</table>

<div style="text-align:center; margin-top:20px;">
    <form action="studentDashboard.jsp" method="get">
        <button type="submit" style="
            padding:10px 20px;
            background-color:#007bff;
            color:white;
            border:none;
            border-radius:5px;
            cursor:pointer;">
            Back to Dashboard
        </button>
    </form>
</div>



</body>
</html>