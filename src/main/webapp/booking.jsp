<%@ page import="java.sql.*, com.dao.DBConnection" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book a Room</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
    
</head>
<body>

<h2 style="text-align:center;">Available Rooms</h2>
<%
    if ("1".equals(request.getParameter("success"))) {
%>
    <p style="color:green; text-align:center;"> Room booked successfully!</p>
<%
    } else if ("capacity".equals(request.getParameter("error"))) {
%>
    <p style="color:red; text-align:center;"> Not enough capacity! Only <%= request.getParameter("left") %> left.</p>
<%
    } else if ("notfound".equals(request.getParameter("error"))) {
%>
    <p style="color:red; text-align:center;"> Room not found!</p>
<%
    } else if ("exception".equals(request.getParameter("error"))) {
%>
    <p style="color:red; text-align:center;"> Something went wrong. Try again.</p>
<%
    }
%>



<table>
    <thead>
        <tr>
            <th>Room ID</th>
            <th>Room Number</th>
            <th>Capacity</th>
            <th>Available</th>
            <th>No. of Students</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
<%
    try {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT room_id, room_number, capacity, available_capacity FROM rooms WHERE available_capacity > 0";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            int roomId = rs.getInt("room_id");
            String roomNumber = rs.getString("room_number");
            int capacity = rs.getInt("capacity");
            int available = rs.getInt("available_capacity");
%>

<form action="BookingServlet" method="post">
    <tr>
        <td><%= roomId %></td>
        <td><%= roomNumber %></td>
        <td><%= capacity %></td>
        <td><%= available %></td>
        <td>
            <input type="hidden" name="room_id" value="<%= roomId %>" />
            <input type="number" name="num_students" min="1" max="<%= available %>" required />
        </td>
        <td><input type="date" name="start_date" required /></td>
        <td><input type="date" name="end_date" required /></td>
        <td><input type="submit" value="Book" /></td>
    </tr>
</form>

<%
        }
        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
    </tbody>
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
            -- Back to Dashboard
        </button>
    </form>
</div>



</body>
</html>

