<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Home</title>
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
	width: 300px;
	text-align: center;
}

h1 {
	margin-bottom: 20px;
	color: #333;
}

a {
	display: block;
	padding: 10px;
	margin: 10px 0;
	text-decoration: none;
	color: #007BFF;
	background-color: #e9ecef;
	border-radius: 4px;
	font-size: 16px;
	transition: background-color 0.3s, color 0.3s;
}

a:hover {
	background-color: #007BFF;
	color: white;
}

.footer {
	margin-top: 20px;
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>
			Welcome,
			<%= session.getAttribute("username") %>!
		</h1>
		<a href="addTask.jsp">Add Task</a> <a href="manageTasks.jsp">Manage
			Tasks</a> <a href="viewCharts.jsp">View Charts</a> <a href="logout">Logout</a>
	</div>
</body>
</html>
