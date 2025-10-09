<%@ page import="java.sql.*, com.dao.DBConnection" %>
<html>
<head>
    <title>All Bookings - Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
</head>
<body>
<h2>All Bookings (Admin Panel)</h2>

<table border="1">
    <tr>
        <th>Booking ID</th>
        <th>Room Number</th>
        <th>Student Name</th>
        <th>No. of Students</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Booking Date</th>
        <th>Action</th>
    </tr>

<%
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT b.booking_id, r.room_number, b.username, b.num_students, " +
                     "b.start_date, b.end_date, b.booking_date " +
                     "FROM bookings b JOIN rooms r ON b.room_id = r.room_id " +
                     "ORDER BY b.booking_date DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int bookingId = rs.getInt("booking_id");
            String roomNumber = rs.getString("room_number");
            String username = rs.getString("username");
            int numStudents = rs.getInt("num_students");
            Date start = rs.getDate("start_date");
            Date end = rs.getDate("end_date");
            Timestamp bookedOn = rs.getTimestamp("booking_date");
%>
    <tr>
        <td><%= bookingId %></td>
        <td><%= roomNumber %></td>
        <td><%= username %></td>
        <td><%= numStudents %></td>
        <td><%= start %></td>
        <td><%= end %></td>
        <td><%= bookedOn %></td>
        <td>
            <form action="AdminCancelBookingServlet" method="post" style="display:inline;">
                <input type="hidden" name="booking_id" value="<%= bookingId %>">
                <input type="hidden" name="num_students" value="<%= numStudents %>">
                <input type="hidden" name="cancelled_by" value="admin">
                <input type="submit" value="Cancel Booking">
            </form>
        </td>
    </tr>
<%
        }
        rs.close();
        ps.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
</table>

<%
    if (request.getParameter("cancel") != null) {
%>
    <p style="color:green;">Booking cancelled successfully!</p>
<%
    }
%>

<div style="text-align:center; margin-top:20px;">
    <form action="adminDashboard.jsp" method="get">
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
