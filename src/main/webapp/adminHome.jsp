<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
            font-weight: 600;
        }

        a {
            display: block;
            padding: 12px;
            margin: 10px 0;
            text-decoration: none;
            color: #007BFF;
            background-color: #f1f1f1;
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
            border: 1px solid #ddd;
        }

        a:hover {
            background-color: #007BFF;
            color: white;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
        <a href="registerEmployee.jsp">Register Employee</a>
        <a href="manageEmployees.jsp">Manage Employee Details</a>
        <a href="viewTasks.jsp">View Employee Tasks</a>
        <a href="logout.jsp">Logout</a>
        <div class="footer">
            <p>&copy; 2024 jayachandran</p>
        </div>
    </div>
</body>
</html>
