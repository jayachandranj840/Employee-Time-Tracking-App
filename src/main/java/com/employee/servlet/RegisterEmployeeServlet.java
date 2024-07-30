package com.employee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.employee.model.User;
import com.employee.util.DatabaseConnection;
import com.employee.util.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterEmployeeServlet")
public class RegisterEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name").trim();
		String role = request.getParameter("role").trim();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();

		// Server-side validation
		if (name.isEmpty() || role.isEmpty() || username.isEmpty() || password.isEmpty()) {
			request.setAttribute("errorMessage", "All fields are required and cannot be empty.");
			request.getRequestDispatcher("registerEmployee.jsp").forward(request, response);
			return;
		}

		if (password.contains(" ") || !password.matches(".*[!@#$%^&*(),.?\":{}|<>].*") || password.replaceAll("[^0-9]", "").length() < 3) {
			request.setAttribute("errorMessage", "Password must contain no spaces, at least one special character, and at least three numbers.");
			request.getRequestDispatcher("registerEmployee.jsp").forward(request, response);
			return;
		}

		// Hash the password
		String hashedPassword = com.employee.util.PasswordUtility.hashPassword(password);

		User user = new User();
		user.setName(name);
		user.setRole(role);
		user.setUsername(username);
		user.setPassword(hashedPassword); // Set the hashed password

		String employeeId;
		try (Connection connection = DatabaseConnection.getConnection()) {
			UserDAO userDAO = new UserDAO(connection);
			employeeId = userDAO.addUser(user);
		} catch (SQLException e) {
			request.setAttribute("errorMessage", "Unable to register employee: " + e.getMessage());
			request.getRequestDispatcher("registerEmployee.jsp").forward(request, response);
			return;
		}

		request.setAttribute("successMessage", "Employee registered successfully with ID: " + employeeId);
		request.getRequestDispatcher("registerEmployee.jsp").forward(request, response);
	}
}
