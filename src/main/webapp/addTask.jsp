<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Task</title>
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
    margin-bottom: 15px;
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

.error {
    color: red;
    font-size: 14px;
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
    const projectName = document.getElementById("projectname").value.trim();

    // Check for empty fields
    if (!startTime || !endTime || !category || !description || !projectName) {
        alert("All fields are required.");
        return false;
    }

    // Prevent empty spaces in fields
    if (category.length === 0 || description.length === 0 || projectName.length === 0) {
        alert("Fields cannot be empty.");
        return false;
    }

    // Validate time order
    if (endTime <= startTime) {
        alert("End Time must be later than Start Time.");
        return false;
    }

    return true;
}

function setDefaultDate() {
    const today = new Date().toISOString().split('T')[0];
    const dateInput = document.getElementById("taskDate");
    dateInput.value = today;
    dateInput.setAttribute("readonly", true);
}
</script>
</head>
<body onload="setDefaultDate()">
    <div class="container">
        <h1>Add Task</h1>
        <form action="AddTaskServlet" method="post" onsubmit="return validateForm()">
            <label for="taskDate">Date:</label>
            <input type="date" id="taskDate" name="taskDate" required>
            
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" required>
            
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" required>
            
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>
            
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>
            
            <label for="projectname">Project Name:</label>
            <input type="text" id="projectname" name="projectname" required>
            
            <input type="submit" value="Add Task">
        </form>
        
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%=request.getAttribute("error")%></p>
        <% } %>
        
        <a href="employeeHome.jsp" class="back-link">Back to Employee Home</a>
    </div>
</body>
</html>
