<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.employee.model.User"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Employee</title>
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

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.password-container {
	display: flex;
	align-items: center;
}

.password-container input[type="password"], .password-container input[type="text"] {
	flex: 1;
}

.password-container button {
	background: none;
	border: none;
	cursor: pointer;
	padding: 0 8px;
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

.back-to-dashboard {
	display: inline-block;
	margin-top: 20px;
	color: #007BFF;
	text-decoration: none;
	font-size: 16px;
}

.back-to-dashboard:hover {
	text-decoration: underline;
}

.error {
	color: red;
	font-size: 0.9em;
	margin-bottom: 10px;
}
</style>
<script>
function togglePasswordVisibility() {
	const passwordField = document.getElementById("password");
	const toggleButton = document.getElementById("togglePassword");
	if (passwordField.type === "password") {
		passwordField.type = "text";
		toggleButton.textContent = "Hide";
	} else {
		passwordField.type = "password";
		toggleButton.textContent = "Show";
	}
}

function validateForm() {
	const name = document.getElementById("name").value.trim();
	const username = document.getElementById("username").value.trim();
	const password = document.getElementById("password").value.trim();
	const errorMessage = document.getElementById("error-message");

	const passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})/;
	const nameUsernameRegex = /^[^\s]+$/;

	if (!name.match(nameUsernameRegex)) {
		errorMessage.textContent = "Name cannot contain spaces.";
		return false;
	}
	if (!username.match(nameUsernameRegex)) {
		errorMessage.textContent = "Username cannot contain spaces.";
		return false;
	}
	if (!password.match(passwordRegex)) {
		errorMessage.textContent = "Password must be at least 8 characters long and include at least one numeric character and one special character.";
		return false;
	}

	return true;
}
</script>
</head>
<body>
	<div class="container">
		<h1>Edit Employee Details</h1>
		<div id="error-message" class="error"></div>
		<% User user = (User) request.getAttribute("user"); %>
		<form action="ManageEmployeeServlet" method="post" onsubmit="return validateForm()">
			<input type="hidden" name="action" value="update">
			<label for="id">Employee ID:</label>
			<input type="text" id="id" name="id" value="<%=user.getEmpId()%>" readonly>

			<label for="name">Name:</label>
			<input type="text" id="name" name="name" value="<%=user.getName()%>">

			<label for="role" style="margin-right: 10px;">Role:</label>
			<select id="role" name="role" required style="padding: 10px; margin: 10px 0; border-radius: 5px; border: 1px solid #ccc;">
				<option value="Employee" <%= "Employee".equals(user.getRole()) ? "selected" : "" %>>Employee</option>
				<option value="Admin" <%= "Admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
			</select>

			<label for="username">Username:</label>
			<input type="text" id="username" name="username" value="<%=user.getUsername()%>">

			<label for="password">Password:</label>
			<div class="password-container">
				<input type="password" id="password" name="password" value="<%=user.getPassword()%>">
				<button type="button" id="togglePassword" onclick="togglePasswordVisibility()">Show</button>
			</div>

			<input type="submit" value="Update">
		</form>
		<div class="center">
			<a href="manageEmployees.jsp" class="back-to-dashboard">Back to Manage Employees</a>
		</div>
	</div>
</body>
</html>
