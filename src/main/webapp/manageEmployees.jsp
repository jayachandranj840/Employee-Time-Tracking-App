<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.employee.model.User"%>
<%@ page import="com.employee.util.DatabaseConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.employee.util.UserDAO"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

List<User> users = null;
try (Connection connection = DatabaseConnection.getConnection()) {
    UserDAO userDAO = new UserDAO(connection);
    users = userDAO.getAllUsers();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Employees</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
    color: #333;
    margin-top: 20px;
}

table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 20px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #4CAF50;
    color: white;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

form {
    display: inline;
}

.button {
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    transition-duration: 0.4s;
    border-radius: 4px;
}

.edit-button {
    background-color: #4CAF50;
}

.edit-button:hover {
    background-color: #45a049;
}

.delete-button {
    background-color: #f44336;
}

.delete-button:hover {
    background-color: #d32f2f;
}

.center {
    text-align: center;
    margin: 20px;
}

.back-to-dashboard {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #4CAF50;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.back-to-dashboard:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
    <h1>Manage Employees</h1>
    <table>
        <thead>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Role</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
            %>            
            <tr>
                <td><%=user.getEmpId()%></td>
                <td><%=user.getName()%></td>
                <td><%=user.getRole()%></td>
                <td><%=user.getUsername()%></td>
                
                <td>
                    <form action="ManageEmployeeServlet" method="post" style="display: inline;">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" value="<%=user.getEmpId()%>">
                        <input type="submit" value="Edit" class="button edit-button">
                    </form>
                    <form action="ManageEmployeeServlet" method="post" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%=user.getEmpId()%>">
                        <input type="submit" value="Delete" class="button delete-button" onclick="return confirm('Are you sure you want to delete this employee?');">
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No employees found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
    <div class="center">
        <a href="adminHome.jsp" class="back-to-dashboard">Back to Dashboard</a>
    </div>
</body>
</html>
