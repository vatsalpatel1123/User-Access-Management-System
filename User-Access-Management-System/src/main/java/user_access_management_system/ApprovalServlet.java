package user_access_management_system;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action");
        try {
        	Class.forName("org.postgresql.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demo", "postgres", "root");
             PreparedStatement stmt = conn.prepareStatement("UPDATE requests SET status = ? WHERE id = ?");
            stmt.setString(1, action.equals("approve") ? "Approved" : "Rejected");
            stmt.setInt(2, requestId);
            stmt.executeUpdate();
            response.sendRedirect("pendingRequests.jsp");
            response.getWriter().println("Request updated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}