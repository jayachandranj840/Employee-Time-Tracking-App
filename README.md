Employee Management Application

Overview
The Employee Management Application is a web-based system designed to manage employee tasks and monitor productivity. The application allows admins to register employees and view charts of selected projects or employees on a daily, weekly, and monthly basis. Employees can add, edit, and delete task details they perform during the day. The system also ensures no duplicate entries for the same date and time and that the duration of any task does not exceed 8 hours.

Features
- Admin Privileges: Only admins can register new employees.
- Task Management: Employees can add, edit, and delete their task details.
- Charts: Admins can view daily tasks as pie charts and weekly/monthly tasks as bar charts.
- Validation: Ensures no duplicate task entries and task duration does not exceed 8 hours.

Technologies Used
- Frontend: JSP, HTML, CSS
- Backend: Java Servlets
- Database: MySQL
- Chart Library: Google Charts

Setup and Installation

Prerequisites
- Java Development Kit (JDK)
- Apache Tomcat
- MySQL Database
- Maven

Steps to Run the Application

1. Clone the Repository
   git clone https://github.com/yourusername/employee-management-app.git
   cd employee-management-app

2. Database Setup
   run the sql-db.txt in your sql workbench
3. Configure Database Connection
   Update the database connection settings in your db.properties file:
   db.url=jdbc:mysql://localhost:3306/employee_management
   db.username=root
   db.password=password

4. Build the Project
   Use Maven to build the project:
   mvn clean install

5. Deploy to Tomcat
   Copy the generated WAR file from the target directory to the webapps directory of your Tomcat installation.

   Start Tomcat server:
   cd /path/to/tomcat
   ./bin/startup.sh

6. Access the Application
   Open a web browser and navigate to http://localhost:8080/employee-management-app.

Usage

Admin
- Register Employee: Navigate to Register Employee from the admin dashboard to add new employees.
- View Charts: Navigate to View Employee Charts to see daily, weekly, and monthly task charts.

Employee
- Task Management: Navigate to Task Management to add, edit, or delete tasks.

Validation
- Duplicate Entries: The system prevents duplicate task entries for the same date and time.
- Task Duration: The system ensures that no task exceeds a duration of 8 hours.

 
