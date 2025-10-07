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

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomNumber = request.getParameter("room_number");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO rooms(room_number, capacity, available_capacity) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, roomNumber);
            ps.setInt(2, capacity);
            ps.setInt(3, capacity);

            int result = ps.executeUpdate();
            ps.close();
            conn.close();

            // ✅ Redirect back to addroom.jsp with success message
            if(result > 0) {
                response.sendRedirect("addRoom.jsp?status=success");
            } else {
                response.sendRedirect("addRoom.jsp?status=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addRoom.jsp?status=error&message=" + e.getMessage());
        }
    }
}
