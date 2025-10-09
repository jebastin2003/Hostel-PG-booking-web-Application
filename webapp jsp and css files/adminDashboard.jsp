<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.dao.DBConnection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin dashboard</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.html"); // prevent non-admin access
        return;
    }
%>

<h2>Welcome Admin!</h2>
<a href="index.jsp">Home</a>


    <a href="addRoom.jsp">➕ Add Room</a>
    <a href="viewAllBookings.jsp">📋 View All Bookings</a>


<a href="bookingHistory.jsp">View Booking History</a>


<h3>Delete Rooms</h3>
<table border="1">
    <tr>
        <th>Room ID</th>
        <th>Room Number</th>
        <th>Capacity</th>
        <th>Available</th>
        <th>Action</th>
    </tr>

<%
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT room_id, room_number, capacity, available_capacity FROM rooms";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("room_id") %></td>
        <td><%= rs.getString("room_number") %></td>
        <td><%= rs.getInt("capacity") %></td>
        <td><%= rs.getInt("available_capacity") %></td>
        <td>
            <form action="DeleteRoomServlet" method="post">
                <input type="hidden" name="room_id" value="<%= rs.getInt("room_id") %>">
                <input type="submit" value="Delete Room">
            </form>
        </td>
    </tr>
<%
        }
        rs.close();
        ps.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</table>
<a href="logout.jsp">🚪 Logout</a>

</body>
</html>