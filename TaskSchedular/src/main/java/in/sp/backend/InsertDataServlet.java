package in.sp.backend;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/InsertDataServlet")
public class InsertDataServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 String day = request.getParameter("currentday");
 String taskName = request.getParameter("taskName");
 String startTime = request.getParameter("startTime");
 String endTime = request.getParameter("endTime");
 

 String username = (String) request.getSession().getAttribute("user");
 
	Connection connection = null;
try {
 connection= DatabaseHelper.getConnection();
     String query = "INSERT INTO tasks (username, day, task_name, start_time, end_time) VALUES (?, ?, ?, ?, ?)";

     PreparedStatement preparedStatement = connection.prepareStatement(query);
     preparedStatement.setString(1, username);
     preparedStatement.setString(2, day);
     preparedStatement.setString(3, taskName);
     preparedStatement.setString(4, startTime);
     preparedStatement.setString(5, endTime);
     
     preparedStatement.executeUpdate();
     connection.commit();
     
     preparedStatement.close();
 }
catch (ClassNotFoundException e) {
	e.printStackTrace();
}catch (SQLException e) {
     e.printStackTrace();
 } finally {
     DatabaseHelper.closeConnection(connection);
 }
   response.sendRedirect("ViewDataServlet?currentday=" + day);

}
}