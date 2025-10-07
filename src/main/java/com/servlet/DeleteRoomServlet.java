package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dao.DBConnection;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("room_id"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM rooms WHERE room_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, roomId);
            ps.executeUpdate();
            ps.close();

            response.sendRedirect("adminDashboard.jsp?delete=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
