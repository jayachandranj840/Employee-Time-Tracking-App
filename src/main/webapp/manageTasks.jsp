<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.employee.model.Task"%>
<%@ page import="com.employee.util.DatabaseConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.employee.util.TaskDAO"%>
<%@ page import="com.employee.model.User"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

List<Task> tasks = null;
try (Connection connection = DatabaseConnection.getConnection()) {
    TaskDAO taskDAO = new TaskDAO(connection);
    tasks = taskDAO.getTasksByUserId(((User) session.getAttribute("user")).getEmpId());
} catch (Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Tasks</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
    color: #333;
    margin: 20px 0;
}

table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 12px;
    text-align: left;
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
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    border-radius: 6px;
}

.edit-button {
    background-color: #4CAF50;
}

.edit-button:hover {
    background-color: #45a049;
    transform: scale(1.05);
}

.delete-button {
    background-color: #f44336;
}

.delete-button:hover {
    background-color: #d32f2f;
    transform: scale(1.05);
}

.center {
    text-align: center;
    margin: 20px;
}

.back-to-dashboard {
    display: inline-block;
    padding: 12px 24px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    text-decoration: none;
    border-radius: 6px;
    transition: background-color 0.3s, transform 0.3s;
}

.back-to-dashboard:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}
</style>
</head>
<body>
    <h1>Manage Tasks</h1>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Category</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (tasks != null && !tasks.isEmpty()) {
            %>
            <%
            for (Task task : tasks) {
            %>
            <tr>
                <td><%=task.getDate()%></td>
                <td><%=task.getStartTime()%></td>
                <td><%=task.getEndTime()%></td>
                <td><%=task.getCategory()%></td>
                <td><%=task.getDescription()%></td>
                <td>
                    <form action="ManageTaskServlet" method="post" style="display: inline;">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" value="<%=task.getId()%>">
                        <input type="submit" value="Edit" class="button edit-button">
                    </form>
                    <form action="ManageTaskServlet" method="post" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%=task.getId()%>">
                        <input type="submit" value="Delete" class="button delete-button" onclick="return confirm('Are you sure you want to delete this task?');">
                    </form>
                </td>
            </tr>
            <%
            }
            %>
            <%
            } else {
            %>
            <tr>
                <td colspan="6">No tasks found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
    <div class="center">
        <a href="employeeHome.jsp" class="back-to-dashboard">Back to Dashboard</a>
    </div>
</body>
</html>
