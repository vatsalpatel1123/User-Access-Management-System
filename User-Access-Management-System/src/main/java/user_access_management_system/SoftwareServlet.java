package user_access_management_system;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Arrays;
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String[] accessLevels = request.getParameterValues("accessLevels");
        if (accessLevels == null || accessLevels.length == 0) {
            response.getWriter().println("Error: Access levels must be specified.");
            return;
        }
        String[] validLevels = {"Read", "Write", "Admin"};
        if (!Arrays.asList(validLevels).containsAll(Arrays.asList(accessLevels))) {
            response.getWriter().println("Error: Invalid access levels provided.");
            return;
        }
        String formattedAccessLevels = "{" + String.join(",", accessLevels) + "}";
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/demo", 
                "postgres", 
                "root"
            );
             PreparedStatement stmt = con.prepareStatement("INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)");
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setObject(3, formattedAccessLevels, java.sql.Types.OTHER);
            stmt.executeUpdate();
            response.sendRedirect("createSoftware.jsp");
            response.getWriter().println("Software added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}