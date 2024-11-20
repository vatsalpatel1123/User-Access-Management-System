package user_access_management_system;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");  
        int softwareId = Integer.parseInt(request.getParameter("softwareId"));
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");
        String query = "INSERT INTO requests (user_id, software_id, access_type, reason) VALUES "
                     + "((SELECT id FROM users WHERE username = ?), ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demo", "postgres", "root");
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);   
            stmt.setInt(2, softwareId);
            stmt.setString(3, accessType);
            stmt.setString(4, reason);
            stmt.executeUpdate();
            response.sendRedirect("requestAccess.jsp");
            response.getWriter().println("Access request submitted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Unable to submit request.");
        }
    }
}