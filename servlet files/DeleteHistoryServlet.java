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

@WebServlet("/DeleteHistoryServlet")
public class DeleteHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int historyId = Integer.parseInt(request.getParameter("history_id"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM booking_history WHERE history_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, historyId);
            ps.executeUpdate();
            ps.close();

            response.sendRedirect("bookingHistory.jsp?deleted=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
