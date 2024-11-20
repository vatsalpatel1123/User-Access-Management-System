<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Software</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="form-container">
        <h2>Create Software</h2>
        <form action="SoftwareServlet" method="post">
            <input type="text" name="name" placeholder="Software Name" required>
            <textarea name="description" placeholder="Description" required></textarea>
            <div class="checkbox-group">
            Access levels    
                <label>
                    <input type="checkbox" name="accessLevels" value="Read">
                    Read
                </label>
                <label>
                    <input type="checkbox" name="accessLevels" value="Write">
                    Write
                </label>
                <label>
                    <input type="checkbox" name="accessLevels" value="Admin">
                    Admin
                </label>
            </div>
            <button type="submit">Create</button>
        </form>
    </div>
</body>
</html>
