<%@ page import="java.sql.*, com.dao.DBConnection" %>
<html>
<head>
    <title>Booking History - Admin</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
</head>
<body>

<%-- Success message if a history record was deleted --%>
<% if ("success".equals(request.getParameter("deleted"))) { %>
    <p style="color:green;"> History record deleted successfully!</p>
<% } %>

<h2>Booking History (Admin Panel)</h2>

<table border="1">
    <tr>
        <th>History ID</th>
        <th>Booking ID</th>
        <th>Room Number</th>
        <th>Student Name</th>
        <th>No. of Students</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Booking Date</th>
        <th>Cancelled By</th>
        <th>Cancelled Date</th>
        <th>Action</th>
    </tr>

<%
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT h.history_id, h.booking_id, r.room_number, h.username, h.num_students, " +
                     "h.start_date, h.end_date, h.booking_date, h.cancelled_by, h.cancelled_date " +
                     "FROM booking_history h JOIN rooms r ON h.room_id = r.room_id " +
                     "ORDER BY h.cancelled_date DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int historyId = rs.getInt("history_id");
            int bookingId = rs.getInt("booking_id");
            String roomNumber = rs.getString("room_number");
            String username = rs.getString("username");
            int numStudents = rs.getInt("num_students");
            Date start = rs.getDate("start_date");
            Date end = rs.getDate("end_date");
            Timestamp bookedOn = rs.getTimestamp("booking_date");
            String cancelledBy = rs.getString("cancelled_by");
            Timestamp cancelledDate = rs.getTimestamp("cancelled_date");
%>
    <tr>
        <td><%= historyId %></td>
        <td><%= bookingId %></td>
        <td><%= roomNumber %></td>
        <td><%= username %></td>
        <td><%= numStudents %></td>
        <td><%= start %></td>
        <td><%= end %></td>
        <td><%= bookedOn %></td>
        <td><%= cancelledBy %></td>
        <td><%= cancelledDate %></td>
        <td>
            <form action="DeleteHistoryServlet" method="post" style="display:inline;">
                <input type="hidden" name="history_id" value="<%= historyId %>">
                <input type="submit" value="Delete">
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

