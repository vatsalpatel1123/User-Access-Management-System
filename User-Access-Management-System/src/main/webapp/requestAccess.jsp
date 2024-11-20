<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Access</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="form-container">
        <h2>Request Access</h2>
        <form action="RequestServlet" method="post">
            <select name="softwareId" required>
                <option value="">Select Software</option>
                <%
                    try {
                        Class.forName("org.postgresql.Driver");
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demo", "postgres", "root");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT id, name FROM software");
                        while (rs.next()) {
                            int softwareId = rs.getInt("id");
                            String softwareName = rs.getString("name");
                %>
                            <option value="<%= softwareId %>"><%= softwareName %></option>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <select name="accessType" required>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select>
            <textarea name="reason" placeholder="Reason for Access" required></textarea>
            <button type="submit">Request</button>
        </form>
    </div>
</body>
</html>
