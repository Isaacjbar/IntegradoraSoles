package jbar.login.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.ServletException;

@WebServlet("/testConnection")
public class TestConnectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection connection = DatabaseConnection.getConnection()) {
            if (connection != null && !connection.isClosed()) {
                response.getWriter().write("Connection successful!");
            } else {
                response.getWriter().write("Failed to make connection!");
            }
        } catch (SQLException e) {
            response.getWriter().write("An error occurred while connecting to the database: " + e.getMessage());
            e.printStackTrace(response.getWriter());
        }
    }
}
