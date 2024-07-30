<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Employee</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

form {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #555;
}

input[type="text"], input[type="password"], select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

.input-container {
    position: relative;
    width: 100%;
}

.eye-icon {
    position: absolute;
    right: 10px;
    top: 40%;
    transform: translateY(-50%);
    cursor: pointer;
    font-size: 20px;
    color: #555;
    
}

input[type="submit"] {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 4px;
    background-color: #4CAF50;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.error-message {
    color: red;
    font-weight: bold;
    margin-bottom: 15px;
}

.success-message {
    text-align: center;
    color: green;
    font-weight: bold;
}

.back-link {
    display: block;
    margin-top: 20px;
    text-align: center;
    font-size: 16px;
    color: #007BFF;
    text-decoration: none;
    transition: color 0.3s;
}

.back-link:hover {
    color: #0056b3;
    text-decoration: underline;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script>
function validateForm() {
    let isValid = true;

    // Clear previous error messages
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(error => error.remove());

    // Get form elements
    const name = document.getElementById('name').value.trim();
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value;

    // Validate name
    if (name === "") {
        showError('name', 'Name is required and cannot be empty spaces.');
        isValid = false;
    }

    // Validate username
    if (username === "") {
        showError('username', 'Username is required and cannot be empty spaces.');
        isValid = false;
    }

    // Validate password
    if (password === "") {
        showError('password', 'Password is required.');
        isValid = false;
    } else if (/\s/.test(password)) {
        showError('password', 'Password cannot contain spaces.');
        isValid = false;
    } else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
        showError('password', 'Password must contain at least one special character.');
        isValid = false;
    } else if (password.replace(/[^0-9]/g, "").length < 3) {
        showError('password', 'Password must contain at least three numbers.');
        isValid = false;
    }

    return isValid;
}

function showError(inputId, message) {
    const inputElement = document.getElementById(inputId);
    const errorElement = document.createElement('p');
    errorElement.className = 'error-message';
    errorElement.innerText = message;
    inputElement.parentNode.insertBefore(errorElement, inputElement.nextSibling);
}

function togglePasswordVisibility() {
    const passwordInput = document.getElementById('password');
    const eyeIcon = document.getElementById('eye-icon');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        eyeIcon.classList.remove('fa-eye');
        eyeIcon.classList.add('fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        eyeIcon.classList.remove('fa-eye-slash');
        eyeIcon.classList.add('fa-eye');
    }
}
</script>
</head>
<body>
    <h1>Register Employee</h1>
    <form action="RegisterEmployeeServlet" method="post" onsubmit="return validateForm()">
        <label for="name">Name:</label> 
        <input type="text" id="name" name="name" required> 
            
        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Employee">Employee</option>
            <option value="Admin">Admin</option>
        </select>

        <label for="username">Username:</label> 
        <input type="text" id="username" name="username" required> 
        
        <label for="password">Password:</label>
        <div class="input-container">
            <input type="password" id="password" name="password" required>
            <i id="eye-icon" class="fas fa-eye eye-icon" onclick="togglePasswordVisibility()"></i>
        </div>

        <input type="submit" value="Register">
    </form>

    <% if (request.getAttribute("successMessage") != null) { %>
    <p class="success-message"><%= request.getAttribute("successMessage") %></p>
    <% } %>

    <a href="adminHome.jsp" class="back-link">Back to Admin Home</a>
</body>
</html>
