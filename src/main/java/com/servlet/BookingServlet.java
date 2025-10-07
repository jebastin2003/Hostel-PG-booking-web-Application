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

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("room_id"));
        int numStudents = Integer.parseInt(request.getParameter("num_students"));
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String username = (String) request.getSession().getAttribute("username");

        try (Connection conn = DBConnection.getConnection()) {

            // 1️⃣ Check available capacity
            String checkSql = "SELECT available_capacity FROM rooms WHERE room_id=?";
            PreparedStatement checkPs = conn.prepareStatement(checkSql);
            checkPs.setInt(1, roomId);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                int available = rs.getInt("available_capacity");

                if (available >= numStudents) {
                    // 2️⃣ Insert booking
                    String insertSql = "INSERT INTO bookings(username, room_id, num_students, start_date, end_date) VALUES(?, ?, ?, ?, ?)";
                    PreparedStatement insertPs = conn.prepareStatement(insertSql);
                    insertPs.setString(1, username);
                    insertPs.setInt(2, roomId);
                    insertPs.setInt(3, numStudents);
                    insertPs.setString(4, startDate);
                    insertPs.setString(5, endDate);
                    insertPs.executeUpdate();
                    insertPs.close();

                    // 3️⃣ Update available capacity
                    int newAvailable = available - numStudents;
                    String status = (newAvailable == 0) ? "occupied" : "available";
                    String updateSql = "UPDATE rooms SET available_capacity=?, status=? WHERE room_id=?";
                    PreparedStatement updatePs = conn.prepareStatement(updateSql);
                    updatePs.setInt(1, newAvailable);
                    updatePs.setString(2, status);
                    updatePs.setInt(3, roomId);
                    updatePs.executeUpdate();
                    updatePs.close();

                    // ✅ Redirect with success message
                    response.sendRedirect("booking.jsp?success=1");

                } else {
                    // ❌ Not enough capacity
                    response.sendRedirect("booking.jsp?error=capacity&left=" + available);
                }
            } else {
                // ❌ Room not found
                response.sendRedirect("booking.jsp?error=notfound");
            }

            rs.close();
            checkPs.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=exception");
        }
    }
}
