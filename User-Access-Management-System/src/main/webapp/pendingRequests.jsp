<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Requests</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="form-container">
        <h2>Pending Requests</h2>
        <table>
            <thead>
                <tr>
                    <th>Employee</th>
                    <th>Software</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Ramesh</td>
                    <td>Software</td>
                    <td>Read</td>
                    <td>For testing purposes</td>
                    <td>
                        <form action="ApprovalServlet" method="post" style="display:inline;">
                            <input type="hidden" name="requestId" value="1">
                            <button type="submit" name="action" value="approve">Approve</button>
                        </form>
                        <form action="ApprovalServlet" method="post" style="display:inline;">
                            <input type="hidden" name="requestId" value="1">
                            <button type="submit" name="action" value="reject">Reject</button>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
