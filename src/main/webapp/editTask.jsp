<%@ page import="com.employee.model.Task"%>
<%@ page import="com.employee.util.TaskDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.employee.util.DatabaseConnection"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Task</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    color: #333;
}

.container {
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 400px;
    max-width: 100%;
}

h1 {
    margin-bottom: 20px;
    color: #333;
}

label {
    display: block;
    margin: 10px 0 5px;
    font-weight: bold;
}

input[type="date"], input[type="time"], input[type="text"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 5px; /* Reduced margin for spacing */
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #007BFF;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.error-message {
    color: red;
    font-size: 14px;
    margin-top: 5px; /* Margin for spacing */
    display: block; /* Ensure error message is on a new line */
}

.back-link {
    display: block;
    margin-top: 20px;
    text-align: center;
}
</style>
<script>
function validateForm() {
    const startTime = document.querySelector('input[name="startTime"]').value.trim();
    const endTime = document.querySelector('input[name="endTime"]').value.trim();
    const category = document.getElementById("category").value.trim();
    const description = document.getElementById("description").value.trim();

    // Clear previous error messages
    document.querySelectorAll('.error-message').forEach(element => element.textContent = '');

    let isValid = true;

    // Check for empty fields
    if (!startTime || !endTime || !category || !description) {
        document.getElementById('error-missing-fields').textContent = "All fields are required.";
        isValid = false;
    }

    // Validate time order
    if (endTime <= startTime) {
        document.getElementById('error-time-order').textContent = "End Time must be later than Start Time.";
        isValid = false;
    }

    return isValid;
}
</script>
</head>
<body>
    <div class="container">
        <h1>Edit Task</h1>
        <%
            String taskId = request.getParameter("id");
            Task task = null;
            try (Connection connection = DatabaseConnection.getConnection()) {
                TaskDAO taskDAO = new TaskDAO(connection);
                task = taskDAO.getTaskById(taskId);
            } catch (SQLException e) {
                throw new ServletException("Unable to retrieve task details", e);
            }

            if (task == null) {
                out.println("<p class='error-message'>Task not found.</p>");
            } else {
        %>
        <form action="ManageTaskServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="<%=task.getId()%>">
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%=task.getDate()%>" readonly>
            
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%=task.getStartTime()%>" required>
            <span id="error-startTime" class="error-message"></span>
            
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%=task.getEndTime()%>" required>
            <span id="error-endTime" class="error-message"></span>
            
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%=task.getCategory()%>" required>
            <span id="error-category" class="error-message"></span>
            
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" value="<%=task.getDescription()%>" required>
            <span id="error-description" class="error-message"></span>
            
            <span id="error-missing-fields" class="error-message"></span>
            <span id="error-time-order" class="error-message"></span>
            
            <input type="hidden" name="action" value="update">
            <input type="submit" value="Update">
        </form>
        <a href="employeeHome.jsp" class="back-link">Back to Employee Home</a>
        <% } %>
    </div>
</body>
</html>
