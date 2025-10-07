package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.DBConnection;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        int numStudents = Integer.parseInt(request.getParameter("num_students"));

        try (Connection conn = DBConnection.getConnection()) {

            // 1. Get room_id, start_date, end_date, booking_date of this booking
            String getSql = "SELECT room_id, start_date, end_date, booking_date, username FROM bookings WHERE booking_id=?";
            PreparedStatement ps = conn.prepareStatement(getSql);
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();

            int roomId = -1;
            java.sql.Date startDate = null;
            java.sql.Date endDate = null;
            java.sql.Timestamp bookingDate = null;
            String username = null;

            if (rs.next()) {
                roomId = rs.getInt("room_id");
                startDate = rs.getDate("start_date");
                endDate = rs.getDate("end_date");
                bookingDate = rs.getTimestamp("booking_date");
                username = rs.getString("username");
            }

            rs.close();
            ps.close();

            // 2. Delete booking
            String deleteSql = "DELETE FROM bookings WHERE booking_id=?";
            PreparedStatement ps2 = conn.prepareStatement(deleteSql);
            ps2.setInt(1, bookingId);
            ps2.executeUpdate();
            ps2.close();

            // 3. Increase available capacity
            String updateSql = "UPDATE rooms SET available_capacity = available_capacity + ? WHERE room_id=?";
            PreparedStatement ps3 = conn.prepareStatement(updateSql);
            ps3.setInt(1, numStudents);
            ps3.setInt(2, roomId);
            ps3.executeUpdate();
            ps3.close();

            // 4. Insert into booking_history
            String histSql = "INSERT INTO booking_history(booking_id, username, room_id, num_students, start_date, end_date, booking_date, cancelled_by) " +
                             "VALUES(?, ?, ?, ?, ?, ?, ?, 'student')";
            PreparedStatement histPs = conn.prepareStatement(histSql);
            histPs.setInt(1, bookingId);
            histPs.setString(2, username);
            histPs.setInt(3, roomId);
            histPs.setInt(4, numStudents);
            histPs.setDate(5, startDate);
            histPs.setDate(6, endDate);
            histPs.setTimestamp(7, bookingDate);
            histPs.executeUpdate();
            histPs.close();

            response.sendRedirect("myBookings.jsp?cancel=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error: " + e.getMessage());
        }
    }
}
